menu_row <-  tabItem(tabName = "row",
                     fluidRow(
                       column(width = 12,
                              tabBox(title ="报表工作台",width = 12,
                                     id='tabInvoice',height = '300px',
                                     tabPanel('金税发票数据',tagList(
                                       fluidRow(column(4,box(
                                         title = "操作区域", width = NULL, solidHeader = TRUE, status = "primary",
                                         mdl_file('fp_format_file','请选择金税开票引出txt文件'),
                                         actionButton('fp_format_preview','预览金税发票'),
                                         #actionButton('fp_format_upload','上传服务器'),
                                         actionButton('fp_format_update','更新ERP'),
                                         actionButton('fp_format_update_reset','再次激活更新 ')
                                       )),
                                       column(8, box(
                                         title = "报表区域", width = NULL, solidHeader = TRUE, status = "primary",
                                         
                                         mdl_dataTable('fp_format_dataTable','金税发票数据表')
                                       )
                                       ))
                                       
                                     )),
                                     tabPanel('更新客户发票种类及开票要求',tagList(
                                       fluidRow(column(4,box(
                                         title = "操作区域", width = NULL, solidHeader = TRUE, status = "primary",
                                         mdl_file('cust_fp_file','请选择专普票区分表.xlsx'),
                                         textInput(inputId = 'cust_fp_sheetName',label = '选择页签',value = '专普'),
                                         actionButton('cust_fp_preview','预览专普'),
                                         actionButton('cust_fp_update','更新ERP客户'),
                                         actionButton('cust_fp_update_reset','更新激活更新')
                                         
                                         
                                       )),
                                       column(8, box(
                                         title = "报表区域", width = NULL, solidHeader = TRUE, status = "primary",
                                         mdl_dataTable('cust_fp_dataTable','预览志普数据')
                                       )
                                       ))
                                       
                                     )),
                                     tabPanel('更新物料开票名称及规格型号',tagList(
                                       fluidRow(column(4,box(
                                         title = "操作区域", width = NULL, solidHeader = TRUE, status = "primary",
                                         
                                         mdl_file('mtrl_fp_file','选择物料开票名称.xlsx'),
                                         textInput(inputId = 'mtrl_fp_sheetName',label = '选择页签',value = '开票用最新'),
                                         actionButton('mtrl_fp_preview','预览物料开票名称'),
                                         actionButton('mtrl_fp_update','更新ERP物料'),
                                         actionButton('mtrl_fp_update_reset','更新激活更新')
                                         
                                         
                                       )),
                                       column(8, box(
                                         title = "报表区域", width = NULL, solidHeader = TRUE, status = "primary",
                                         mdl_dataTable('mtrl_fp_dataTable','预览开票名称数据')
                                       )
                                       ))
                                       
                                     ))
                                     # ,
                                     # tabPanel('ERP发票数据',tagList(
                                     #   fluidRow(column(4,box(
                                     #     title = "操作区域", width = NULL, solidHeader = TRUE, status = "primary",
                                     #    
                                     #     actionButton('erp_fp_preview','预览ERP发票')
                                     #  
                                     #   )),
                                     #   column(8, box(
                                     #     title = "报表区域", width = NULL, solidHeader = TRUE, status = "primary",
                                     #     mdl_dataTable('erp_fp_dataTable','ERP发票数据表')
                                     #   )
                                     #   ))
                                     #   
                                     # ))
                                     
                                     
                              )
                       )
                     )
)
  