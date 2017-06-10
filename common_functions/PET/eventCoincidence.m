function [ coinpair ] = eventCoincidence( detector1_data, detector2_data,bias,coincidence_window)
%EVENTCOINCIDENCE Summary of this function goes here
%   Detailed explanation goes here
ii_ASIC1 = 1;
ii_ASIC3 = 1;
ii_coin = 1;
coinpair = [];
while (ii_ASIC1<size(detector1_data,1) && ii_ASIC3<size(detector2_data,1))%
%    [ii_ASIC1 ii_ASIC3]
    time1 = detector1_data(ii_ASIC1,17);
    time3 = detector2_data(ii_ASIC3,17);
    if(abs(time1-time3-bias)<coincidence_window)
        coinpair(ii_coin,:) = [ii_ASIC1,ii_ASIC3];
        ii_coin = ii_coin+1;
        ii_ASIC1 = ii_ASIC1+1;
        ii_ASIC3 = ii_ASIC3+1;
    elseif(time1-time3)>0
        ii_ASIC3 = ii_ASIC3+1;
    else
        ii_ASIC1 = ii_ASIC1+1;
    end
end  

end

