#Replace with your file location
dfInputData<-read.csv("D:/test.csv",header = T, sep = ",")

clPrice<-dfInputData[,2]
clReturns<-dfInputData[,3]

length(clPrice)

acf(clPrice, xlim= c(0,10), main="acf of Prices", col = "red")
pacf(clPrice, xlim= c(0,10), main= "pacf of Prices", col= "blue")

acf(clReturns, xlim= c(0,0.5), main="acf")
pacf(clReturns, xlim= c(0,10) main = "pcf")

auto.arima(clPrice)
auto.arima(clReturns)

fitmodel=arima(clPrice, order = c(2,0,1))
fitmodel_residual=residuals(fitmodel)

Box.test(fitmodel_residual, lag = 10, type="Ljung-Box")

forecastedprice=forecast(fitmodel, h=20)
forecastedprice

accuracy(fitmodel)
