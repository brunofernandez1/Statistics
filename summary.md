# Ergebnisse - by Bruno Fernandez
## Vorkommen einzelner Wörter in Mails
### Vorkommen einzelner Wörter in Mails

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

Es ist zu sehen, dass mit einem threshold von 0 zu viele Emails als Spam erkannt werden
