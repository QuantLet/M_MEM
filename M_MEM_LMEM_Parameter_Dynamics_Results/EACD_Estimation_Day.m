function Out = EACD_Estimation_Day(y, mu)

Th_5d = zeros(4, 360); Th_2d = zeros(4, 360); Th_1d = zeros(4, 360); Th_3h = zeros(4, 360); Th_2h = zeros(4, 360); Th_1h = zeros(4, 360);
for i = 1 : 1 : 360
  Th_5d(:, i) = EACD_Estimation(y, mu, i + 2, 1800 + i);
  Th_2d(:, i) = EACD_Estimation(y, mu, i + 1082, 1800 + i);
  Th_1d(:, i) = EACD_Estimation(y, mu, i + 1442, 1800 + i);
  Th_3h(:, i) = EACD_Estimation(y, mu, i + 1622, 1800 + i);
  Th_2h(:, i) = EACD_Estimation(y, mu, i + 1682, 1800 + i);
  Th_1h(:, i) = EACD_Estimation(y, mu, i + 1742, 1800 + i);
end
Th_5d = [Th_5d; Th_5d(2, :) + Th_5d(3, :)];
Th_2d = [Th_2d; Th_2d(2, :) + Th_2d(3, :)];
Th_1d = [Th_1d; Th_1d(2, :) + Th_1d(3, :)];
Th_3h = [Th_3h; Th_3h(2, :) + Th_3h(3, :)];
Th_2h = [Th_2h; Th_2h(2, :) + Th_2h(3, :)];
Th_1h = [Th_1h; Th_1h(2, :) + Th_1h(3, :)];
Out = [Th_5d; Th_2d; Th_1d; Th_3h; Th_2h; Th_1h];

end


