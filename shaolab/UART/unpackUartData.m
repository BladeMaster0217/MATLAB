function [ raw_data_bin ] = unpackUARTData( uart_raw_data,package_size )
%UNPACKUARTDATA Summary of this function goes here
%   Detailed explanation goes here

%
UART_TX_PACKAGE_NUM = package_size;
for ii=1:200
    if(uart_raw_data(ii)==252&&uart_raw_data(ii+UART_TX_PACKAGE_NUM+1)==252&&uart_raw_data(ii+(UART_TX_PACKAGE_NUM+1)*2)==252)
        break;
    end
end
idx_start = ii+1;
raw_data_selected = uart_raw_data(idx_start:end);
idx_end = floor(size(raw_data_selected,1)/(UART_TX_PACKAGE_NUM+1))*(UART_TX_PACKAGE_NUM+1);
raw_data_selected=raw_data_selected(1:idx_end);

%
raw_data_mat = reshape(raw_data_selected,(UART_TX_PACKAGE_NUM+1),[]);
%
raw_data_mat = raw_data_mat(1:UART_TX_PACKAGE_NUM,:);

%
raw_data_bin = flipud(dec2bin(raw_data_mat(:,:),8)');
raw_data_bin = reshape(raw_data_bin,UART_TX_PACKAGE_NUM*8,[])-48;

end

