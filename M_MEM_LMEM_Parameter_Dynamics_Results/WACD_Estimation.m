function Out = WACD_Estimation(y, mu, t0, tn)

Objective = @(Th) - WACD_Likelihood(y, Th, mu, t0, tn);
Options = optimset('Display', 'off', 'Algorithm', 'interior-point', 'Hessian', 'bfgs', 'MaxIter', 500);
Th0 = [0.05, 0.10, 0.70, 0.85]'; A = [-1, 0, 0, 0; 0, -1, 0, 0; 0, 0, -1, 0; 0, 0, 0, -1; 0, 1, 1, 0]; b = [-0.0001; -0.0001; -0.0001; -0.0001; 0.9999];
[QMLE, QMLEF] = fmincon(Objective, Th0, A, b, [], [], [], [], [], Options);

Out = [QMLE; -QMLEF];

end


