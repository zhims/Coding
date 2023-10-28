% Y. Zhang
% https://zhims.github.io/
% Oct. 28, 2023

load  para_1_5_1.mat

t0 = -1;
t1 = 1;
N = 10^4-1;
h = (t1 - t0)/N;
t_Test = t0:h:t1;
numPredictions = length(t_Test);

figure
t_Test = dlarray(t_Test,"CB");
F_Fprime_Pred = model(parameters,t_Test);

subplot(1,2,1)
plot(t_Test,extractdata(F_Fprime_Pred(1,:)),"-",LineWidth=2);
title('F')

subplot(1,2,2)
plot(t_Test,extractdata(F_Fprime_Pred(2,:)),"-",LineWidth=2);
title('F^{\prime}')

