library(shiny)
library(shinydashboard)
library(rhandsontable)
library(fbglobal)
library(fbcrops)
#library(fbprogram)
library(fbprstages)

tabNameC  <- "resource_crop"
tabNamePS <- "resource_program_stage"

server <- function(input, output, session) {
  values = shiny::reactiveValues()
  fbcrops::server_crop(input, output, session, values = values)
  fbprstages::server_program_stages(input, output, session, values = values)
}

ui <- dashboardPage(skin = "yellow",
                    dashboardHeader(title = "Demo Program Stage"),
                    dashboardSidebar(
                      menuItem("Resources",
                      sidebarMenu(id = "menu",
                          menuSubItem("Crop", icon = icon("crop"),
                                          tabName = tabNameC),
                          menuSubItem("Program stages", icon = icon("crop"),
                                          tabName = tabNamePS)
                      )
                      )
                    ),
                    dashboardBody(
                      tabItems(
                        fbcrops::ui_crop(name = tabNameC),
                        fbprstages::ui_program_stage(name = tabNamePS)
                      )
                    )
)

shinyApp(ui = ui, server = server)
