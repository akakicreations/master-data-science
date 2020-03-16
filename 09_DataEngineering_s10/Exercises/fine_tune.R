gbmGrid <-  expand.grid(interaction.depth = c(1, 5, 9), 
                        n.trees = (1:30)*50, 
                        shrinkage = 0.1,
                        n.minobsinnode = 20)

nrow(gbmGrid)

fitControl <- trainControl(## 10-fold CV
  method = "repeatedcv",
  number = 10,
  ## repeated ten times
  repeats = 10)

set.seed(825)
gbmFit2 <- train(class ~ ., data = data_wineR2, 
                 method = "gbm", 
                 trControl = fitControl, 
                 verbose = FALSE, 
                 ## Now specify the exact models 
                 ## to evaluate:
                 tuneGrid = gbmGrid)
gbmFit2

# Luego usamos gbmFit2$bestTune, para ver la mejor predicción pero con gbmFit2$?????, podemos ver más cosas del modelo
# Si queremos predecir nuevos datos con predict(gbmFit, new_data), y los guarda en un nuevo documento.
# Ojo! debería hacerse no directamente desde el dataframe, sino separarlo en un traning y un test