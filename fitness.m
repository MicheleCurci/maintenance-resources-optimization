% fitness function
function z = fitness(x, I, d_1) % constraint 17

y = x(1:length(x)/2);
rec = x(length(x)/2 + 1 : end);

denominator = 1+((I-1).*rec +1).*d_1;
z = -prod(1-(1./denominator).^y);
end
