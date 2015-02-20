# load library and dataset
library(shiny)
data(mtcars)

shinyUI 
(
  fluidPage 
  (
    # header details ----------------------------------------------------------------------- 
    
    title = "MOOC DDP Project",
    h1("Linear Modelling on mtcars Data"),
    
    # prep a row ----------------------------------------------------------------------- 
    fluidRow 
    (
      column 
      (
        6,
        h3('[1] Introduction'),
        p (
          'The mtcars data set contains data from the 1974 Motor Trend US magazine,',
          'and comprises fuel consumption and 10 aspects of automobile design',
          'and performance for 32 automobiles (1973-74 models).'
        ),
        br(),
        p(HTML("<b>")),
        p (
          'Steps to execute application in RStudio:'
        ),       
        p(HTML("</b>")),
        tags$ul
        (
          tags$li("Download Server.R and UI.R from Github"),       
          tags$li("Github: http://github.com/amirrudindahlan/DDP/tree/master/DDP_project"),       
          tags$li("Point to the folder where the files are downloaded to using command setwd()"),
          tags$li("Run commands library(shiny) and then runApp()"),
          tags$li("For details on how the application works, refer to this link: http://rpubs.com/amirrudin/60020")
        )
      )
   ),
   # prep a row ----------------------------------------------------------------------- 
   fluidRow 
   (
     column 
     (
       6,
       h3('[2] Column Definition'),
       p ('Use the table below to display and filter the data to your preference.'),    
       br(),
       dataTableOutput(outputId="table"),
       br()
     ),
     column 
     (
       4,
       br(),
       br(),
       br(),
       br(),
       br(),
       br(),
       br(),
       br(),
       p(HTML("<b>")),
       tags$ul
       (
         tags$li("mpg  - Miles/(US) gallon"),       
         tags$li("cyl  - Number of cylinders"),       
         tags$li("disp - Displacement (cu.in.)"),
         tags$li("hp   - Gross horsepower"),
         tags$li("drat - Rear axle ratio"),
         tags$li("wt   - Weight (lb/1000)"),
         tags$li("qsec - 1/4 mile time"),
         tags$li("vs   - V/S"),
         tags$li("am   - Transmission (0 = automatic, 1 = manual)"),
         tags$li("gear - Number of forward gears"),
         tags$li("carb - Number of carburetors")  
       ),
       p(HTML("</b>")),       
       br()
     )
   ),   
   # prep a row ----------------------------------------------------------------------- 
   fluidRow 
   (
      column 
      (
        3, 
        h3('[3] Choose predictors to predict mileage per gallon'),
        br(),
        p ('1. Pick one of more predictors which you can use to predict the mileage per gallon (mpg) on the right.'), 
        p ('2. Upon selection, you will see the model fit on the further right.'), 
        p ('3. The output is the result of general linear model of the mpg based on the chosen dimensions using glm.'), 
        p ('4. In the next section, there will be a total of 4 visuals. Refer to the next section for more details.')
      ),  
      column 
      (
        2, 
        br(),
        br(),
        br(),
        br(),
        br(),
        checkboxGroupInput 
        (
          "predictors",
          "Choose predictor(s):",
          names(mtcars)[-1]
        )
      ),  
      column 
      (
        5,
        br(),  
        verbatimTextOutput('fit')
      )
   ),
   # prep a row ----------------------------------------------------------------------- 
   fluidRow 
   (
     column 
     (
       10,
       h3('[4] Visualizations'),
       p ('- Visual 1: When conducting a residual analysis, a "residuals versus fits plot" is the most frequently created plot. It is a scatter plot of residuals on the y axis and fitted values (estimated responses) on the x axis. The plot is used to detect non-linearity, unequal error variances, and outliers.'),
       p ('- Visual 2: A Q-Q plot is a plot of the quantiles of two distributions against each other, or a plot based on estimates of the quantiles. The pattern of points in the plot is used to compare the two distributions.'),
       p ('- Visual 3: This plot is similar to the residuals versus fitted values plot, but it uses the square root of the standardized residuals. '),
       p ('- Visual 4: A statistic plot that tries to identify points which have more influence than other points. Generally these are points that are distant from other points in the data, either for the dependent variable or one or more independent variables.')   
     )
   ),
   # prep a row ----------------------------------------------------------------------- 
   fluidRow 
   (
      column 
      (
          3,
          plotOutput('plot1')
      ),
      column 
      (
          3,
          plotOutput('plot2')
      ),
      column 
      (
          3,
          plotOutput('plot3')
      ),
      column 
      (
          3,
          plotOutput('plot4')
      )    
    ),
    br(),
    br(),
    p(HTML("<large><center><b>The End</b></center></large>")),
    br() 
  )  
)

