files = list.files(pattern="*.txt")
#alternatively- temp = list.files(pattern="*.csv")
#for (i in 1:length(temp)) assign(temp[i], read.csv(temp[i]))
myfiles = do.call(rbind, lapply(files, function(x) read.delim(x, stringsAsFactors = FALSE,skip=12,nrows=27,header=TRUE)))
colname = c("Base", "Mean",	"Median", "Lower_Quartile",	"Upper_Quartile",	"10th_Percentile", "90th_Percentile")
colnames(myfiles) = colname
library(dplyr)
grouped = group_by(myfiles,Base)
total_FastQC = summarise(grouped, 
      new_mean = mean(Mean), 
      new_median = median(Median),
      new_lower_quantile = quantile(Median,probs = 0.25),
      new_upper_quantile = quantile(Median, probs = 0.75),
      new_10th_percentile = quantile(Median, probs = 0.10),
      new_90th_percentile = quantile(Median, probs = 0.90)
    )
    
    
