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
                                     tabPanel('ERP发票数据',tagList(
                                       fluidRow(column(4,box(
                                         title = "操作区域", width = NULL, solidHeader = TRUE, status = "primary",
                                        
                                         actionButton('erp_fp_preview','预览ERP发票')
                                      
                                       )),
                                       column(8, box(
                                         title = "报表区域", width = NULL, solidHeader = TRUE, status = "primary",
                                         mdl_dataTable('erp_fp_dataTable','ERP发票数据表')
                                       )
                                       ))
                                       
                                     ))
                                     
                                     
                              )
                       )
                     )
)
  