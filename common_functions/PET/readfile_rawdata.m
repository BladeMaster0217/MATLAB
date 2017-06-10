function [dlevel_id,asic_id,event_time,channel_data] = readfile_rawdata(filename)
fp = fopen(filename,'r');
ftell(fp);
fseek(fp,0,'eof');
sizeA = ftell(fp);
fseek(fp,0,'bof');
rawdata = fread(fp,sizeA,'*ubit8');
fclose(fp);

rawdata_bin_8 = dec2bin(rawdata,8);
rawdata_bin_8_lr = fliplr(rawdata_bin_8(:,:)');

rawdata_bin_8_test = flipud(reshape(rawdata_bin_8_lr,256,[])');
%=======================================
dlevel_id = bin2dec(rawdata_bin_8_test(:,1:12)) ;
%=======================================
asic_id = bin2dec(rawdata_bin_8_test(:,13:16)) ;
%=======================================
Main_CLK = 200*10^6; % Unit: Hz
CLK_PERIOD = 10^9/Main_CLK; % Unit: ns
event_time = bin2dec(rawdata_bin_8_test(:,17:64)) * CLK_PERIOD; % Unit: ns
%=======================================
data_bin = rawdata_bin_8_test(:,65:256)';
data_bin_12 = reshape(data_bin,12,[])';
channel_data = reshape(bin2dec(data_bin_12),16,[])';


    
dlevel_id = dlevel_id(65:end);
asic_id = asic_id(65:end);
event_time = event_time(65:end);
channel_data = channel_data(65:end,:);
channel_data = fliplr(channel_data);
end

%%
%
