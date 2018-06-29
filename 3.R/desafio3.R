library(jsonlite)

json <-
'[
  {
    "aragorn": {
      "guardsOfCidadel": 10,
      "men": 10,
      "rohirrim": 10,
      "southGoner": 10,
      "rangers": 10
    },
    "oponente": {
      "orc": 10,
      "esterlings": 10,
      "haradim": 10,
      "variags": 10,
      "oliphaunts": 10,
      "trolls": 10,
      "wargs": 10,
      "greatBeasts": 10
    },
    "mortesAragorn": 1000,
    "morteOponente": 1000,
    "armasPedidas": 500,
    "cavalosMortos": 500
  },
  {
    "aragorn": {
      "guardsOfCidadel": 10,
      "men": 10,
      "rohirrim": 10,
      "southGoner": 10,
      "rangers": 10
    },
    "oponente": {
      "orc": 10,
      "esterlings": 10,
      "haradim": 10,
      "variags": 10,
      "oliphaunts": 10,
      "trolls": 10,
      "wargs": 10,
      "greatBeasts": 10
    },
    "mortesAragorn": 1000,
    "morteOponente": 1000,
    "armasPedidas": 500,
    "cavalosMortos": 500
  },
  {
    "aragorn": {
      "guardsOfCidadel": 10,
      "men": 10,
      "rohirrim": 10,
      "southGoner": 10,
      "rangers": 10
    },
    "oponente": {
      "orc": 10,
      "esterlings": 10,
      "haradim": 10,
      "variags": 10,
      "oliphaunts": 10,
      "trolls": 10,
      "wargs": 10,
      "greatBeasts": 10
    },
    "mortesAragorn": 1000,
    "morteOponente": 1000,
    "armasPedidas": 500,
    "cavalosMortos": 500
  },
  {
    "aragorn": {
      "guardsOfCidadel": 10,
      "men": 10,
      "rohirrim": 10,
      "southGoner": 10,
      "rangers": 10
    },
    "oponente": {
      "orc": 10,
      "esterlings": 10,
      "haradim": 10,
      "variags": 10,
      "oliphaunts": 10,
      "trolls": 10,
      "wargs": 10,
      "greatBeasts": 10
    },
    "mortesAragorn": 1000,
    "morteOponente": 1000,
    "armasPedidas": 500,
    "cavalosMortos": 500
  },
  {
    "aragorn": {
      "guardsOfCidadel": 10,
      "men": 10,
      "rohirrim": 10,
      "southGoner": 10,
      "rangers": 10
    },
    "oponente": {
      "orc": 10,
      "esterlings": 10,
      "haradim": 10,
      "variags": 10,
      "oliphaunts": 10,
      "trolls": 10,
      "wargs": 10,
      "greatBeasts": 10
    },
    "mortesAragorn": 1000,
    "morteOponente": 10,
    "armasPedidas": 500,
    "cavalosMortos": 500
  }
]
'
mydf <- fromJSON(json)




mortesAragorn <- mydf[,c('mortesAragorn')]
batalhas <- c("Monday", "Tuesday", "Wednesday", "Thursday", "Friday")
names(mydf) <- mydf
mydf
# mortesOponente <- mydf[,c('armasPedidas')]
# saldoMortes <- mortesAragorn - mortesOponente
#
# saldoMortes
#
# max(saldoMortes)
