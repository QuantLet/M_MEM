function L = EACD_Likelihood(y, Th, mu, t0, tn)

mut = ones(length(y), 1);
mut(1 : 360 : end) = mu;
for t = 2 : 1 : length(y)
  if mut(t) ~= mu
    mut(t) = Th(1) + Th(3) * mut(t - 1) + Th(2) * y(t - 1);
  end
end

lik6 = -log(mut);
lik8 = -(y .* (1 ./ mut));

loglik = lik6 + lik8;
L = sum(loglik(t0 : tn));

end


