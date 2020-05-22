menu_row <-  tabItem(tabName = "row",
                     fluidRow(
                       column(width = 12,
                              tabBox(title ="报表工作台",width = 12,
                                     id='tabInvoice',height = '300px',
                                     tabPanel('金税发票数据',tagList(
                                       fluidRow(column(4,box(
                                         title = "操作区域", width = NULL, solidHeader = TRUE, status = "primary",
                                         mdl_file('fp_format_file','请选择发票Excel xlsx文件'),
                                         actionButton('fp_format_preview','预览金税发票'),
                                         actionButton('fp_format_upload','上传服务器')
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
                                       
                                     )),
                                     tabPanel('发票上传查询',tagList(
                                       fluidRow(column(4,box(
                                         title = "操作区域", width = NULL, solidHeader = TRUE, status = "primary",
                                         mdl_dateRange('um_tspDates',label = '报表日期范围选择',startDate = Sys.Date()-7,endDate = Sys.Date()),
                                         actionButton('um_tspPreview','预览报表'),
                                         mdl_download_button('um_tspInfo_dl','下载内部支持报表')
                                       )),
                                       column(8, box(
                                         title = "报表区域", width = NULL, solidHeader = TRUE, status = "primary",
                                         mdl_dataTable('um_tspInfo','内部支持报表')
                                       )
                                       ))
                                       
                                     )),
                                    
                                     tabPanel('发票异常报表',tagList(
                                       fluidRow(column(4,box(
                                         title = "操作区域", width = NULL, solidHeader = TRUE, status = "primary",
                                         mdl_dateRange('um_qnDates2',label = '报表日期范围选择',startDate = Sys.Date()-7,endDate = Sys.Date()),
                                         actionButton('um_qnPreview2','预览报表'),
                                         mdl_download_button('um_qnInfo_dl2','下载千牛日志汇总报表')
                                       )),
                                       column(8, box(
                                         title = "报表区域", width = NULL, solidHeader = TRUE, status = "primary",
                                         mdl_dataTable('um_qnInfo2','千牛日志汇总报表')
                                       )
                                       ))
                                       
                                     ))
                                     
                                     
                                     
                              )
                       )
                     )
)
  