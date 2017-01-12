% M_MEM_LMEM_Parameter_Dynamics_Figure
% Andrija Mihoci

clear all; clc;

INTC_EACD_Theta = load('INTC_EACD_Theta');
INTC_EACD_Th = reshape(INTC_EACD_Theta, 30, 77400);

% Weekly
subplot(6, 2, 1), plot(INTC_EACD_Th(1, :)); ylim([0, 1.5]);
subplot(6, 2, 3), plot(INTC_EACD_Th(2, :)); ylim([0, 1]);
subplot(6, 2, 5), plot(INTC_EACD_Th(3, :)); ylim([0, 1]);
subplot(6, 2, 7), plot(INTC_EACD_Th(5, :)); ylim([0, 1]);
subplot(6, 2, 9), plot(INTC_EACD_Th(3, :) ./ INTC_EACD_Th(5, :)); ylim([0, 1]);
subplot(6, 2, 11), plot(INTC_EACD_Th(1, :) ./ INTC_EACD_Th(5, :)); ylim([0, 1]);

% Daily
subplot(6, 2, 2), plot(INTC_EACD_Th(11, :)); ylim([0, 1.5]);
subplot(6, 2, 4), plot(INTC_EACD_Th(12, :)); ylim([0, 1]);
subplot(6, 2, 6), plot(INTC_EACD_Th(13, :)); ylim([0, 1]);
subplot(6, 2, 8), plot(INTC_EACD_Th(15, :)); ylim([0, 1]);
subplot(6, 2, 10), plot(INTC_EACD_Th(13, :) ./ INTC_EACD_Th(15, :)); ylim([0, 1]);
subplot(6, 2, 12), plot(INTC_EACD_Th(11, :) ./ INTC_EACD_Th(15, :)); ylim([0, 10]);


