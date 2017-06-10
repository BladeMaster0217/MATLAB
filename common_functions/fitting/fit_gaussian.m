function [ ft ] = fit_gaussian( varargin )
%FIT_GAUSSIAN Summary of this function goes here
%   Detailed explanation goes here

narginchk(1,inf);
[cax,args,nargs] = axescheck(varargin{:});
y = args{1};
if nargs == 1
    disp('fit: input error');
elseif nargs == 2
    x = args{1};
    y = args{2};
    ft = fit(x',y','gauss1');
else
    x = args{1};
    y = args{2}; 
    limitation = args{3}; 
    idx = x>limitation(1) & x<limitation(2);
    ft = fit(x(idx)',y(idx)','gauss1');
end

end

