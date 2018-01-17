# Hierarchical Cluster

```
https://github.com/tercen/hclust_operator.git
```

```R

packrat::off()
unlink('packrat', recursive = TRUE)

devtools::install_github("tercen/TSON", ref = "1.4-rtson", subdir="rtson", upgrade_dependencies = TRUE)
devtools::install_github("tercen/teRcen", ref = "0.4.7", upgrade_dependencies = TRUE)
 
remove.packages("tercen", lib = "./packrat/lib/x86_64-pc-linux-gnu/3.3.2")
remove.packages("rtson", lib = "./packrat/lib/x86_64-pc-linux-gnu/3.3.2")
  
packrat::init(options = list(
  use.cache = TRUE
  ))
  
git add -A && git commit -m "bad param" && git tag -a 0.0.4 -m "++" && git push && git push --tags
```

```R

packrat::status()
packrat::snapshot()

packrat::off()

packrat::bundle(include.src=FALSE, overwrite = TRUE, include.bundles=FALSE)

```

