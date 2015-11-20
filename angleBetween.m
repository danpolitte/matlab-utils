function [ alpha ] = angleBetween( a, b )
%ANGLEBETWEEN Summary of this function goes here
%   Detailed explanation goes here
     alpha = acos(dot(a,b)/norm(a)/norm(b));

end
