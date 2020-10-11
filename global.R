## global.R ##
# 加载R包-----
enableBookmarking(store = "url")
#设置shiny最大文件的上传大小
#最大的上传附件设置为30M
options(shiny.maxRequestSize=30*1024^2) 
library(shiny);
library(shinydashboard);
library(tsda);
library(tsdo);
library(tsui);
library(dplyr)
library(shinyjs)
library(glue)
library(shinyauthr)
library(digest)
library(shinyWidgets)
library(tsai);
library(shinyalert);
library(rclipboard);
library(DTedit);
library(rdfp);
library(kjrdspkg);
library(kdcr); 
#添加对金蝶云ERP的操作接口


source('00_data.R',encoding = 'utf-8');
source('01_row_body.R',encoding = 'utf-8');
source('02_column_body.R',encoding = 'utf-8');
source('03_book_body.R',encoding = 'utf-8');
source('04_series_body.R',encoding = 'utf-8');
source('05_majority_body.R',encoding = 'utf-8');
source('06_tutor_body.R',encoding = 'utf-8');
source('99_sysSetting_body.R',encoding = 'utf-8');
source('workAreaSetting.R',encoding = 'utf-8')










