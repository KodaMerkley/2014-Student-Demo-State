
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)



##Unique State Codes
##This was done by extracting all of the unique values from the hd2014.csv$STABBR and exporting them to a csv.
x <- read.csv("states.CSV")[,1]

shinyUI(fluidPage(

titlePanel("2014 Student Enrollment Demographics By State"),

sidebarLayout(position = "right",

    ##Render options
    sidebarPanel(
        fluidRow(
            ##State Selection

                selectInput("states", "Select States",
                    choices = as.character(x),
                        selected = x[17],
                    selectize=TRUE)        ),
            ##Demographic

            radioButtons("Data", "Demographic",
                list("Gender" = "dataMF",
                    "Race" = "dataRace")),
            ##Position type

                   radioButtons("pstn", "Type",
                                list("100%" = "fill",
                                     "Count" = "stack")),
            ##Degree Level

                radioButtons("deg", "Degree Level",
                    choices = list("All Students" = 1,
                        "Undergraduates" = 2, "Graduates" = 4),
                        selected = 1),
            ##Rendering Colors

                radioButtons("Color", "Color Palette",
                     list("Discrete" = "Set3",
                            "Pastel" = "Pastel1",
                            "Red Yellow Blue" = "RdYlBu",
                            "Pink Green" = "PiYG",
                            "Brown Green" = "BrBG"))

    ),
    mainPanel(
        ##Plot generated
        plotOutput("distPlot", height = "900"),
    ##Date data was last downloaded.
    textOutput("text1")
    )
  )
))
