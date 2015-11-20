function [ multIndexVect ] = nindex( singleIndex, sizeVect )
%NINDEX Obtain the N-ary index of positions in an ND matrix
%   A function to convert from the single indices given by functions such
%   as find() to N-ary ones. Intended to help users get an intuitive idea
%   of position of element, as is useful when the individual indices have
%   semantic value.
%   Also supports singleIndex being a column vector, in which case a matrix
%   is returned with the rows being the N-ary indices for each given single
%   index.

    numDimensions = length(sizeVect);
    numTrials = size(singleIndex,1); % number of parallel 

    multIndexVect = zeros(numTrials,numDimensions);

    for n = numDimensions:-1:2
        % find # of els in the (n-1)D slice of the whole matrix that we're
        % considering
        elsPerSlice = prod(sizeVect(1:n-1));
        
        multIndexVect(:,n) = ceil(singleIndex/elsPerSlice);
        
        % reduced as we "project" down into a space with one fewer
        % dimension. The addition and subtraction is necessary in this
        % indexed-from-one environment.
        singleIndex = mod(singleIndex-1,elsPerSlice)+1; 
    end
    
    % When considering only one dimension, the singleIndex reflects our
    % last index.
    multIndexVect(:,1) = singleIndex; 
end
