# 设置app标题-----


app_title <-'康健数据处理平台V1.5';
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
#测试环境
#conn <- tsda::conn_rds('kj613')





