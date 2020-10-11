

#shinyserver start point----
 shinyServer(function(input, output,session) {
    #00-基础框设置-------------
    #读取用户列表
    user_base <- getUsers(conn_be,app_id)
    
    
    
    credentials <- callModule(shinyauthr::login, "login", 
                              data = user_base,
                              user_col = Fuser,
                              pwd_col = Fpassword,
                              hashed = TRUE,
                              algo = "md5",
                              log_out = reactive(logout_init()))
    
    
    
    logout_init <- callModule(shinyauthr::logout, "logout", reactive(credentials()$user_auth))
    
    observe({
       if(credentials()$user_auth) {
          shinyjs::removeClass(selector = "body", class = "sidebar-collapse")
       } else {
          shinyjs::addClass(selector = "body", class = "sidebar-collapse")
       }
    })
    
    user_info <- reactive({credentials()$info})
    
    #显示用户信息
    output$show_user <- renderUI({
       req(credentials()$user_auth)
       
       dropdownButton(
          fluidRow(  box(
             title = NULL, status = "primary", width = 12,solidHeader = FALSE,
             collapsible = FALSE,collapsed = FALSE,background = 'black',
             #2.01.01工具栏选项--------
             
             
             actionLink('cu_updatePwd',label ='修改密码',icon = icon('gear') ),
             br(),
             br(),
             actionLink('cu_UserInfo',label = '用户信息',icon = icon('address-card')),
             br(),
             br(),
             actionLink(inputId = "closeCuMenu",
                        label = "关闭菜单",icon =icon('window-close' ))
             
             
          )) 
          ,
          circle = FALSE, status = "primary", icon = icon("user"), width = "100px",
          tooltip = FALSE,label = user_info()$Fuser,right = TRUE,inputId = 'UserDropDownMenu'
       )
       #
       
       
    })
    
    observeEvent(input$closeCuMenu,{
       toggleDropdownButton(inputId = "UserDropDownMenu")
    }
    )
    
    #修改密码
    observeEvent(input$cu_updatePwd,{
       req(credentials()$user_auth)
       
       showModal(modalDialog(title = paste0("修改",user_info()$Fuser,"登录密码"),
                             
                             mdl_password('cu_originalPwd',label = '输入原密码'),
                             mdl_password('cu_setNewPwd',label = '输入新密码'),
                             mdl_password('cu_RepNewPwd',label = '重复新密码'),
                             
                             footer = column(shiny::modalButton('取消'),
                                             shiny::actionButton('cu_savePassword', '保存'),
                                             width=12),
                             size = 'm'
       ))
    })
    
    #处理密码修改
    
    var_originalPwd <-var_password('cu_originalPwd')
    var_setNewPwd <- var_password('cu_setNewPwd')
    var_RepNewPwd <- var_password('cu_RepNewPwd')
    
    observeEvent(input$cu_savePassword,{
       req(credentials()$user_auth)
       #获取用户参数并进行加密处理
       var_originalPwd <- password_md5(var_originalPwd())
       var_setNewPwd <-password_md5(var_setNewPwd())
       var_RepNewPwd <- password_md5(var_RepNewPwd())
       check_originalPwd <- password_checkOriginal(fappId = app_id,fuser =user_info()$Fuser,fpassword = var_originalPwd)
       check_newPwd <- password_equal(var_setNewPwd,var_RepNewPwd)
       if(check_originalPwd){
          #原始密码正确
          #进一步处理
          if(check_newPwd){
             password_setNew(fappId = app_id,fuser =user_info()$Fuser,fpassword = var_setNewPwd)
             pop_notice('新密码设置成功:)') 
             shiny::removeModal()
             
          }else{
             pop_notice('两次输入的密码不一致，请重试:(') 
          }
          
          
       }else{
          pop_notice('原始密码不对，请重试:(')
       }
       
       
       
       
       
    }
    )
    
    
    
    #查看用户信息
    
    #修改密码
    observeEvent(input$cu_UserInfo,{
       req(credentials()$user_auth)
       
       user_detail <-function(fkey){
          res <-tsui::userQueryField(conn = conn_be,app_id = app_id,user =user_info()$Fuser,key = fkey)
          return(res)
       } 
       
       
       showModal(modalDialog(title = paste0("查看",user_info()$Fuser,"用户信息"),
                             
                             textInput('cu_info_name',label = '姓名:',value =user_info()$Fname ),
                             textInput('cu_info_role',label = '角色:',value =user_info()$Fpermissions ),
                             textInput('cu_info_email',label = '邮箱:',value =user_detail('Femail') ),
                             textInput('cu_info_phone',label = '手机:',value =user_detail('Fphone') ),
                             textInput('cu_info_rpa',label = 'RPA账号:',value =user_detail('Frpa') ),
                             textInput('cu_info_dept',label = '部门:',value =user_detail('Fdepartment') ),
                             textInput('cu_info_company',label = '公司:',value =user_detail('Fcompany') ),
                             
                             
                             footer = column(shiny::modalButton('确认(不保存修改)'),
                                             
                                             width=12),
                             size = 'm'
       ))
    })
    
    
    
    #针对用户信息进行处理
    
    sidebarMenu <- reactive({
       
       res <- setSideBarMenu(conn_rds('rdbe'),app_id,user_info()$Fpermissions)
       return(res)
    })
    
    
    #针对侧边栏进行控制
    output$show_sidebarMenu <- renderUI({
       if(credentials()$user_auth){
          return(sidebarMenu())
       } else{
          return(NULL) 
       }
       
       
    })
    
    #针对工作区进行控制
    output$show_workAreaSetting <- renderUI({
       if(credentials()$user_auth){
          return(workAreaSetting)
       } else{
          return(NULL) 
       }
       
       
    })
    
    #1发票管理模块---------
    #1.1发票格式化-----------
    
    var_fp_format_file <- var_file("fp_format_file")
    db_fp_format <- eventReactive(input$fp_format_preview,{
      file <-  var_fp_format_file()
      print(file)
      res <- rdfp::deal_fapiao2(file)
      return(res)
      
    })
    
    observeEvent(input$fp_format_preview,{
      data <-db_fp_format()
      run_dataTable2('fp_format_dataTable',data)
      pop_notice("完成发票预处理")
      
    })
    
    
    observeEvent(input$fp_format_update,{
      shinyjs::disable('fp_format_update')
      data <-db_fp_format()
      
      kjrdspkg::fp_updateBatch(conn=conn,data=data,show_process = TRUE,multiple = TRUE)
      pop_notice("完成客户开票信息更新!")
      
    })
    
    observeEvent(input$fp_format_update_reset,{
      shinyjs::enable('fp_format_update')
    })
    
    
    #1.2发票ERP
    
    db_erp_fp <-function(){
      erp_fp_sql <-"select top 3  *  from takewiki_md_customer"
      res <-tsda::sql_select(conn,erp_fp_sql)
      return(res)
      
    }
    
    observeEvent(input$erp_fp_preview,{
      data <-  db_erp_fp()
      names(data) <-c('代码','名称','抬头','税号','开户行','账号','地址','电话')
      run_dataTable2('erp_fp_dataTable',data)
    })
   
   
   # 更新客户发票各类及开票发票------
    var_cust_fp_file <- var_file('cust_fp_file')

    observeEvent(input$cust_fp_preview,{
      file <- var_cust_fp_file()
      sheet <- input$cust_fp_sheetName
      data <- kjrdspkg::cust_getFpType(file = file,sheet = sheet)
      run_dataTable2('cust_fp_dataTable',data = data)
      
      
    })
    
    #更新客户资料
    observeEvent(input$cust_fp_update,{
      shinyjs::disable('cust_fp_update')
      file <- var_cust_fp_file()
      sheet <- input$cust_fp_sheetName
      try({
        kjrdspkg::cust_syncFpType(conn=conn,file = file,sheet = sheet)
      })
      pop_notice("更新客户发票种类及开票要求成功!")
      
    })
    observeEvent(input$cust_fp_update_reset,{
      shinyjs::enable('cust_fp_update')
    })
    #更新物料上的开票名称及规格型号------
    var_mtrl_fp_file <- var_file('mtrl_fp_file')
    observeEvent(input$mtrl_fp_preview,{
      file <- var_mtrl_fp_file()
      sheet <- input$mtrl_fp_sheetName
      data <- kjrdspkg::mtrl_getFpName(file=file,sheet = sheet)
      run_dataTable2('mtrl_fp_dataTable',data = data)
      
    })
    
    observeEvent(input$mtrl_fp_update,{
      shinyjs::disable('mtrl_fp_update')
      file <- var_mtrl_fp_file()
      sheet <- input$mtrl_fp_sheetName
      try({
        kjrdspkg::mtrl_syncFpName(conn=conn,file = file,sheet = sheet)
      })
      pop_notice("更新物料开票名称及规格型号成功!")
      
    })
    
    #处理安全库存报表
    var_inv_company <- var_ListChoose1('inv_company')
    var_inv_query_file <- var_file('inv_query_file')
    observeEvent(input$inv_rpt_preview,{
      FCompanyId = as.integer(var_inv_company())
      print(FCompanyId)
      file =  var_inv_query_file()
      print(file)
      filter_ItemNumber =kjrdspkg::inv_paramGetMaterial(file=file)
      filter_stockName = kjrdspkg::inv_paramGetStock(file=file)
      data <- try({
        kjrdspkg::inv_getRpt_cast(conn=conn,FCompanyId = FCompanyId,
                                  filter_ItemNumber =filter_ItemNumber ,
                                  filter_stockName = filter_stockName)
      })
      
      file_name <- paste0("安库库存报表_",as.character(Sys.Date()),'.xlsx')
      
      run_dataTable2(id = 'inv_rpt_dataShow',data=data)
      run_download_xlsx(id = 'inv_dl',data = data,filename = file_name )
      
    })
   #下载库存库存模板
    run_download_xlsx('inv_tpl_dl',data = tpl_inv,filename = '安全库存报表查询模板.xlsx')
  #生产管理平台--------
  var_mo_number_one <- var_text('mo_number_one')
  #生产订单的单据类型
  var_mo_billType <- var_ListChoose1('mo_billType')
  observeEvent(input$mo_number_one_btn,{
    FBillNo <- var_mo_number_one()
    FBillType <- var_mo_billType()
    if (len(FBillNo) >0) {
      res <-try(mo_reSave(FBillNo = FBillNo,FBillType = FBillType))
      pop_notice(res$msg)
    }else{
      pop_notice('请输入生产订单表头的单据编号!')
    }

  
  })
  
  #创建或重新审核状态的生产订单执行重新保存
  observeEvent(input$mo_number_all_btn,{
    FBillType <- var_mo_billType()
    res <-try(mo_reSave_auto(FBillType =FBillType))
    pop_notice('生产订单全部重新保存成功!')
  })
    
  #生产订单提交-----
  var_mo_number_submit <- var_text('mo_number_submit')
  observeEvent(input$mo_number_submit_btn,{
    FBillNo = var_mo_number_submit()
    if(len(FBillNo) >0){
      FBillList = as.list(strsplit(FBillNo,',')[[1]])
     res <- try(mo_submit(FBillList = FBillList))
     pop_notice(res$msg)
    }else{
      pop_notice('请输入生产订单表头的单据编号!')
    }
    

  })
  
  #生产订单审核-----
  var_mo_number_audit <- var_text('mo_number_audit')
  observeEvent(input$mo_number_audit_btn,{
    FBillNo <- var_mo_number_audit()
    if(len(FBillNo) >0){
      FBillList = as.list(strsplit(FBillNo,',')[[1]])
      res <- try(mo_audit(FBillList = FBillList))
      pop_notice(res$msg)
    }else{
      pop_notice('请输入生产订单表头的单据编号!')
    }
    
  })
  
  # 生产订单下达-----
  var_mo_number_release <- var_text('mo_number_release')
  observeEvent(input$mo_number_release_btn,{
    FBillNo = var_mo_number_release()
    if(len(FBillNo) >0){
      FBillList = as.list(strsplit(FBillNo,',')[[1]])
      res <- try(mo_release(FBillList = FBillList))
      pop_notice(res$msg)
    }else{
      pop_notice('请输入生产订单表头的单据编号!')
    }
    
    
    
  })
  
  
})
