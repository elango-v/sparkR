library(sparklyr)
library(dplyr)
library(DBI)
Sys.setenv(SPARK_HOME="C:\\Users\\Elango\\Downloads\\spark-3.2.3-bin-hadoop3.2\\spark-3.2.3-bin-hadoop3.2")
conf <- spark_config()
conf$`sparklyr.cores.local` <- 6
conf$`sparklyr.shell.driver-memory` <- "1G"
conf$spark.executor.memory <- "2G" 
sc <- spark_connect(master = "local", config = conf)
tbl_mtcars <- copy_to(sc, mtcars, "spark_mtcars")

#spark_read_csv(sc,name="flights_tbl",path="C:\\code-repo\\data\\2015-summary.csv")
#dbGetQuery(sc, "SELECT ORIGIN_COUNTRY_NAME , DEST_COUNTRY_NAME , count from flights_tbl order by  count desc,ORIGIN_COUNTRY_NAME limit 10")
spark_disconnect(sc)