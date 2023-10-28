% Y. Zhang
% Oct. 28, 2023

load  para_test.mat

t0 = 0;
t1 = 1;
N = 4999;
h = 1/N;
t_Test = t0:h:t1;

numPredictions = length(t_Test);

figure


t_Test = dlarray(t_Test,"CB");

F_Fprime_Pred = model(parameters,t_Test);


tempt = zeros(1, 2 * numPredictions-1);

tempt(numPredictions:1:2*numPredictions-1) = t_Test (1,:);
tempt(1:1:numPredictions-1) = -tempt(1,2*numPredictions-1:-1:numPredictions+1);


temp2F = zeros(1, 2 * numPredictions-1);
temp2Fprime = zeros(1, 2 * numPredictions-1);


temp2F(numPredictions:1:2*numPredictions-1) = extractdata(F_Fprime_Pred(1,:));
temp2F(1:1:numPredictions-1) =  temp2F(1,2*numPredictions-1:-1:numPredictions+1); %even

temp2Fprime(numPredictions:1:2*numPredictions-1) = extractdata(F_Fprime_Pred(2,:));
temp2Fprime(1:1:numPredictions-1) =  -temp2Fprime(1,2*numPredictions-1:-1:numPredictions+1); %even



subplot(1,2,1)
plot(tempt,temp2F(1,:),"-",LineWidth=2);

title('A_{4,1}')


subplot(1,2,2)
plot(tempt,temp2Fprime(1,:),"-",LineWidth=2);

title('A_{4,1}^{\prime}')




