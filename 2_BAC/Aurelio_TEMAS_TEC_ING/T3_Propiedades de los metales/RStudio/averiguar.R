# Averiguar una unidad
library("units")
lista=ud_units
averiguar="m"
nombres=names(lista) ## nombres de la lista
listado=nombres[grep(averiguar,nombres)]
listado
as.character(listado[33])



