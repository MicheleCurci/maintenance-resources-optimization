% System data

MTBF = [500 550 600 750 500]; % mean time between fail
MTTR = [50 35 40 30 30]; % mean time to repair
designCost = [50 55 55 40 60];
weight = [50 45 80 35 70];
volume = [55 50 70 35 65];
cm = [60 40 45 30 50]; % Corrective maintenance cost
crec = [7 3 4 2 5]; % Corrective maintenance resources cost

% System parameters

maxDesignCost = 1000;
maxWeight = 1000;
maxVolume = 1000;
maxMaintenanceCost = 500;

% parameters

T = 100; % time units (the same unit as MTBF and MTTR)
I = 3.5; % impact of maintenance resources in the dependability ratio