close all
clc
clear all

% For reproducibility of the results
rng('default')

% Globals used in functions
global sx mumeas w N mu epsilon C a b mu0min mu0max
%%
% Shear Modulus of rigidity in pa
G = 8*10^10;
% Contact Patch
a  = 0.001837;
b  = 0.002080;
nu = 0.3; % Poisson Ratio
%%
% Kalker's Coefficients c11
abratio = b/a;
k1      =  2.3464 + 1.5443*nu + 7.9577*(nu^2);
k2      =  0.961669 - 0.043513*nu + 2.402357*(nu^2);
k3      = -0.0160185 + 0.0055475*nu - 0.0741104*(nu^2);
k4      =  0.10563 + 0.61285*nu - 7.26904*(nu^2);
c11     =  (k1) + (k2/(abratio)) + (k3/(abratio^2)) + (k4/sqrt(abratio));
C       = 3/8*(G/a)*c11;
gamma   = 0.0573;       % in radians
Q       = 4269;         % in Newtons
N       = Q/cos(gamma); % in Newtons
%%
% Measurements for dry conditions
load('measurement')
% Translational speed
vw = 5/3.6;
% Slip velocity
w = vw .* sx;
%% Particle Initialization
% Number of particles
nop  = 30;
% Dimension
dim  = 5;
% Repetitions
reps = 30;
% Number of iterations
nIter = 500;

% Static Friction Coefficient Limits
mu0min = 0.02;
mu0max = 0.7;

% Preallocate arrays
x         = zeros(nop, dim);
pBest     = zeros(nop, dim);
gbestall  = zeros(reps, dim);
fgbestall = zeros(reps, 1);
pindx = 1;

% Precompute random numbers
randVals = rand(nop, nIter, dim); % Preallocate all random values

% Repetitions
for y = 1:reps
    %% Position and distance initialization
    % Positions are uniformly distributed in search space
    x(:,1)   = (randVals(:,1,1)) .* (mu0max - mu0min) + mu0min;
    x(:,2:5) = randVals(:,1,2:5); % for the other columns, just use random values directly

    %% Objective evaluation
    f = zeros(nop, 1);
    for i = 1:nop
        x(i,:) = checkx(x(i,:));
        f(i,1) = func(x(i,:));
    end
    costIdx = x(:,4) < x(:,5);
    f(costIdx) = 10^20;

    % MBBPSO notation
    pBest = x; % location of the local best.
    fp    = f; % cost of local best.

    % Initialize the global solution.
    [fg, indx] = min(f);
    gBest      = x(indx,:);

    pindx = 1;
    % Iterations
    for k = 1:nIter
        if pindx < 2
            d = normrnd(0, 1, nop, dim) .* abs(x - gBest); % Normally distributed random numbers
            x = 0.5 * (x + gBest) + d;
            pindx = pindx + 1;
        else
            d = unifrnd(-1, 1, nop, dim) .* abs(x - gBest); % Uniformly distributed random numbers
            x = pBest + d;
            pindx = 1;
        end

        % Objective evaluation
        for i = 1:nop
            x(i,:) = checkx(x(i,:));
            f(i,1) = func(x(i,:));
        end
        costIdx    = x(:,4) < x(:,5);
        f(costIdx) = 10^20;

        % pBest and gBest determination
        bc = f < fp;
        fp = fp .* not(bc) + f .* bc;
        pBest(bc,:) = x(bc,:);

        % Update the global solution per each iteration
        [temp, idx] = min(fp);
        if temp < fg
            gBest = x(idx,:);
            fg = temp;
        end
    end

    % Record the best values for each repetition
    gbestall(y,:)  = gBest;
    fgbestall(y,1) = fg;
end

%% Determine the best solution found amongst repetitions
[fgbest, idx] = min(fgbestall);
gbestpos      = gbestall(idx,:);

% Best value is written to message box
msgbox({sprintf('Best f Value = %2.10d,\n', fgbest)});
%% This part includes the calculation of adhesion for plotting
mu = gbestpos(1,1).*((1-gbestpos(1,2)).*exp(-gbestpos(1,3).*w)+gbestpos(1,2));
% Gradient of tangential stress in the area of adhesion
epsilon = (2/3).*((C.*pi.*((a).^2).*(b))./(N.*mu)).*sx;
% Creep Force
Fx = -((2.*N.*mu)/(pi)).*(((gbestpos(1,4).*epsilon)./...
    (1+(gbestpos(1,4).*epsilon).^2))+atan(gbestpos(1,5).*epsilon));
%%
figure(1)
plot(sx, -(Fx ./ N), 'LineWidth', 1, 'Color', 'k') % Model
hold on
grid on
plot(sx, mumeas, '-.', 'LineWidth', 1, 'Color', 'k') % Measurement
hold on
xlim([0 max(sx)])
ylim([0 0.4])
title('Adhesion Model')
xlabel('Creepage')
ylabel('Coefficient of Adhesion (COA)')

% Add legend
legend('Model (MBBPSO Result)', 'Measurement', 'Location', 'best')
