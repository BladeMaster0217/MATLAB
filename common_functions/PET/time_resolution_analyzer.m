function [ time_resolution ] = time_resolution_analyzer( coin_time1, coin_time2 )
%TIME_RESOLUTION Summary of this function goes here
%   Time Unit: ns
time_diff = coin_time1 - coin_time2;
time_bias = mean(time_diff);

[n,xbin] = hist(time_diff,100);
idx = n>0;

[ ft ] = fit_gaussian( xbin(idx),n(idx) );

figure
hold on
hist(time_diff,xbin)
xbin = ft.b1-ft.c1*4:0.1:ft.b1+ft.c1*4;
plot(xbin,ft(xbin),'r','linewidth',2)
time_resolution = ft.c1*1.665;
text(ft.b1+ft.c1*2,ft.a1*0.618,{['TR=' num2str(time_resolution, '%2.2f ns')];['Bias=',num2str(ft.b1, '%2.2f ns')]})
hold off
box on
grid on
xlabel('time difference(ns)')
ylabel('count')

end

