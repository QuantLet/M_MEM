function L = WACD_Likelihood(y, Th, mu, t0, tn)

mut = ones(length(y), 1);
mut(1 : 360 : end) = mu;
for t = 2 : 1 : length(y)
  if mut(t) ~= mu
    mut(t) = Th(1) + Th(3) * mut(t - 1) + Th(2) * y(t - 1);
  end
end

lik1 = log(Th(4));
lik2 = gamma(1 + 1 / Th(4));
lik3 = Th(4) * log(lik2);
lik4 = Th(4);
lik5 = lik2 ^ Th(4);

lik6 = -log(y);
lik7 = log((y .* (1 ./ mut)));
lik8 = (y .* (1 ./ mut)) .^ Th(4);

loglik = lik1 + lik6 + lik3 + lik4 .* lik7 - lik5 .* lik8;
L = sum(loglik(t0 : tn));

end


