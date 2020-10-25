# 设置app标题-----


app_title <-'康健数据处理平台V2.1';
#2.1
# 增加成本管理模块
#V2.0
#增加生产订单自动重新保存生产订单提交，生产订单审核及生产订单下达功能

#V1.6
#增加安全库存模板的下载

#V1.5
#增加安全库存报表1

#V1.4
# 添加客户中的发票类型及开票据要求
#添加物料中的开票名称及规格型号
#change log  upgrade into txt
#upgrade into v1.3
#增加模板匹配

# store data into rdbe in the rds database
app_id <- 'kjrds'

#设置数据库链接---

conn_be <- conn_rds('rdbe')



#设置链接---

conn <- conn_kjrds()

conn_kjco <- kjrdspkg::conn_kjco()
#测试环境
#conn <- tsda::conn_rds('kj613')

#安全库存模板---

tpl_mtrl <- readxl::read_excel("www/安全库存查询模板.xlsx", 
                       sheet = "物料")
tpl_stock <-readxl::read_excel("www/安全库存查询模板.xlsx", 
                               sheet = "仓库")
tpl_inv <- list(tpl_mtrl,tpl_stock)
names(tpl_inv) <-c('物料','仓库')



#成本报表期间
kjco_period <- function(){
  
  res <-list('2020-03','2020-04','2020-05','2020-06','2020-07')
  return(res)
}
  



