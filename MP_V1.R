dataset= read.csv('temp.csv')
dataset$COMPANY.NAME.1 = factor(dataset$COMPANY.NAME.1,
                                levels = c('Accenture','KPIT Technologies','Robert Bosch(RBEI)','Microsoft','Sankalp Semiconductor','MindTree','Sony','Cerium','Kooki','Infosys','Brillio','MMRFIC'),
                                labels = c(1,2,3,4,5,6,7,8,9,10,11,12))
dataset$Quota = factor(dataset$Quota,
                       levels = c('COMEDK','GOVT','SNQ','MGMT'),
                       labels = c(1,2,3,4))


for(){
} 

                       
#install.packages('caTools')
library(caTools)
set.seed(123)
spilt = sample.split(dataset$COMPANY.NAME.1,SplitRatio = 0.8)
training_set = subset(dataset, split = TRUE)
test_set = subset(dataset, split=FALSE)
 
regr = lm(formula = COMPANY.NAME.1 ~ SSLC.Percentage + PU.Percentage,
          newdata=training_set)
              


#install.packages('ggplot2')
library(ggplot2)
ggplot() +
  geom_point(aes(x= training_set$CGPA,y = training_set$PU.Percentage),
             colour='red') +
  #geom_line(aes(x =training_set$CGPA,y = predict(regr,newdata = training_set)),
        #    colour='blue') +
  ggtitle('CGPA vs PU Training Set') +
  xlab('CGPA') +
  ylab('PU')
