% M_Seasonality_OLS
% Andrija Mihoci

function [Out] = M_MEM_Seasonality_OLS(y, X)
  b = (X' * X) \ X' * y;
  yhat = X * b;
  e = y - yhat;
  o2 = (e' * e) / (size(X, 1) - size(X, 2));
  BIC = (- size(X, 1) / 2 * (log(o2 * 2 * pi)) - (e' * e) / (2 * o2)) - size(X, 2) * log(size(X, 1)) / 2;
  Out.yhat = yhat;
  Out.b = b;
  Out.e = e;
  Out.o2 = o2;
  Out.BIC = BIC;
end


