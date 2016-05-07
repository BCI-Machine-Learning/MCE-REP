%% Machine Learning on EEG data and its optimization
%% Code fragments taken from www.courseera.org
%
% Instructions
%--------------
% This file contains code that helps you get started on the loading and plotting of eeg data
%exercise. The functions used are:
%
%%     sigmoid.m
%     costFunction.m
%     predict.m
%

%% Initialization
clear ; close all; clc
%
%% Load Data
%  
duration = 50;
data = ['C:\Users\deepika&radhika\Documents\webinar\Vivek_Visual.csv'];
file = xlsread(data);


%% ==================== Plotting ====================
%  We start the exercise by first plotting the data to understand the 
%  the problem we are working with.

y = file(1:duration, 5); X = 1:duration;
X = X';
axis([0 100 1 duration]);
plot(X ,y);
%

%% =============  Optimizing using fminunc  =============
%  In this exercise, you will use a built-in function (fminunc) to find the
%  optimal parameters theta.

[m, N] = size(X);

% Add intercept term to x and X_test
X = [ones(m, 1) X];

% Initialize fitting parameters
initial_theta = zeros(N + 1, 1);


%  Set options for fminunc
options = optimset('GradObj', 'on', 'MaxIter', 400);

%%
%  Run fminunc to obtain the optimal theta
%  This function will return theta and the cost 
[theta, cost] = fminunc(@(t)(costFunction(t, X, y)), initial_theta, options);

fprintf(f2,'\t\t\tCost at theta: %f\n',cost);
fprintf(f2,'\ttheta: \n');
fprintf(f2,' \t%f \n', theta);

 % % Plot Boundary
 plotDecisionBoundary(theta, X, y1);
 
%% fminsearch to solve unconstrained nonlinear problem
[theta,cost] = fminsearch(@(T)(costFunction(T, X, y1)), initial_theta,options);

fprintf(f3,'\t\t\tCost at theta: %f\n',cost);
 fprintf(f3,'\ttheta: \n');



