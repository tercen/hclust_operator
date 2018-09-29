library(tercen)
library(dplyr)
 
data = (ctx = tercenCtx())  %>% 
  select(.ci, .ri, .y) %>% 
  reshape2::acast(.ci ~ .ri, value.var='.y', fill=as.double(ctx$op.value('fill')), fun.aggregate=mean)

if (as.logical(ctx$op.value('scale'))) data = t(scale(t(data)))

corder0 = hclust(dist(data))$order
rorder0 = hclust(dist(t(data)))$order
ci = seq(from=0,to=length(corder0)-1)
ri = seq(from=0,to=length(rorder0)-1)


corder = as.double(ci)
rorder = as.double(ri)

ci = ci[corder0]
ri = ri[rorder0]

# corder = as.double(hclust(dist(data))$order)
# rorder = as.double(hclust(dist(t(data)))$order)

#cresult = data.frame(.ci = seq(from=0,to=length(corder)-1),
 #                    corder=corder) %>% ctx$addNamespace()

#rresult = data.frame(.ri=seq(from=0,to=length(rorder)-1),
 #                    rorder=rorder) %>% ctx$addNamespace()


cresult = data.frame(.ci = ci,
                     corder=corder) %>% ctx$addNamespace()

rresult = data.frame(.ri=ri,
                     rorder=rorder) %>% ctx$addNamespace()


list(cresult, rresult) %>% ctx$save()

