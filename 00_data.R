# 设置app标题-----


app_title <-'康健数据处理平台V1.1';

# store data into rdbe in the rds database
app_id <- 'kjrds'

#设置数据库链接---

conn_be <- conn_rds('rdbe')



#设置链接---

conn <- conn_kjrds()
#测试环境
#conn <- tsda::conn_rds('kj613')





