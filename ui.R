#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

source("ml.R")

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  # Application title
  titlePanel("Prediction of Lung Cancer Risk"),
  
  # Sidebar with a slider and numeric input  
  sidebarLayout(
    sidebarPanel(
      selectInput("GENDER", "GENDER: ", 
                  choices = list("M", "F")
      ),
      numericInput("AGE","Age :",
                   min = min(data$AGE),
                   max = max(data$AGE),
                   value = as.integer(mean(data$AGE))
      ),
      numericInput("SMOKING","SMOKING HABIT :",
                   min = min(data$SMOKING),
                   max = max(data$SMOKING),
                   value = as.integer(mean(data$SMOKING))
      ),
      numericInput("YELLOW_FINGERS","PRESENCE OF YELLOW FINGER :",
                   min = min(data$YELLOW_FINGERS),
                   max = max(data$YELLOW_FINGERS),
                   value = as.integer(mean(data$YELLOW_FINGERS))
      ),
      numericInput("ANXIETY","PRESENCE OF ANXIETY :",
                   min = min(data$ANXIETY),max = max(data$ANXIETY),
                   value = as.integer(mean(data$ANXIETY))
      ),
      numericInput("PEER_PRESSURE","INFLUENCE OF ANY PEER PRESSURE :",
                   min = min(data$PEER_PRESSURE),
                   max = max(data$PEER_PRESSURE),
                   value = as.integer(mean(data$PEER_PRESSURE))
      ),
      numericInput("CHRONIC.DISEASE","PRESENCE OF ANY CHRONIC DISEASE :",
                   min = min(data$CHRONIC.DISEASE),
                   max = max(data$CHRONIC.DISEASE),
                   value = as.integer(mean(data$CHRONIC.DISEASE))
      ),
      numericInput("FATIGUE","PRESENCE OF ANY FATIGUE :",
                   min = min(data$FATIGUE),
                   max = max(data$FATIGUE),
                   value = as.integer(mean(data$FATIGUE))
      ),
      numericInput("ALLERGY","PRESENCE OF ANY ALLERGY :",
                   min = min(data$ALLERGY),
                   max = max(data$ALLERGY),
                   value = as.integer(mean(data$ALLERGY))
      ),
      numericInput("WHEEZING","PRESENCE OF ANY WHEEZING :",
                   min = min(data$WHEEZING),
                   max = max(data$WHEEZING),
                   value = as.integer(mean(data$WHEEZING))
      ),
      numericInput("ALCOHOL.CONSUMING","ANY ALCOHOL CONSUMING HABIT :",
                   min = min(data$ALCOHOL.CONSUMING),
                   max = max(data$ALCOHOL.CONSUMING),
                   value = as.integer(mean(data$ALCOHOL.CONSUMING))
      ),
      numericInput("COUGHING","PRESENCE OF ANY COUGH :",
                   min = min(data$COUGHING),
                   max = max(data$COUGHING),
                   value = as.integer(mean(data$COUGHING))
      ),
      numericInput("SHORTNESS.OF.BREATH","PRESENCE OF ANY SHORTNESS OF BREATH :",
                   min = min(data$SHORTNESS.OF.BREATH),
                   max = max(data$SHORTNESS.OF.BREATH),
                   value = as.integer(mean(data$SHORTNESS.OF.BREATH))
      ),
      numericInput("SWALLOWING.DIFFICULTY","PRESENCE OF ANY DIFFICULTY IN SWALLOWING :",
                   min = min(data$SWALLOWING.DIFFICULTY),
                   max = max(data$SWALLOWING.DIFFICULTY),
                   value = as.integer(mean(data$SWALLOWING.DIFFICULTY))
      ),
      numericInput("CHEST.PAIN","PRESENCE OF ANY PAIN IN THE CHEST :",
                   min = min(data$CHEST.PAIN),
                   max = max(data$CHEST.PAIN),
                   value = as.integer(mean(data$CHEST.PAIN))
      ),      
      submitButton('Predict')
    ),
    mainPanel(
      tabsetPanel(
        tabPanel('Introduction',
                 p(),
                 h2("INTRODUCTION"),
                 h4("This application is used to predict the lung cancer risk based on selected attributes that includes symptoms, factors that influenced and habits."),
                 h4("There are three tabs in this application such as stated below:"),
                 h4("1. Introductiontab - introduces the  function of the application to user."),
                 h4("2. Distribution and model accuracy tab - shows some distribution charts and accuracy of the model."),
                 h4("3. Prediction tab -shows the result of lung cancer risk prediction based of ml algorithms."),
                 h1(""),
                 h2("INSTRUCTION"),
                 h4("Follow the instruction provided as below: "),
                 h4("1. Please fill in the input box on the left of the page"),
                 h4("2. For the input, if the characteristic does not fit you, please enter 1, if the characteristic fits you, please enter 2"),
                 h4("3. After filling in the characteristic, please click on PREDICT button in blue at the bottom and navigate to PREDICTION Tab"),
                 h4("4. Please note that the results is based on 4 different models. 1 means YES, 0 means NO")),
        tabPanel('Distribution and Model Accuracy',
                 p(),
                 h3("Age distribution for the observation"), 
                 plotOutput("eda1"),
                 h3("Lung cancer among smoker"), 
                 plotOutput("eda2"),
                 h3("Lung cancer among alcohol consumer"), 
                 plotOutput("eda3"),
                 h3("Lung cancer on ages range"), 
                 plotOutput("eda4"),
                 h3("Model comparison"),
                 plotOutput("compare")),
        tabPanel('Prediction', 
                 plotOutput("PieChart"),
                 tableOutput("observation")
        )
      )
    )
  )
)

)

