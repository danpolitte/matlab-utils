function [xValues, yValues] = generate_cumulative(A,num_bins)
% Generates a graphable cumulative distribution from a set of scores.
% Each row of the scores is treated as a different dataset to graph.
%
% Returns the X and Y values of the cumulative distribution for graphing.

maxValue = max(max(A));

xValues = linspace(0,maxValue,num_bins);
yValues = nan(size(A,1),num_bins);

for i=1:num_bins
    yValues(:,i) = sum(A<=xValues(i),2);
end

yValues = yValues ./ size(A,2); % normalization

end
