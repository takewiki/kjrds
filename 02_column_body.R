menu_column <- tabItem(tabName = "column",
                       fluidRow(
                         column(width = 12,
                                tabBox(title ="成本管理工作台",width = 12,
                                       id='tabco',height = '300px',
                                       tabPanel('成本数据',tagList(
                                         fluidRow(column(4,box(
                                           title = "操作区域", width = NULL, solidHeader = TRUE, status = "primary",
                                           actionBttn(inputId = 'kjco_compare_btn',label = '查看成本数据'),
                                           mdl_download_button(id = 'kjco_compare_dl',label = '下载成本数据')
                                         )),
                                         column(8, box(
                                           title = "报表区域", width = NULL, solidHeader = TRUE, status = "primary",
                                           
                                           div(style = 'overflow-x: scroll',mdl_dataTable('kjco_compare_dataShow'))
                                         )
                                         ))
                                         
                                       )),
                                       tabPanel('材料成本-BOM口径',tagList(
                                         fluidRow(column(4,box(
                                           title = "操作区域", width = NULL, solidHeader = TRUE, status = "primary",
                                           mdl_ListChoose1(id = 'kjco_materialCost_bom_period',
                                                           label = '选择查看年月',choiceNames = kjco_period(),choiceValues = kjco_period(),
                                                           selected = '2020-03'
                                                            ),
                                           actionBttn('kjco_material_bom_btn','查看材料成本'),
                                           mdl_download_button('kjco_material_bom_dl','下载材料成本')
                                           
                                           
                                           
                                         )),
                                         column(8, box(
                                           title = "报表区域", width = NULL, solidHeader = TRUE, status = "primary",
                                           div(style = 'overflow-x: scroll',mdl_dataTable('kjco_materialCost_bom_dataShow'))
                                         )
                                         ))
                                         
                                       )),
                                       tabPanel('材料成本-生产用料清单口径',tagList(
                                         fluidRow(column(4,box(
                                           title = "操作区域", width = NULL, solidHeader = TRUE, status = "primary",
                                           mdl_ListChoose1(id = 'kjco_materialCost_ppbom_period',
                                                           label = '选择查看年月',choiceNames = kjco_period(),choiceValues = kjco_period(),
                                                           selected = '2020-03'
                                           ),
                                           actionBttn('kjco_material_ppbom_btn','查看材料成本'),
                                           mdl_download_button('kjco_material_ppbom_dl','下载材料成本')
                                           
                                           
                                         )),
                                         column(8, box(
                                           title = "报表区域", width = NULL, solidHeader = TRUE, status = "primary",
                                           div(style = 'overflow-x: scroll',mdl_dataTable('kjco_materialCost_ppbom_dataShow'))
                                         )
                                         ))
                                         
                                       )),
                                       tabPanel('材料成本-生产领料口径',tagList(
                                         fluidRow(column(4,box(
                                           title = "操作区域", width = NULL, solidHeader = TRUE, status = "primary",
                                           
                                           mdl_ListChoose1(id = 'kjco_materialCost_pick_period',
                                                           label = '选择查看年月',choiceNames = kjco_period(),choiceValues = kjco_period(),
                                                           selected = '2020-03'
                                           ),
                                           actionBttn('kjco_material_pick_btn','查看材料成本'),
                                           mdl_download_button('kjco_material_pick_dl','下载材料成本')
                                           
                                           
                                         )),
                                         column(8, box(
                                           title = "报表区域", width = NULL, solidHeader = TRUE, status = "primary",
                                           div(style = 'overflow-x: scroll',mdl_dataTable('kjco_materialCost_pick_dataShow'))
                                         )
                                         ))
                                         
                                       )),
                                       tabPanel('人工及制造费用明细',tagList(
                                         fluidRow(column(4,box(
                                           title = "操作区域", width = NULL, solidHeader = TRUE, status = "primary",
                                           
                                           mdl_ListChoose1(id = 'kjco_hm_period',
                                                           label = '选择查看年月',choiceNames = kjco_period(),choiceValues = kjco_period(),
                                                           selected = '2020-03'
                                           ),
                                           actionBttn('kjco_hm_btn','查看人工及制造费用成本'),
                                           mdl_download_button('kjco_hm_dl','下载人工及制造费用成本')
                                           
                                           
                                         )),
                                         column(8, box(
                                           title = "报表区域", width = NULL, solidHeader = TRUE, status = "primary",
                                           div(style = 'overflow-x: scroll',mdl_dataTable('kjco_hm_dataShow'))
                                         )
                                         ))
                                         
                                       )),
                                       tabPanel('成本出库成本',tagList(
                                         fluidRow(column(4,box(
                                           title = "操作区域", width = NULL, solidHeader = TRUE, status = "primary",
                                           
                                           mdl_ListChoose1(id = 'kjco_deal_price_method',
                                                           label = '选择成本核算方法',choiceNames = list('生产领料单','生产用料清单','BOM'),choiceValues = list('生产领料单','生产用料清单','BOM'),
                                                           selected = 'BOM'
                                           ),
                                           actionBttn('kjco_deal_price_btn','查看出库成本明细'),
                                           mdl_download_button('kjco_deal_price_dl','下载出库成本明细')
                                           
                                           
                                         )),
                                         column(8, box(
                                           title = "报表区域", width = NULL, solidHeader = TRUE, status = "primary",
                                           div(style = 'overflow-x: scroll',mdl_dataTable('kjco_deal_price_dataShow'))
                                         )
                                         ))
                                         
                                       )),
                                       tabPanel('计算步骤异常产品',tagList(
                                         fluidRow(column(4,box(
                                           title = "操作区域", width = NULL, solidHeader = TRUE, status = "primary",
                                           
                                           actionBttn('kjco_item_lowCode_btn','查看产品计算步骤异常'),
                                           mdl_download_button('kjco_item_lowCode_dl','查看产品计算步骤异常')
                                           
                                           
                                         )),
                                         column(8, box(
                                           title = "报表区域", width = NULL, solidHeader = TRUE, status = "primary",
                                           div(style = 'overflow-x: scroll',mdl_dataTable('kjco_item_lowCode_dataShow'))
                                         )
                                         ))
                                         
                                       ))
                                       
                                       
                                       
                                )
                         )
                       )
)