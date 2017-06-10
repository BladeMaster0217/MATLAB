function [ xs,ys,idx_good ] = event_position( channeldata )
%EVENT_POSITION Summary of this function goes here
%   Detailed explanation goes here
%    channeldata = channeldata(:,[1:8 12:-1:9 16:-1:13]);
    %channeldata = channeldata.^1;
    
    n_events = size(channeldata,1);
    cols = zeros(n_events,4);
    rows = zeros(n_events,4);
    for ii = 1:4
        cols(:,ii) = sum(channeldata(:,ii:4:end),2);
        rows(:,ii) = sum(channeldata(:,(1:4)+(ii-1)*4),2);
    end
    %
    img_matrix = [-3 -1 1 3]/3;

    thd = 0.001;
    idx_good = sum(cols>thd,2)>1 & sum(rows>thd,2)>1;
    
    xs = sum(cols .* repmat(img_matrix,n_events,1),2)./sum(cols,2);
    ys = sum(rows .* repmat(img_matrix,n_events,1),2)./sum(rows,2);

end

