library(tercen)
library(dplyr)

data = (ctx = tercenCtx())  %>% 
  select(.ci, .ri, .y) %>% 
  reshape2::acast(.ci ~ .ri, value.var='.y', fun.aggregate=mean)

corder = as.double(hclust(dist(data))$order)
rorder = as.double(hclust(dist(t(data)))$order)

cresult = data.frame(.ci = seq(from=0,to=length(corder)-1),
                     corder=corder) %>% ctx$addNamespace()

rresult = data.frame(.ri=seq(from=0,to=length(rorder)-1),
                     rorder=rorder) %>% ctx$addNamespace()

list(cresult, rresult) %>% ctx$save()
