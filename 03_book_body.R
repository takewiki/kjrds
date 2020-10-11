menu_book <-  tabItem(tabName = "book",
                      fluidRow(
                        column(width = 12,
                               tabBox(title ="生产工作台",width = 12,
                                      id='tabbook',height = '300px',
                                      tabPanel('生产订单重新保存',tagList(
                                        fluidRow(column(8,box(
                                          title = "操作区域", width = NULL, solidHeader = TRUE, status = "primary",
                                         mdl_ListChoose1(id = 'mo_billType',
                                                         label = '请选择生产订单的单据类型:',
                                                         choiceNames = list('直接入库-普通生产','汇报入库-普通生产','直接入库-返工生产','汇报入库-返工生产','直接入库-组装车间专用'),
                                                         choiceValues = list(mo_billType_stockIn_common(),
                                                                             mo_billType_rpt_common(),
                                                                             mo_billType_stockIn_reWork(),
                                                                             mo_billType_rpt_reWork(),
                                                                             mo_billType_stockIn_zz()
                                                                             ),
                                                         selected =mo_billType_stockIn_common() ),
                                         mdl_text('mo_number_one','请输入生产订单的单据编号:'),
                                         actionBttn('mo_number_one_btn','单个生产订单重新保存'),
                                         br(),
                                         br(),
                                         tags$h4("批量重新保存生产订单的前提条件："),
                                         tags$h4("1）针对单据状态为",strong("创建或重新审核"),"的生产订单执行重新保存！"),
                                         tags$h4("2）生产订单表头的[数据平台状态]字段为",strong("无或空白")),
                                         actionBttn('mo_number_all_btn','全部生产订单重新保存'),
                                         
                                        )),
                                        column(4, box(
                                          title = "报表区域", width = NULL, solidHeader = TRUE, status = "primary",
                                          
                                         ''
                                        )
                                        ))
                                        
                                      )),
                                      tabPanel('生产订单提交',tagList(
                                        fluidRow(column(8,box(
                                          title = "操作区域", width = NULL, solidHeader = TRUE, status = "primary",
                                          
                                          mdl_text('mo_number_submit','请输入待提交的生产订单的单据编号:'),
                                          tags$h4("支持一次输入多个生产订单,单据编号之间使用英文逗号分隔"),
                                          tags$h4("示例：mo123,mo234 表示2个生产订单"),
                                          tags$h4("当多个单据时,系统将只提示第1个生产订单提交成功！"),
                                          tags$h4("请进入ERP系统进行核实"),
                                          actionBttn('mo_number_submit_btn','生产订单提交')
                                          
                                          
                                        )),
                                        column(4, box(
                                          title = "报表区域", width = NULL, solidHeader = TRUE, status = "primary",
                                          ''
                                        )
                                        ))
                                        
                                      )),
                                      tabPanel('生产订单审核',tagList(
                                        fluidRow(column(8,box(
                                          title = "操作区域", width = NULL, solidHeader = TRUE, status = "primary",
                                          mdl_text('mo_number_audit','请输入待审核的生产订单的单据编号:'),
                                          tags$h4("支持一次输入多个生产订单,单据编号之间使用英文逗号分隔"),
                                          tags$h4("示例：mo123,mo234 表示2个生产订单"),
                                          tags$h4("当多个单据时,系统将只提示第1个生产订单审核成功！"),
                                          tags$h4("请进入ERP系统进行核实"),
                                          actionBttn('mo_number_audit_btn','生产订单审核')
                                        )),
                                        column(4, box(
                                          title = "报表区域", width = NULL, solidHeader = TRUE, status = "primary",
                                         ''
                                        )
                                        ))
                                        
                                      )),
                                      
                                      tabPanel('生产订单下达',tagList(
                                        fluidRow(column(8,box(
                                          title = "操作区域", width = NULL, solidHeader = TRUE, status = "primary",
                                          mdl_text('mo_number_release','请输入待下达的生产订单的单据编号:'),
                                          tags$h4("支持一次输入多个生产订单,单据编号之间使用英文逗号分隔"),
                                          tags$h4("示例：mo123,mo234 表示2个生产订单"),
                                          tags$h4("当多个单据时,系统将只提示第1个生产订单下达成功！"),
                                          tags$h4("请进入ERP系统进行核实"),
                                          tags$h4("生产订单下达的前提条件："),
                                          tags$h4("1）生产订单已审核"),
                                          tags$h4("2）生产订单对应的生产用料清单已审核"),
                                          actionBttn('mo_number_release_btn','生产订单下达')
                                        )),
                                        column(4, box(
                                          title = "报表区域", width = NULL, solidHeader = TRUE, status = "primary",
                                         ''
                                        )
                                        ))
                                        
                                      ))
                                      
                                      
                                      
                               )
                        )
                      )
)
