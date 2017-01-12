% M_MEM_LMEM_Parameter_Dynamics_Results
% Andrija Mihoci

% * This programming code estimates the parameters for a given stock
%   See line 15: 1 for AAPL, 2 for CSCO, 3 for INTC, 4 for MSFT, 5 for ORCL
% * Only for one stock and only the EACD model, it takes at least 85257.4
%   seconds, i.e, 23:40:57 (hh:mm:ss)
% * For the WACD model uncomment the respective lines: 24, 29, 33 and 36

clear all; clc;

%% Data: Load

y_ALL = load('ALL5_2008_Volume1_Adjusted360_M6');
D = 215;
i = 3;                       % INTC
y_INTC = y_ALL(:, i);

%% Estimation: Run

tic;

y = zeros(2160, D); mu = zeros(D, 1);
INTC_EACD_Th = zeros(30, 360, D);
INTC_WACD_Th = zeros(36, 360, D); 
for d = 1 : 1 : D
  y(:, d) = y_INTC(((d - 1) * 360 + 1) : (d * 360 + 1800));
  mu(d) = sum(y(:, d)) / length(y(:, d));
  INTC_EACD_Th(:, :, d) = EACD_Estimation_Day(y(:, d), mu(d));
  INTC_WACD_Th(:, :, d) = WACD_Estimation_Day(y(:, d), mu(d));
end

INTC_EACD_Theta = reshape(INTC_EACD_Th, 30 * 360, D); save('INTC_EACD_Theta', 'INTC_EACD_Theta', '-ascii');
INTC_WACD_Theta = reshape(INTC_WACD_Th, 36 * 360, D); save('INTC_WACD_Theta', 'INTC_WACD_Theta', '-ascii');

%save('INTC_EACD_Th.mat');
%save('INTC_WACD_Th.mat');

toc;


