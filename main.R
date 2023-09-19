library(tercen)
library(tercenApi)
library(dplyr)
library(reshape2)
library(fastcluster)

ctx <- tercenCtx() 

do.scale <- ctx$op.value('scale', as.logical, FALSE)
fill <- ctx$op.value('fill', as.double, 0)
method <- ctx$op.value('method', as.character, "single")
metric <- ctx$op.value('metric', as.character, "euclidean")

data = ctx %>% as.matrix(fill = fill)

if(do.scale) data = t(scale(t(data)))

rorder0 <- fastcluster::hclust.vector(data, method = method, metric = metric)$order
corder0 <- fastcluster::hclust.vector(t(data), method = method, metric = metric)$order

# cresult = data.frame(
#   .ci = seq(from = 0, to = length(corder0) - 1),
#   corder = as.double(corder0)
# ) %>% ctx$addNamespace()
# 
# rresult = data.frame(
#   .ri = seq(from = 0, to = length(rorder0) - 1),
#   rorder = as.double(rorder0)
# ) %>% ctx$addNamespace()

ci = seq(from = 0, to = length(corder0) - 1)
ri = seq(from = 0, to = length(rorder0) - 1)

corder = as.double(ci)
rorder = as.double(ri)

ci = ci[corder0]
ri = ri[rorder0]

cresult = data.frame(.ci = ci,
                     corder = corder) %>% ctx$addNamespace()

rresult = data.frame(.ri = ri,
                     rorder = rorder) %>% ctx$addNamespace()

df.out<-list(cresult, rresult)

df.out %>%
  ctx$save()


