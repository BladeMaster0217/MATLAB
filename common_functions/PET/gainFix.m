function [ channeldata ] = gainFix( channeldata )
%GAINFIX Summary of this function goes here
%   Detailed explanation goes here
%gain_para = max(channeldata,[],1);
gain_para = mean(channeldata,1);

idx = gain_para <0.01;
gain_para(idx) = 1;
gain_para = gain_para/mean(gain_para);
channeldata = channeldata./repmat(gain_para,size(channeldata,1),1);
end

