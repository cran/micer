## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## -----------------------------------------------------------------------------
library(micer)

## -----------------------------------------------------------------------------
data(mcData)

miceResultMC <- mice(mcData$ref,
                     mcData$pred,
                     mappings=c("Barren", 
                                "Forest", 
                                "Impervious", 
                                "Low Vegetation", 
                                "Mixed Dev", 
                                "Water"),
                     multiclass=TRUE)


cmMC <- table(mcData$pred, mcData$ref)
miceResultMC <- miceCM(cmMC,
                       mappings=c("Barren", 
                                  "Forest", 
                                  "Impervious", 
                                  "Low Vegetation", 
                                  "Mixed Dev", 
                                  "Water"),
                       multiclass=TRUE)

print(miceResultMC)

## -----------------------------------------------------------------------------
data(biData)

miceResultBI <- mice(biData$ref,
                     biData$pred,
                     mappings = c("Mined", 
                                  "Not Mined"),
                     multiclass=FALSE,
                     positiveIndex=1)

cmB <- table(biData$pred, biData$ref)
miceResultBI <- miceCM(cmB,
                       mappings=c("Mined", 
                                  "Not Mined"),
                       multiclass=FALSE,
                       positiveIndex=1)

print(miceResultBI)

## -----------------------------------------------------------------------------
data(mcData)

ciResultsMC <- miceCI(rep=1000,
                      frac=.7,
                      mcData$ref,
                      mcData$pred,
                      lowPercentile=0.025,
                      highPercentile=0.975,
                      mappings=c("Barren", 
                                 "Forest", 
                                 "Impervious", 
                                 "Low Vegetation", 
                                 "Mixed Dev", 
                                 "Water"),
                      multiclass=TRUE)

print(ciResultsMC)

## -----------------------------------------------------------------------------
data(biData)

ciResultsBi <- miceCI(rep=1000,
                      frac=.7,
                      biData$ref,
                      biData$pred,
                      lowPercentile=0.025,
                      highPercentile=0.975,
                      mappings = c("Mined", 
                                   "Not Mined"),
                      multiclass=FALSE,
                      positiveIndex=1)

print(ciResultsBi)

## -----------------------------------------------------------------------------
data(compareData)

set.seed(42)
compareResult <- miceCompare(ref=compareData$ref,
                             result1=compareData$rfPred,
                             result2=compareData$dtPred,
                             reps=1000,
                             frac=.7)

print(compareResult)

