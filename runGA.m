
% import input variables into workspace
setInput()
% validate input
% TODO



% config
format longg

% calculate constants
singleVarSize = length(MTBF); % length of each solution vector
nvars = singleVarSize*2; % |y| + |rec|
lambda = arrayfun(@(mtbf) 1/mtbf, MTBF);
q = arrayfun(@(l) 1-exp(-l*T), lambda);
d_1 = MTBF./MTTR;

% y is an integer solution
integerIdxs = (1 : singleVarSize);

fillZero = zeros(1, singleVarSize);

% bounds
lb = zeros(1, nvars);
ub = [ones(1, nvars/2).*10 ones(1, nvars/2).*100];

% constraints
A = [designCost, fillZero; % (11)
    weight, fillZero; % (12)
    volume, fillZero; % (13)
    q.*cm, crec % (14)
    ];

b = [maxDesignCost; maxWeight; maxVolume; maxMaintenanceCost];

% load genetic algorithm options
loadGeneticAlgorithmConf

%'InitialPopulationMatrix', [4 3 3 4 4 9 37 37 6 6], ...
% 'PlotFcn','gaplotrange'

rng default % For reproducibility
ObjectiveFunction = @(x) fitness(x, I, d_1);

[solution, fval, exitflag, output] = ga(ObjectiveFunction,nvars,A,b,[],[],lb, ub, [], integerIdxs, options);
fval = -fval; % invert min to max problem

showResults


