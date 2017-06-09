function [ raw_data_bin ] = getUartPackage( h_serial,UART_TX_PACKAGE_NUM )
%GETRAWDATA Summary of this function goes here
%   Detailed explanation goes here

n = get(h_serial,'BytesAvailable');
if(n>UART_TX_PACKAGE_NUM*3)
    uart_raw_data = fread(h_serial, floor(n/(UART_TX_PACKAGE_NUM+1))*(UART_TX_PACKAGE_NUM+1), 'uchar');
    [ raw_data_bin ] = unpackUartData( uart_raw_data,UART_TX_PACKAGE_NUM );
else
    raw_data_bin = [];
end
end

