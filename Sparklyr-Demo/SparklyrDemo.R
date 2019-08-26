library('dplyr')
library('sparklyr')
library('DBI')

# https://www.youtube.com/watch?v=blJ6KgjwVbw
# create a spark session - we will use a custom conf for the 'sparklyr' connection
# 16GB memory for the driver
# Make 88% of memory accessible to use during the analysis

conf <- spark_config()
conf$'Sparklyr.shell.drive-memory' <- '16G'
conf$spark.memory.fraction <- 0.8

sc <- spark_connect(master = 'local', config = conf, version = '2.1.0')

# Navigate to http://127.0.0.1:4040/executers
# this routine will retrieve the column names

top_rows <- read.csv('D:/R_HandsOn/SparklyrApp/mnist_train.csv',nrows = 5)
file_column <- top_rows %>%
  purrr::map(function(x)"character")
rm(top_rows)

sp_flight <- spark_read_csv(sc,
                            name = 'flights',
                            path = 'D:/R_HandsOn/SparklyrApp/mnist_train.csv',
                            memory = FALSE,
                            columns = file_column,
                            infer_schema = FALSE
)

object.size(sp_flight)

# spark sql
# we will use the DBI package for sql operations in sparklyr
# dbGetQuery() pulls the data into R automatically ie pulls into memory

top10 <- dbGetQuery(sc, 'Select * from flights limit 10')

top10

# show_query() - to display what is the sql query that 'dplyr' will send to spark
sp_flight %>%
  head %>%
  show_query()
 

# compute() - it cache a spark data frame into memory
# It performs two operatopns - sdf_regitry() and tbl_cache()
subset_table <- flights_table %>%
  compute('flights_subset')







