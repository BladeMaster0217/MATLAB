function [ xs,ys,idx_good ] = event_position64( channeldata )
%EVENT_POSITION Summary of this function goes here
%   Detailed explanation goes here
%idx = [6	5	3	2	18	19	21	22	8	7	4	1	17	20	23	24	13	14	12	9	25	28	30	29	15	16	11	10	26	27	32	31	34	33	38	39	55	54	49	50	36	35	37	40	56	53	51	52	46	45	42	39	64	62	59	57	44	43	41	40	64	63	61	60];
%idx = [6	5	3	2	18	19	21	22	8	7	4	1	17	20	23	24	13	14	12	9	25	28	30	29	15	16	11	10	26	27	32	31	34	33	38	39	55	54	49	50	36	35	37	40	56	53	51	52	46	45	42	39	64	61	58	57	44	43	41	40	63	62	60	59];
%idx = [44	43	41	40	63	62	60	59	46	45	42	39	64	61	58	57	36	35	37	40	56	53	51	52	34	33	38	39	55	54	49	50	15	16	11	10	26	27	32	31	13	14	12	9	25	28	30	29	8	7	4	1	17	20	23	24	6	5	3	2	18	19	21	22];
%channeldata = channeldata(:,idx);
    %channeldata = channeldata.^1;

% This file is modified to support detector 64    

%    channeldata = channeldata(:,idx);
    
    n_events = size(channeldata,1);
    cols = zeros(n_events,8);
    rows = zeros(n_events,8);
    for ii = 1:8
        cols(:,ii) = sum(channeldata(:,ii:8:end),2);
        rows(:,ii) = sum(channeldata(:,(1:8)+(ii-1)*8),2);
    end
    %
    img_matrix = [-7 -5 -3 -1 1 3 5 7]/7;

    thd = 0.01;
    idx_good = sum(cols>thd,2)>1 & sum(rows>thd,2)>1;
    
    xs = sum(cols .* repmat(img_matrix,n_events,1),2)./sum(cols,2);
    ys = sum(rows .* repmat(img_matrix,n_events,1),2)./sum(rows,2);

end

