% Spamfilter 10.03.18
% Vidushi Maillart, Marx Stampfli, Reto Spöhel
fileName = 'SpamFilterData.csv';
formatSpec = '%f%f%f%f%f%f%C';
T = readtable(fileName,'Delimiter',',', ...
 'Format',formatSpec);
T.data = T.charExclamation;
thrsld = 3;
% Histograms
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
CM = [E_S, E_notS; notE_S, notE_notS]



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Version von paedu
% Bayes probability training sets 
A_p_E_S = A_E_S/S; % P(A|S)
A_p_E_notS = A_E_notS/notS; % P(A|notS)

B_p_E_S = B_E_S/S;
B_p_E_notS = B_E_notS/notS;

AB_p_E_S = (A_p_E_S * B_p_E_S) / (A_p_E_S * B_p_E_S + A_p_E_notS * B_p_E_notS)
AB_p_E_notS = (A_p_E_notS * B_p_E_notS) / (A_p_E_notS * B_p_E_notS + A_p_E_S * B_p_E_S)

AB_p_S_E = (AB_p_E_S * 0.9)/(AB_p_E_S *0.9 + AB_p_E_notS * 0.1)

A_p_notE_S = A_notE_S/S; % P(notA|S)
A_p_notE_notS = A_notE_notS/notS; % P(notA|notS)

B_p_notE_S = B_notE_S/S; % P(notB|S)
B_p_notE_notS = B_notE_notS/notS; % P(notB|notS)

%P(S|notA_notB)
AB_p_notE_S = (A_p_notE_S * B_p_notE_S) / (A_p_notE_S * B_p_notE_S + A_p_notE_notS * B_p_notE_notS)
AB_p_notE_notS = (A_p_notE_notS * B_p_notE_notS) / (A_p_notE_notS * B_p_notE_notS + A_p_notE_S * B_p_notE_S)

% Confusion Matrix training sets
A_CM = [A_E_S, A_E_notS; A_notE_S, A_notE_notS]
B_CM = [B_E_S, B_E_notS; B_notE_S, B_notE_notS]