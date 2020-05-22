#library(tsda)
conn <- tsda::sql_conn_common(ip = "rm-uf6e13noj5yiye7s92o.sqlserver.rds.aliyuncs.com",
                        port = 3433,
                        user_name = "kangjian",
                        password ="kangjian@2019" ,
                        db_name = "AIS20191122134531")
# 
# sql <- "select top  10  *  from t_bd_material"
# 
# mydata <- tsda::sql_select(conn,sql)
# 
# # View(mydata)