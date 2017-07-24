
#Clear environment
rm(list = ls())

#Import Data
tsdata <- read.csv(file.choose(), header=TRUE)
myts <- ts(tsdata$Total,start = c(1996,1), end = c(2005,4),frequency = 4)


plot(myts)



#decompose method stl
plot(decompose(myts, type = c("multiplicative")))
decompose(myts, type = c("multiplicative"))
fit <- stl(myts, s.window="period") #modeling

?stl()
plot(fit)
ls(fit)
print(fit$time.series)
fit$win
require(forecast)
summary(fit)
forecast(fit)
plot(forecast(fit)) # plot predicted values
pred_df_stl <- data.frame(forecast(fit))
accuracy(fit)


#ets method

fit1 <- ets(myts)
plot(forecast(fit1))
summary(fit1)
forecast(fit1,4)
accuracy(fit1)
pred_df_ets <- data.frame(forecast(fit1,4))

#ARIMA method
fit2 <-auto.arima(myts)
ls(fit2)
fit2$model
fit2$series
summary(fit2)
accuracy(fit2)
pred_df_arima <- data.frame(forecast(fit2, 4))
plot(forecast(fit2, 4))


