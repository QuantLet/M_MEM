[<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/banner.png" width="888" alt="Visit QuantNet">](http://quantlet.de/)

## [<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/qloqo.png" alt="Visit QuantNet">](http://quantlet.de/) **M_MEM_LMEM_Parameter_Dynamics_Results** [<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/QN2.png" width="60" alt="Visit QuantNet 2.0">](http://quantlet.de/)

```yaml

Name of Quantlet: M_MEM_LMEM_Parameter_Dynamics_Results

Published in: Local Adaptive Multiplicative Error Models for High-Frequency Forecasts

Description: 'Estimated EACD(1, 1) parameters and functions thereof based on
seasonally adjusted 1-minute trading volumes for all selected stocks at each minute from 22 February to
31 December 2008'

Keywords: local, adaptive, error, estimation, forecast, parameter, frequency

See also: M_MEM_DAT_Seasonal_Factors, M_MEM_LMEM_Parameter_Dynamics_Figure

Author: Wolfgang Karl Härdle, Nikolaus Hautsch, Andrija Mihoci

Submitted:  Thu, January 12 2017 by Andrija Mihoci

Datafile: ALL5_2008_Volume1_Adjusted360_M6
```

### MATLAB Code
```matlab

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



```

automatically created on 2018-05-28