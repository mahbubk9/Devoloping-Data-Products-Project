
library(markdown)
library(shiny)
library(rCharts)
library(googleVis)
library(quantmod)
library(forecast)


shinyServer(function(input, output) {
  
#A reactive function which loads the  company data instructed by input$tseries
tsdata <- reactive({
    getSymbols(input$tseries, src="google",from=as.character(input$datfrm),to=as.character(input$datto)) 
                                                      #input$datefrm and input$dateto used here
    
                        switch(input$tseries,
                              "AAPL"= AAPL,
                              "FB"=FB,
                              "TWTR"=TWTR)
    

     })
  
  
#Another reactive function, this reacts to input$tmframe and chages the time series to monthly or quarterly  
tmfrmts<-reactive({
        tmfrm<-switch(input$tmframe, 
                      monthly= to.monthly,
                      quarterly=to.quarterly)
tmfrm(tsdata())
    
  })

#The rchart code
output$rChart<- renderChart2({
 tsdf<-as.data.frame(tmfrmts())
 tsdf$date<-row.names(tsdf)
 colnames(tsdf)<-c("Open","High","Low","Close","Vol","Date")
 m1 <- mPlot(x = 'Date', y = c("Open") , type = "Line", data = tsdf)
 m1$set(title = "Title" )
 return(m1)
 
 
 
 
 
  
})
  
  
  
  
  
  
 #Time series decomposition code 
 output$decomts <- renderPlot({
    
    tsOpen <- Op(tmfrmts())
    
    
    if (input$tmframe=="monthly"){
      ts1 <- ts(tsOpen,frequency=12)
    }
    
    if (input$tmframe=="quarterly"){
      ts1 <- ts(tsOpen,frequency=4)
    }
    plot(decompose(ts1))
   
     })

 
 #Forecasting Plot  
  output$fcast <- renderPlot({
    
    
    tsOpen <- Op(tmfrmts())
    
   
    ets1<-HoltWinters(tsOpen)
    fcast <- forecast(ets1,5)
    plot(fcast)
    
  })
  
  
  
  
 
  
 
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
 
})

