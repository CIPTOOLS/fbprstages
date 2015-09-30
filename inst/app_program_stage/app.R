library(shiny)
library(shinydashboard)
library(rhandsontable)
library(fbglobal)
library(fbcrops)
library(fbprstages)

tabName <- "resource_program_stage"

server <- function(input, output, session) {
  fbprstages::server_program_stages(input, output, session)
}

ui <- dashboardPage(skin = "yellow",
                    dashboardHeader(title = "Demo Program Stage"),
                    dashboardSidebar(
                      menuItem("Resources",
                               sidebarMenu(id = "menu",
                                menuSubItem("Program stages", icon = icon("crop"),
                                             tabName = tabName)
                               )
                      )
                    ),
                    dashboardBody(
                      tabItems(
                        fbprstages::ui_program_stage(name = tabName)
                      )
                    )
)

shinyApp(ui = ui, server = server)
