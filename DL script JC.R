
install.packages("readxl")
install.packages("meta")

## ------------------------------------------------------------------------
library(readxl)
library(meta)

## ------------------------------------------------------------------------
settings.meta(digits = 2)

## ------------------------------------------------------------------------
AcuteManiaP = read_excel("AcuteManiaP.xls")
AcuteManiaP = as.data.frame(AcuteManiaP)

## ------------------------------------------------------------------------
str(AcuteManiaP)



## ------------------------------------------------------------------------
pooledOR = metabin(event2, n2, event1, n1,
                   data = AcuteManiaP, studlab = studlab, sm = "OR",method = "I")
summary(pooledOR)

## ------------------------------------------------------------------------
summary(update(pooledOR, sm = "RR"))
summary(update(pooledOR, sm = "RD"))

## ------------------------------------------------------------------------
forest(pooledOR, sortvar = n1 + n2 , layout = "JAMA", allstudies = F,
       fs.study = 10, ff.study = "italic",
       col.diamond = "green", col.diamond.lines = "red",
       col.square = "yellow", col.square.lines = "blue", prediction=T)

## ------------------------------------------------------------------------
pooledORAE = metabin(AE2, n2, AE1, n1, data = AcuteManiaP,
                     studlab = studlab, sm = "OR",
                     subset = treat2 == "Haloperidol", method = "I")
summary(pooledORAE)

## ------------------------------------------------------------------------


## ------------------------------------------------------------------------
forest(pooledORAE, layout = "JAMA")

