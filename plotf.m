function plotf( functStrings, x )
%PLOTFUNCT Plot functions (described as string cells w/ x as param) over a range
%   Detailed explanation goes here

    % conversion from a single string to the cell structure
    % the next part expects
    if ~iscell(functStrings)
        str = functStrings;
        functStrings = cell(1);
        functStrings{1} = str;
    end
    
    for i=1:length(functStrings)
        y(i,:) = eval(functStrings{i});
    end
    
    plot(x,y);
end
