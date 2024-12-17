function f = func(x)
global sx mumeas w N mu epsilon C a b
%% Objective values for each moray is being calculated
mu = x(:,1).*((1-x(:,2)).*exp(-x(:,3).*w)+x(:,2));
% Gradient of tangential stress in the area of adhesion
epsilon = (2/3).*((C.*pi.*((a).^2).*(b))./(N.*mu)).*sx;
% Creep Force
Fx = -((2.*N.*mu)/(pi)).*(((x(:,4).*epsilon)./...
    (1+(x(:,4).*epsilon).^2))+atan(x(:,5).*epsilon));
mupar = -(Fx./N);
f = rms((mupar-mumeas));
end