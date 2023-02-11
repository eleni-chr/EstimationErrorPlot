function [mse,R,p,rg] = EstimationErrorPlot(prediction,target)

% Function written by Eleni Christoforidou in MATLAB R2022b.

% This function takes as input an [Mx1] vector prediction and an [Mx1] 
% vector target. It returns the mean squared error mse between the 
% prediction and the target vectors, the correlation R and statistical 
% significance p-value from computing Pearson's correlation coefficient, 
% and the range of the data rg used to draw the diagonal of the plot.

% Compute mean squared error
mse = mean((prediction - target) .^ 2);

% Compute Pearson's correlation coefficient and p-value
[R, p] = corr(prediction, target);

% Compute range of data
rg = [min(target) max(target)];

% Plot the results
figure;
scatter(target, prediction);
hold on;
plot([min(target) max(target)], [min(target) max(target)], 'r-');
xlabel('Target');
ylabel('Prediction');
title(sprintf('Mean Squared Error: %f\nCorrelation: R=%f, p=%f', mse, R, p));
end