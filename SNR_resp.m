% SNR calculation for respiration data
% filter 1: https://ieeexplore.ieee.org/document/9214478
% filter 2: https://www.nature.com/articles/s41746-020-0307-6
% fllter 3: https://onlinelibrary.wiley.com/doi/full/10.1111/j.1469-8986.2005.00363.x
% 
cd 'T:\PROJECTS\anxiety_detection\Moe\Time-series-Data'
files = dir('*.mat');

% subjects = [];
% snr_resp1 = [];
% snr_resp2 = [];
% snr_resp3 = [];
% 
% for k = 1:length(files)
%     x = load(files(k).name, 'data');
%     fprintf('\n');
%     fprintf(files(k).name);
%     fprintf('\t');
%     subjects = [subjects, k];
%     resp = x.data(:, 2);
%     [b,a]=butter(3,[0.05,1]/(500/2),'bandpass');
%     resp_filt1 = filter(b, a, resp);
%     [b,a]=butter(3,[0.05,0.8]/(500/2),'bandpass');
%     resp_filt2 = filter(b, a, resp);
%     [b,a]=butter(3,[0.05,0.5]/(500/2),'bandpass');
%     resp_filt3 = filter(b, a, resp);
% %     resp_filt2 = bandpass(resp, [0.05, 1.0], 500); % this takes very long
% %     to run
% %     resp_filt2 = bandpass(resp, [0.05, 0.8], 500);
% %     resp_filt3 = bandpass(resp, [0.05, 0.5], 500);
%     snr_1 = snr(resp_filt1, resp-resp_filt1);
%     snr_2 = snr(resp_filt1, resp-resp_filt2);
%     snr_3 = snr(resp_filt3, resp-resp_filt3);
%     disp(snr_1)
%     fprintf('\t');
%     disp(snr_2)
%     fprintf('\t');
%     disp(snr_3)
%   
%     snr_resp1 = [snr_resp1, snr_1];
%     snr_resp2 = [snr_resp2, snr_2];
%     snr_resp3 = [snr_resp3, snr_3];
% end

tab = table(subjects.', snr_resp1.', snr_resp2.', snr_resp3.');
    
close all
filename = files(1).name;
x = load(filename);

y = x.data(:,2);
% y_filt = bandpass(y, [0.05, 1], 500);
[b,a] = butter(2,[0.05,1]/(500/2),'bandpass');
y_filtbw = filter(b,a,y);

plot(y-mean(y), 'b')
hold on
plot(y_filtbw, 'r')
legend('raw', 'bandpass BW 2')

% disp(snr(y, y-y_filt));
disp(snr(y, y-y_filtbw));
        
  


