

okay we need a better structured understanding of current system in order to catch the main issue. And the way to do that is track the full process using logs. However a blind tracking and designating one issue and focusing on that is not enough. Becase spotted anamoly might be the reason of bigger error in the code. 

First divide this operation which is not working properly (due to bug or wrong data etc) into the main steges. And for each stage identify relevant variables and logs that would validate things are okay or not.  

then use the existing logs as well as structlog logs to compare and find at which stage error is coming from