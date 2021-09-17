#' The application User-Interface
#' 
#' @param request Internal parameter for `{shiny}`. 
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
#' 
app_ui <- function(request) {
  tagList(
    golem_add_external_resources(),
    
    selectInput("col", "Colour:",
                c("white", "yellow", "red", "blue", "purple"))
  )
}

#' Add external Resources to the Application
#' 
#' This function is internally used to add external 
#' resources inside the Shiny application. 
#' 
#' @import shiny
#' @importFrom golem add_resource_path activate_js favicon bundle_resources
#' @noRd
golem_add_external_resources <- function(){
  
  jscode <- "shinyjs.pageCol = function(params){$('body').css('background', params);}"
  
  add_resource_path(
    'www', app_sys('app/www')
  )
  
  tags$head(
    favicon(),
    bundle_resources(
      path = app_sys('app/www'),
      app_title = 'shinyjstest'
    ),
    # Add here other external resources
    # for example, you can add shinyalert::useShinyalert() 
    
    shinyjs::useShinyjs(),
    
    # works with JS function as text
    #shinyjs::extendShinyjs(text = jscode, functions = c("pageCol"))
    
    # works sometimes in a separate JS file
    # doesn't work in 1st function in jscode.js (following shinyjs docs)
    # but does work in the 2nd version in jscode.js (with a warning)
    shinyjs::extendShinyjs(script = "jscode.js", functions = c("pageCol"))
    
  )
}

