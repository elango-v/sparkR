if (nchar(Sys.getenv("SPARK_HOME")) < 1) {
  Sys.setenv(SPARK_HOME = "/home/spark")
}
library(SparkR, lib.loc = c(file.path(Sys.getenv("SPARK_HOME"), "R", "lib")))
sparkR.session(master = "local[*]", sparkConfig = list(spark.driver.memory = "2g"))
df <- as.DataFrame(faithful)
head(df)

greenTaxi<-read.parquet("C:\\code-repo\\data\\green_tripdata_2022-08.parquet")
head(greenTaxi)

createOrReplaceTempView(greenTaxi,"tblGreenTaxi")
filteredDF<- sql("select VendorID from tblGreenTaxi limit 5")
head(filteredDF)
printSchema(greenTaxi)
