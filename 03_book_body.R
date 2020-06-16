menu_book <-  tabItem(tabName = "book",
                      fluidRow(
                        column(width = 12,
                               tabBox(title ="报表工作台",width = 12,
                                      id='tabbook',height = '300px',
                                      tabPanel('生产订单下达',tagList(
                                        fluidRow(column(4,box(
                                          title = "操作区域", width = NULL, solidHeader = TRUE, status = "primary",
                                         ''
                                        )),
                                        column(8, box(
                                          title = "报表区域", width = NULL, solidHeader = TRUE, status = "primary",
                                          
                                          mdl_dataTable('fp_format_mo','金税发票数据表')
                                        )
                                        ))
                                        
                                      )),
                                      tabPanel('生产订单合并',tagList(
                                        fluidRow(column(4,box(
                                          title = "操作区域", width = NULL, solidHeader = TRUE, status = "primary",
                                          
                                          ''
                                          
                                        )),
                                        column(8, box(
                                          title = "报表区域", width = NULL, solidHeader = TRUE, status = "primary",
                                          mdl_dataTable('erp_fp_dataTable_hb','ERP发票数据表')
                                        )
                                        ))
                                        
                                      )),
                                      tabPanel('发票上传查询',tagList(
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
                                      
                                      tabPanel('发票异常报表',tagList(
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
