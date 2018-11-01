shinyServer(function(input, output, session){
  output$date_text  <- renderText({
    paste("Today's date is", as.character(test_date$test_date_value))
  })
  
  output$ibox <- renderUI({
    div(class="d1",
    p(class="p1", style= "", "center me")
    )
  })
  
  output$ibox2 <- renderUI({
    p("i2")
  })
  
  output$ibox3 <- renderUI({
    p("i3")
  })
  
  output$boxes  <- renderUI({ 
    p("test")
  })
  
  output$boxes2  <- renderUI({
    p("test2")
  })
  
  
  #non-output code below
  
  observeEvent(input$date, {
    test_date$test_date_value <- input$date
  })
  
  test_date <- reactiveValues(test_date_value = "1930-05-01")
  
  p_data_percent <- eventReactive(test_date$test_date_value, {
    date_func(my_data_p$date, my_data_p$p_percent_normal, test_date$test_date_value)
  })
  
  precip_value <- eventReactive(test_date$test_date_value,{#a_index,{
    case_when(
      p_data_percent() <= .0 ~ "background-color:purple", #"#000000",
      p_data_percent() > .0 && p_data_percent() <= .20 ~ red,#"background-color:red", #"#cc3300",
      p_data_percent() > .20 && p_data_percent() <= .40 ~ orange,#"background-color:orange",  #"#ff9966",
      p_data_percent() > .40 && p_data_percent() <= .60 ~ yellow,#"background-color:yellow",  #"#ffcc00",
      p_data_percent() > .60 && p_data_percent() <= .80 ~ green,#"background-color:green", #"#99cc33",
      p_data_percent() > .80 && p_data_percent() < 1 ~  navy, #"background-color:navy" #"#339900"
      TRUE ~ black
    )
    
  })
  
  q_data_percent <- eventReactive(test_date$test_date_value, {
    date_func(my_data_q$date, my_data_q$flow_cfs, test_date$test_date_value)
  })
  
  q_value <- eventReactive(test_date$test_date_value,{
    case_when(
      q_data_percent() <= 0 ~ "background-color:purple", #"#000000",
      q_data_percent() > 0 && q_data_percent() <= 100 ~ red,#"background-color:red", #"#cc3300",
      q_data_percent() > 100 && q_data_percent() <= 200 ~ orange,#"background-color:orange",  #"#ff9966",
      q_data_percent() > 200 && q_data_percent() <= 300 ~ yellow,#"background-color:yellow",  #"#ffcc00",
      q_data_percent() > 300 && q_data_percent() <= 400 ~ green,#"background-color:green", #"#99cc33",
      #q_data_percent() > 400 && q_data_percent() < 500 ~  navy, #"background-color:navy" #"#339900"
      q_data_percent() > 400 ~ navy,
      TRUE ~ black
    )
  })
  
  s_data_percent <- eventReactive(test_date$test_date_value, {
    date_func(my_data_s$date, my_data_s$storage_days, test_date$test_date_value)
  })
  
  s_value <- eventReactive(test_date$test_date_value,{
    case_when(
      s_data_percent() <= 0 ~ "background-color:purple", #"#000000",
      s_data_percent() > 0 && s_data_percent() <= 60 ~ red,#"background-color:red", #"#cc3300",
      s_data_percent() > 60 && s_data_percent() <= 90 ~ orange,#"background-color:orange",  #"#ff9966",
      s_data_percent() > 90 && s_data_percent() <= 120 ~ yellow,#"background-color:yellow",  #"#ffcc00",
      s_data_percent() > 120 && s_data_percent() <= 500 ~ green,#"background-color:green", #"#99cc33",
      s_data_percent() > 500 && s_data_percent() <= 1130 ~  navy, #"background-color:navy" #"#339900"
      TRUE ~ black
    )
  })
  
  g_data_percent <- eventReactive(test_date$test_date_value, {
    date_func(my_data_g$date, my_data_g$flow_cfs, test_date$test_date_value)
  })
  
  g_value <- eventReactive(test_date$test_date_value,{
    case_when(
      g_data_percent() <= 0 ~ "background-color:purple", #"#000000",
      g_data_percent() > 0 && g_data_percent() <= 55 ~ red,#"background-color:red", #"#cc3300",
      g_data_percent() > 55 && g_data_percent() <= 110 ~ orange,#"background-color:orange",  #"#ff9966",
      g_data_percent() > 110 && g_data_percent() <= 165 ~ yellow,#"background-color:yellow",  #"#ffcc00",
      g_data_percent() > 165 && g_data_percent() <= 220 ~ green,#"background-color:green", #"#99cc33",
      g_data_percent() > 220 && g_data_percent() < 275 ~  navy, #"background-color:navy" #"#339900"
      TRUE ~ black
    )
  })
  
})