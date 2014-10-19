# Reproducible Research: Peer Assessment 1
Ian F. McCallum
2014-10-19

**Prerequisites:** 
- The file 'activity.csv' is the working directory

### Loading and preprocessing the data

Read in the file 'acivity.csv'


```r
activity <- read.csv("activity.csv")

library(plyr)
library(ggplot2)
```

**Prerequisites:**
- The plyr package has been loaded
- The ggplot2 package has been loaded

### Question 1: What is mean total number of steps taken per day?

To plot the histogram of the number of steps, ddply is used to aggregate 
the data for each day.


```r
daily.activity <- ddply(activity, "date", summarise, daily.total=sum(steps))

p <- ggplot(daily.activity, aes(x=daily.activity$daily.total))
p <- p + geom_histogram(binwidth=2000, fill="orange", colour="lightgrey")
p <- p + ggtitle("Daily Step Total")
p <- p + xlab("Steps")

print(p)
```

![plot of chunk daily.total.histogram](./Assignment1_files/figure-html/daily.total.histogram.png) 

## What is the average daily activity pattern?

To plot the activity by interveral, ddply is used to aggregate 
the data for each interval



```r
interval.activity <- ddply(activity, "interval", 
                           summarise, mean.steps=mean(steps,na.rm=TRUE))

p <- ggplot(interval.activity, aes(x=interval, 
                                   y=mean.steps))
p <- p + geom_line()
p <- p + ggtitle("Interval Activity Patterns")
p <- p + xlab("Invterval")
p <- p + ylab("Steps")
print(p)
```

![plot of chunk activity.patterns](./Assignment1_files/figure-html/activity.patterns.png) 

## Imputing missing values



## Are there differences in activity patterns between weekdays and weekends?
