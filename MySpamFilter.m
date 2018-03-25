% Spamfilter 10.03.18
% Vidushi Maillart, Marx Stampfli, Reto Spöhel
fileName = 'SpamFilterData.csv';
formatSpec = '%f%f%f%f%f%f%C';
T = readtable(fileName,'Delimiter',',', ...
 'Format',formatSpec);
T.data = T.charExclamation;
thrsld = 3;
% paint histograms
subplot(1,2,1)
 histogram(T.data(T.type=='spam'),'BinLimits',[0,6])
 title('"!": Spam')
subplot(1,2,2)
 histogram(T.data(T.type=='nonspam'),'BinLimits',[0,6])
 title('"!": Non-Spam')
% Cross Validation Partition: training set 0.8 and test set 0.2
rng(3); % identical partition each run
I = cvpartition(T.type,'HoldOut',0.2); % I.training, I.test
% Group and sizes of training sets
S = sum(T.type(I.training)=='spam');
notS = sum(T.type(I.training)=='nonspam');
E_S = sum(T.data(I.training)> thrsld & T.type(I.training)=='spam');
E_notS = sum(T.data(I.training)> thrsld & T.type(I.training)=='nonspam');
notE_S = sum(T.data(I.training)<= thrsld & T.type(I.training)=='spam');
notE_notS = sum(T.data(I.training)<= thrsld & T.type(I.training)=='nonspam');
% Bayes probability training sets
p_E_S = E_S/S;
p_E_notS = E_notS/notS;
p_S_E = (p_E_S*0.9)/(p_E_S*0.9+p_E_notS*0.1);
% Confusion Matrix training sets
CM_E = [E_S, E_notS; notE_S, notE_notS]


%% extension by Bruno Fernandez
% datacollection for A
T.data2 = T.free; %A is word free
A_S = sum(T.data2(I.training)> thrsld & T.type(I.training)=='spam');
A_notS = sum(T.data2(I.training)> thrsld & T.type(I.training)=='nonspam');
notA_S = sum(T.data2(I.training)<= thrsld & T.type(I.training)=='spam');
notA_notS = sum(T.data2(I.training)<= thrsld & T.type(I.training)=='nonspam');

% datacollection for B
T.data3 = T.charDollar; %B is char dollar
B_S = sum(T.data3(I.training)> thrsld & T.type(I.training)=='spam');
B_notS = sum(T.data3(I.training)> thrsld & T.type(I.training)=='nonspam');
notB_S = sum(T.data3(I.training)<= thrsld & T.type(I.training)=='spam');
notB_notS = sum(T.data3(I.training)<= thrsld & T.type(I.training)=='nonspam');

% datacollection for C
T.data4 = T.remove; %B is char dollar
C_S = sum(T.data4(I.training)> thrsld & T.type(I.training)=='spam');
C_notS = sum(T.data4(I.training)> thrsld & T.type(I.training)=='nonspam');
notC_S = sum(T.data4(I.training)<= thrsld & T.type(I.training)=='spam');
notC_notS = sum(T.data4(I.training)<= thrsld & T.type(I.training)=='nonspam');


% Bayes for A (free)
p_A_S = A_S/S;
p_A_notS = A_notS/notS;
p_S_A = (p_A_S*0.9)/(p_A_S*0.9+p_A_notS*0.1);
%p_S_A
% Confusion Matrix training sets
CM_A = [A_S, A_notS; notA_S, notA_notS]

% Bayes for B (char dollar)
p_B_S = B_S/S;
p_B_notS = B_notS/notS;
p_S_B = (p_B_S*0.9)/(p_B_S*0.9+p_B_notS*0.1);
%p_S_B
% Confusion Matrix training sets
CM_B = [B_S, B_notS; notB_S, notB_notS]

% Bayes for C (remove)
p_C_S = C_S/S;
p_C_notS = C_notS/notS;
p_S_C = (p_C_S*0.9)/(p_C_S*0.9+p_C_notS*0.1);
%p_S_C
% Confusion Matrix training sets
CM_C = [C_S, C_notS; notC_S, notC_notS]

% Bayes for E and A
p_S_AE = (p_E_S*p_A_S*0.9) / (p_E_S*p_A_S*0.9 + p_E_notS*p_A_notS*0.1);
%p_S_AE

% Bayes for E and B
p_S_BE = (p_E_S*p_B_S*0.9) / (p_E_S*p_B_S*0.9 + p_E_notS*p_B_notS*0.1);
%p_S_BE

% Bayes for E, A and B
p_S_BAE = (p_E_S*p_A_S*p_B_S*0.9) / (p_E_S*p_A_S*p_B_S*0.9 + p_E_notS*p_A_notS*p_B_notS*0.1);
%p_S_BAE