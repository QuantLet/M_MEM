% M_MEM_Seasonality_Volume
% Andrija Mihoci

function [sf, sa, sB] = M_MEM_Seasonality_Volume(d_t, y_t, NE, DE, M)

tbar = kron(ones(1, DE), (1 : 1 : NE) / NE)';
X = [ones(NE * DE, 1), tbar, cos(2 * pi * kron(tbar, ones(1, M)) .* kron(ones(NE * DE, 1), (1 : M))), sin(2 * pi * kron(tbar, ones(1, M)) .* kron(ones(NE * DE, 1), (1 : M)))];
y = reshape(y_t(1 : NE, :), NE * size(d_t, 1), 1);
y_NE_d = reshape(y(NE * DE + 1 : size(y, 1)), NE, size(d_t, 1) - DE);

for d = 1 : 1 : size(d_t, 1) - DE + 1
  for m = 1 : 1 : M
    Out(m, d) = M_MEM_Seasonality_OLS(y(NE * (d - 1) + 1 : NE * (d - 1 + DE), :), [X(:, 1 : 2), X(:, 3 : m + 2), X(:, M + 3 : m + M + 2)]);
    BIC(m, 1, d) = Out(m, d).BIC;
    sfe(m, :, d) = Out(m, d).yhat;
    o2(m, 1, d) = Out(m, d).o2;
    e(m, :, d) = Out(m, d).e;
  end
end

sf.m1 = reshape(sfe(1, NE * DE - NE + 1 : NE * DE, 1 : size(d_t, 1) - DE), NE, size(d_t, 1) - DE);
sf.m2 = reshape(sfe(2, NE * DE - NE + 1 : NE * DE, 1 : size(d_t, 1) - DE), NE, size(d_t, 1) - DE);
sf.m3 = reshape(sfe(3, NE * DE - NE + 1 : NE * DE, 1 : size(d_t, 1) - DE), NE, size(d_t, 1) - DE);
sf.m4 = reshape(sfe(4, NE * DE - NE + 1 : NE * DE, 1 : size(d_t, 1) - DE), NE, size(d_t, 1) - DE);
sf.m5 = reshape(sfe(5, NE * DE - NE + 1 : NE * DE, 1 : size(d_t, 1) - DE), NE, size(d_t, 1) - DE);
sf.m6 = reshape(sfe(6, NE * DE - NE + 1 : NE * DE, 1 : size(d_t, 1) - DE), NE, size(d_t, 1) - DE);

sa.m1 = y_NE_d ./ sf.m1;
sa.m2 = y_NE_d ./ sf.m2;
sa.m3 = y_NE_d ./ sf.m3;
sa.m4 = y_NE_d ./ sf.m4;
sa.m5 = y_NE_d ./ sf.m5;
sa.m6 = y_NE_d ./ sf.m6;

sB.m1 = reshape(BIC(1, 1, 1 : size(d_t, 1) - DE), 1, size(d_t, 1) - DE);
sB.m2 = reshape(BIC(2, 1, 1 : size(d_t, 1) - DE), 1, size(d_t, 1) - DE);
sB.m3 = reshape(BIC(3, 1, 1 : size(d_t, 1) - DE), 1, size(d_t, 1) - DE);
sB.m4 = reshape(BIC(4, 1, 1 : size(d_t, 1) - DE), 1, size(d_t, 1) - DE);
sB.m5 = reshape(BIC(5, 1, 1 : size(d_t, 1) - DE), 1, size(d_t, 1) - DE);
sB.m6 = reshape(BIC(6, 1, 1 : size(d_t, 1) - DE), 1, size(d_t, 1) - DE);

end


