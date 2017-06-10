function draw_fit_gaussian( ft,ratio_FWHM )
%DRAW_FIT_GAUSSIAN Summary of this function goes here
%   Detailed explanation goes here
hold on
    center = ft.b1;
    peak = ft.a1;
    FWHM = ft.c1*1.665;
    x_left = center - FWHM*ratio_FWHM;
    x_right = center + FWHM*ratio_FWHM;
    xbin = x_left:0.001:x_right;
    plot(xbin,ft(xbin),'r','linewidth',2)
    text(center+FWHM*2,peak*0.618,{['center=' num2str(center,'%.2f') 'ns']; ['FWHM=' num2str(FWHM,'%.2f') 'ns']},'HorizontalAlignment','left','FontSize',30)
    line([center center],[0 peak*1.1],'color','r','linestyle','--','linewidth',1.5)
    
hold off

end

