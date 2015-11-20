function [ B ] = stretch(A,varargin)
%STRETCH Summary of this function goes here
%   Linearly scales a matrix A so that an interval given
%   in varargin 1 is transformed into that given in argument 2. If only 1
%   interval argument is given, the interval to transform from is taken to
%   be [min(A(:)) max(A(:))].

% TODO: could use more checking for error conditions.

if nargin == 2 % only A and one interval (in this case the "to" interval)
    B = stretch(A, [min(A(:)) max(A(:))], varargin{1});
    return;
end

% 2-arg case: apply the linear transformation
fromInterval = varargin{1};
toInterval = varargin{2};

slope = (toInterval(2)-toInterval(1)) / (fromInterval(2)-fromInterval(1));

B = slope * ( A - fromInterval(1) ) + toInterval(1);

end
