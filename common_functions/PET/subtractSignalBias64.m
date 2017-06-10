function [ channeldata_tmp,channel_signalBias ] = subtractSignalBias64( channeldata )
%SUBTRACTSIGNALBIAS Summary of this function goes here
%   Detailed explanation goes here
channeldata_tmp = channeldata;
channel_signalBias = zeros(64,1);
signal_THD =50;
for ii_channel = 1:64
%    hist(channeldata(:,ii_channel),1000)
    idx_validSignal = channeldata(:,ii_channel)>signal_THD;
    if(sum(idx_validSignal)>100)
        [n,xbin] = hist(channeldata(idx_validSignal,ii_channel),100);
        nratio = cumsum(n)/sum(n);
        idx = find(nratio>0.05,1,'first');
        channel_signalBias(ii_channel) = xbin(idx)+signal_THD*0.01;
    else
        channel_signalBias(ii_channel) = 0;
    end
    channeldata_tmp(idx_validSignal,ii_channel) = channeldata_tmp(idx_validSignal,ii_channel) - channel_signalBias(ii_channel) ;
    channeldata_tmp(~idx_validSignal,ii_channel) = 0 ;

    
end

idx = channeldata_tmp<0;
channeldata_tmp(idx)=0;
end

%%
