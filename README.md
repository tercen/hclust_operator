# hclust operator

#### Description
`hclust` operator performs a hierarchical clustering.

##### Usage
Input projection|.
---|---
`row`   | represents the row data
`col`   | represents the col data
`y-axis`| is the value of measurement


Input parameters|.
---|---
`scale`   | boolean, scaled to have unit variance before the analysis takes place
`center`  | boolean, shifted to be zero center before the analysis takes place
`fill` | numeric, a fill in value for datapoints structural missings

Output relations|.
---|---
`rorder`| numeric, order of rows after clustering
`corder`| numeric, order of cols after clustering

##### Details
The operator is the implementation of the `hclust` function of the `base` [R package](https://www.rdocumentation.org/packages/stats/versions/3.6.2/topics/hclust).


#### References
see https://en.wikipedia.org/wiki/Hierarchical_clustering


##### See Also


#### Examples
