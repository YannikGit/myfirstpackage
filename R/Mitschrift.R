# Regularisierungspräferenz mit relativ wenig Daten, 50-100
# hat ein neuronales Netz geringere Steigung als lm? (geringerer INtercept?)
# wie hängt es von den hyperparametern ab? l1/l2 dropout, weite/tiefe layer? richtige settings finden?
# welcher steigung entspricht default initialisierung?
# im cito package
# super niedrige learning rate ist wie 0 epochen
# 1. wie wird initialisiert? welche steigung? bitte 500-1000 mal wiederholen
# 2.
# auch in literatur gucken, wie sollte es sein? in google scholar, dann mit referenzmanager oder auch in foren(skeptisch drauf schauen)
# neues repo in die simulation, schön geordnet, nachvollziehbar, randomseed (set.seed(123)) und save() zum Ergebnis abspeichern als file
# report Titel, Name, worum soll es gehen? Erste Ergebnisse (Intro, message, results, conclusions)


To-Do:
  - simulation function von Max verstehen, 3 features machen lassen, einen mit effekt (0.8 oder so), 2. kein effekt, aber kolinearität mit erstem (0.9 oder so), 3. kann effekt oder nicht :)
  - mean_slopes function so ändern, dass alle mean_slopes der Features einzeln rausgezogen werden, die Varianz und die mittlere Prediction
  - genestete for-loop schreiben für width bis 300, depth bis 5, n = 500 statt nur 100
  -> auf dem server mit git clone rein tun und laufen lassen
  -> skript kopieren und mal ausprobieren es laufen zu lassen für einige epochen mit einer learning rate -> effekt?
  -> skript kopieren und mit early stopping (stoppt eigentlich bei gleichem loss) laufen lassen -> vermnutlich noch nicht für kolinearität zwischen den beiden features korrigiert -> falsches netz
