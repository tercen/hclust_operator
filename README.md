# hclust operator

#### Description
`hclust` operator performs the SOM (self organizing maps) in the `hclust` from base R.

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
`corder`| character, order of cols after clustering

##### Details
The operator is the `hclust` function of the `base` R package.


#### References
see the `base::hclust` function of the R package for the documentation, 


##### See Also


#### Examples
