function [n_mat] = draw_floodimage( xs,ys,xyGrid )
%DRAW_FLOODIMAGE Summary of this function goes here
%   Detailed explanation goes here

num_pixel = size(xyGrid,2)-1;
n_mat = zeros(num_pixel,num_pixel);
for ii_x = 1:num_pixel
    idx = xs>xyGrid(ii_x) & xs<xyGrid(ii_x+1);
    sub_ys = ys(idx);
for ii_y = 1:num_pixel
    idy = sub_ys>xyGrid(ii_y) & sub_ys<xyGrid(ii_y+1);
    n_mat(ii_x,ii_y) = sum(idy);
end
end

colormap jet
imagesc(log(n_mat))
axis equal
box off
grid off
set(gca,'Visible','off')
end

