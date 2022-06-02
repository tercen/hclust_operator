library(tercen)
library(tercenApi)
library(dplyr)
library(reshape2)
library(fastcluster)

ctx <- tercenCtx() 

do.scale <- ctx$op.value('scale', as.logical, FALSE)
fill <- ctx$op.value('scale', as.double, 0)
method <- ctx$op.value('method', as.character, "single")
metric <- ctx$op.value('metric', as.character, "euclidean")

data = ctx %>% as.matrix(fill = fill)

if(do.scale) data = t(scale(t(data)))

rorder0 <- fastcluster::hclust.vector(data, method = method, metric = metric)$order
corder0 <- fastcluster::hclust.vector(t(data), method = method, metric = metric)$order

cresult = data.frame(
  .ci = seq(from = 0, to = length(corder0) - 1),
  corder = as.double(corder0)
) %>% ctx$addNamespace()

rresult = data.frame(
  .ri = seq(from = 0, to = length(rorder0) - 1),
  rorder = as.double(rorder0)
) %>% ctx$addNamespace()

list(cresult, rresult) %>% ctx$save()

