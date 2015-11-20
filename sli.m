function sli(cube,sliceNum)
% SLI Plot a slice of a cube w/ imagesc
%   If no slice is given, defaults to the first slice.
    if nargin < 2
        sliceNum = 1;
    end
    imagesc(cube(:,:,sliceNum));
end
