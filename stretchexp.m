function [ B ] = stretchexp(A,varargin)
%STRETCHEXP Summary of this function goes here
%   Exponentially scales a matrix A so that an interval given
%   in varargin 1 is transformed into that given in argument 2. If only 1
%   interval argument is given, the interval to transform from is taken to
%   be [min(A(:)) max(A(:))].
% A function is used of the form y = exp(alpha*x + beta).

% TODO: could use more checking for error conditions.

if nargin == 2 % only A and one interval (in this case the "to" interval)
    B = stretchexp(A, [min(A(:)) max(A(:))], varargin{1});
    return;
end

% 2-arg case: apply the linear transformation
fromInterval = varargin{1};
toInterval = varargin{2};

alpha = log(toInterval(2)/toInterval(1)) / (fromInterval(2)-fromInterval(1));
beta = log(toInterval(1)) - alpha * fromInterval(1);

B = exp(A.*alpha + beta);

end
