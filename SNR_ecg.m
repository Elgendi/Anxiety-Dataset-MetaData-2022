% SNR calculation for ECG data
% filter 1: https://ieeexplore.ieee.org/stamp/stamp.jsp?tp=&arnumber=1588216
% filter 2: https://www.researchgate.net/publication/224628153_Savitzky-Golay_least-squares_polynomial_filters_in_ECG_signal_processing
% fllter 3: https://ieeexplore.ieee.org/stamp/stamp.jsp?tp=&arnumber=6331560

cd 'T:\PROJECTS\anxiety_detection\Moe\Time-series-Data'
files = dir('*.mat');

% subjects = [];
% snr_ecg1 = [];
% snr_ecg2 = [];
% snr_ecg3 = [];
% 
% for k = 1:length(files)
%     x = load(files(k).name, 'data');
%     fprintf(files(k).name);
%     fprintf('\n');
%     subjects = [subjects, k];
%     ecg = x.data(:, 1);
%     ecg_filt1 = sgolayfilt(ecg, 4, 17);
%     ecg_filt2 = sgolayfilt(ecg, 6, 21);
%     ecg_filt3 = sgolayfilt(ecg, 3, 7);
%     snr_1 = snr(ecg_filt1, ecg-ecg_filt1);
%     snr_2 = snr(ecg_filt2, ecg-ecg_filt2);
%     snr_3 = snr(ecg_filt3, ecg-ecg_filt3);
%     snr_ecg1 = [snr_ecg1, snr_1];
%     snr_ecg2 = [snr_ecg2, snr_2];
%     snr_ecg3 = [snr_ecg3, snr_3];
% end
% 
% tab = table(subjects.', snr_ecg1.', snr_ecg2.', snr_ecg3.');
    
close all
filename = files(1);

y = x.data(:,1);
y_filt = sgolayfilt(y, 3, 21);
 
t = [1:length(y)]/500;
plot(y-mean(y), 'b')
hold on
plot(y_filt, 'r')
snr(y, y-y_filt)
        
  


