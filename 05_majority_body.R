menu_majority <- tabItem(tabName = "majority",
                         fluidRow(
                           column(width = 12,
                                  tabBox(title ="报表工作台",width = 12,
                                         id='tabmajority',height = '300px',
                                         tabPanel('安全库存报表',tagList(
                                           fluidRow(column(3,box(
                                             title = "操作区域", width = NULL, solidHeader = TRUE, status = "primary",
                                             mdl_ListChoose1(id = 'inv_company',
                                                             label = '请选择公司',
                                                             choiceNames = list('江苏康健医疗用品有限公司','江苏康健进出口有限公司'),
                                                             choiceValues =list('100202','100011'),selected = '100202' 
                                                              ),
                                             mdl_file('inv_query_file','请上传安全库存查询物料及仓库范围.xlsx:'),
                                             actionButton('inv_rpt_preview','预览报表'),
                                             mdl_download_button('inv_dl','下载报表')
                                           )),
                                           column(9, box(
                                             title = "报表区域", width = NULL, solidHeader = TRUE, status = "primary",
                                             
                                             div(style = 'overflow-x: scroll', mdl_dataTable('inv_rpt_dataShow','显示安全库存'))
                                           )
                                           ))
                                           
                                         )),
                                         tabPanel('内销产成品缺货数量报表',tagList(
                                           fluidRow(column(4,box(
                                             title = "操作区域", width = NULL, solidHeader = TRUE, status = "primary",
                                             
                                             ''
                                             
                                           )),
                                           column(8, box(
                                             title = "报表区域", width = NULL, solidHeader = TRUE, status = "primary",
                                             ''
                                           )
                                           ))
                                           
                                         )),
                                       
                                         tabPanel('待扩展',tagList(
                                           fluidRow(column(4,box(
                                             title = "操作区域", width = NULL, solidHeader = TRUE, status = "primary",
                                             ''
                                           )),
                                           column(8, box(
                                             title = "报表区域", width = NULL, solidHeader = TRUE, status = "primary",
                                             ''
                                           )
                                           ))
                                           
                                         ))
                                         
                                         
                                         
                                  )
                           )
                         )
)