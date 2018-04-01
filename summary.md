# Ergebnisse - by Bruno Fernandez
## Vorkommen einzelner W�rter in Mails
#### charExclamation - mit threshold 5:
|         | spam           | not spam  |
| ------------- |:-------------:| :-----:|
| charExclamation     | 13 | 5 |
| no charExclamation     | 1438 |  2225  |

#### charExclamation - mit threshold 3:
|         | spam           | not spam  |
| ------------- |:-------------:| :-----:|
| charExclamation     | 24 | 7 |
| no charExclamation     | 1427 |  2223  |

#### charExclamation - mit threshold 2:
|         | spam           | not spam  |
| ------------- |:-------------:| :-----:|
| charExclamation     | 49 | 10 |
| no charExclamation     | 1402 |  2220  |

#### charExclamation - mit threshold 0:
|         | spam           | not spam  |
| ------------- |:-------------:| :-----:|
| charExclamation     | 1210 | 598 |
| no charExclamation     | 241 |  1632  |

Es ist zu sehen, dass mit einem threshold von 0 zu viele Emails als Spam erkannt werden.
Ich werde deshalb f�r die weiteren Schritte immer mit einem threshold von 5 arbeiten.
Lieber landet ein Spam im Posteingang statt umgekehrt
Ausserdem sind die W�rter welche am h�ufigsten in Spamnachrichten vorkommen charExclamation, free und remove.
Deshalb werden wir nur mit diesen W�rtern weiter arbeiten.

#### free - mit threshold 5:
|         | spam           | not spam  |
| ------------- |:-------------:| :-----:|
| free     | 12 | 1 |
| no free     | 1439 |  2229  |

#### remove - mit threshold 5:
|         | spam           | not spam  |
| ------------- |:-------------:| :-----:|
| remove     | 2 | 0 |
| no remove     | 1449 |  2230  |

## Wahrscheinlichkeit der W�rter
F�r die Wahrscheinlichkeitsrechnung nehmen wir eine Spamwahrscheinlichkeit von 0.5 wie es im Aufgabenblatt beschrieben wurde.

### Bayes f�r charExclamation
|  charExclamation ist Spam | charExclamation ist NICHT Spam | Spam welches charExclamation beinhaltet | Nichtspam welches charExclamation beinhaltet |
| ------------- |:-------------:| :-----:|:-----:|
| 0.008959338387319 | 0.002242152466368 | 0.799834459925507 | 0.200165540074493 | 

### Bayes f�r free
|  free ist Spam | free ist NICHT Spam | Spam welches free beinhaltet | Nichtspam welches free beinhaltet |
| ------------- |:-------------:| :-----:|:-----:|
| 0.008270158511371 | 4.484304932735426e-04 | 0.948566162135337 | 0.051433837864663 | 

### Bayes f�r remove
|  remove ist Spam | remove ist NICHT Spam | Spam welches remove beinhaltet | Nichtspam welches remove beinhaltet |
| ------------- |:-------------:| :-----:|:-----:|
| 0.001378359751895 | 0 | 1 | 0 | 

### Bayes f�r Kombination der W�rter

#### Bayes f�r charExclamation & free
|  Spam welches charExclamation & free beinhahltet |Nichtspam welches charExclamation & free beinhahltet|
| ------------- |:-----:|
|0.990823659319708|0.009176340680292|
