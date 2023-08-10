# Regularisierungspräferenz mit relativ wenig Daten, 50-100
# hat ein neuronales Netz geringere Steigung als lm? (geringerer INtercept?)
# wie hängt es von den hyperparametern ab? l1/l2 dropout, weite/tiefe layer? richtige settings finden?
# welcher steigung entspricht default initialisierung?
# im cito package
# super niedrige learning rate ist wie 0 epochen
# 1. wie wird initialisiert? welche steigung? bitte 500-1000 mal wiederholen
# 2.
rep = 500
out = rep(NA, rep)

for(i in 1:rep){
  nn.fit <- dnn(data...., lr = 0000000001)
out[i] = mean(predict(nn.fit)()

}

library(cito)

# auch in literatur gucken, wie sollte es sein? in google scholar, dann mit referenzmanager oder auch in foren(skeptisch drauf schauen)
# neues repo in die simulation, schön geordnet, nachvollziehbar, randomseed (set.seed(123)) und save() zum Ergebnis abspeichern als file
# report Titel, Name, worum soll es gehen? Erste Ergebnisse (Intro, message, results, conclusions)
