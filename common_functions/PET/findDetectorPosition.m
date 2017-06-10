%%
clc
close all
restoredefaultpath
addpath('U:\S172330\work\common_functions\PET');
addpath('U:\S172330\work\common_functions\fitting');
x = 102:1:128;
y = fit_curve(x);
plot(x,y)
yi_pool = min(y):max(y);
for ii_yi = 1:size(yi_pool,2)
    yi = yi_pool(ii_yi);
    idx_start = find(y >= yi,1,'first');
    idx_end = find(y >= yi,1,'last');
    width(ii_yi) =  x(idx_end) - x(idx_start);
end
idx = find(width<=20,1,'first');
    ii_yi = idx;
    yi = yi_pool(ii_yi);
    idx_start = find(y >= yi,1,'first');
    idx_end = find(y >= yi,1,'last');
    center =  0.5*(x(idx_end) + x(idx_start));
    
    crystal_height = max(y);
    line([center-10,center+10],[crystal_height crystal_height],'linewidth',1,'linestyle','--')
    line([center-10,center-10],[0 crystal_height],'linewidth',1,'linestyle','--')
    line([center+10,center+10],[0 crystal_height],'linewidth',1,'linestyle','--')
    line([center,center],[0 crystal_height*1.05],'linewidth',1,'linestyle','-.','color','r')
    text(center+1,crystal_height*0.5,['center=' num2str(center) 'mm'])
box on
grid on
fig_position = get(gcf,'Position');
fig_position(3:4) = [600 200];
set(gcf,'Position',fig_position);
xlabel('z/mm')
ylabel('Count')
%

clc
x = 102:0.05:128;
y = fit_curve(x)';
y_diff = diff(y);
y_diff = y_diff/max(y_diff)*max(y)/3;
[ ft_1 ] = fit_gaussian( x,y_diff,[90 100] );
[ ft_2 ] = fit_gaussian( x,y_diff,[110 120] );
hold on
%plot(x(1:end-1),y_diff)
xbin = ft_1.b1-ft_1.c1*2:0.1:ft_1.b1+ft_1.c1*2;
plot(xbin,ft_1(xbin),'r','linewidth',1)

xbin = ft_2.b1-ft_2.c1*2:0.1:ft_2.b1+ft_2.c1*2;
plot(xbin,-ft_2(xbin),'r','linewidth',1)
text(center-19,crystal_height*0.5,['FWHM=' num2str(ft_1.c1*1.665,'%2.2f') 'mm'])
hold off