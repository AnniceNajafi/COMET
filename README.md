# <img src="https://github.com/TAMUGeorgeGroup/COMET/assets/62211977/bf645364-32df-4b8a-a19d-3898c93fd65a" width=200 height=200>

COMET is a computational framework for inferring EMT trajectories from timecourse single-cell RNA sequencing data. Here, we are providing COMET as an R package that can be installed and run for scoring scRNA sequencing data. 
COMET is now publicly available as an R package and is published in Cell iScience. For more information please refer to <a href="https://www.sciencedirect.com/science/article/pii/S2589004223010416">Najafi, A., Jolly, M. K., & George, J. T. (2023). Population Dynamics of EMT Elucidates the Timing and Distribution of Phenotypic Intra-tumoral Heterogeneity. iScience.</a>
<hr>
<br>
<h3>UPDATE (04/09/24): Parallelizing code over cores to increase the speed of code is added to the 'generate_pipeline_files' function of the R package. </h3>
<br>
<hr>
<br>
<h3>UPDATE (03/30/24): A web-based application of COMET that employs non-symmetric transition rates into the hybrid state is available. <a href=https://najafiannice.shinyapps.io/EMT_app_trial/>Access shinyCOMET here!</a></h3>
<br>
Please use username "guest" and password "1234" to login. If you are unable to login, please refresh the application.
<br>
<hr>
<br>
<h3>UPDATE (01/15/24): Protocol on COMET is published in STAR Protocols. <a href=https://www.sciencedirect.com/science/article/pii/S2666166723007864>Access protocol here!</a></h3>
<br>
<hr>
<br>
<img src="https://github.com/TAMUGeorgeGroup/COMET/assets/62211977/16e1d9a1-bbe7-4138-a9d5-4ba2aab8a35d" alt="model-diagram" width="400" height="550">
<h2>Guidelines</h2> 

Download <a href="https://zenodo.org/records/10050380">this zip file from Zenodo</a> and place it in a directory of your choice, then set your working directory to that path:
<br>
setwd("~/Desktop/COMET_STAR_protocol/")
<br>
Step I. Load relevant libraries
```
library(dplyr)
library(ggplot2)
library(tidyverse)
library(data.table)
library(tidyr)
library(reshape2)
library(Rmagic)
library(umap)
library(readxl)
library(Seurat)
library(archetypes)
library(phateR)
library(dtw)
library(pracma)
library(devtools)
```
Step II. Install the COMET package

```
devtools::install_github("AnniceNajafi/COMET")
```

Step III. Make sure that you set these three variables to the correct directory names
<ul>
  <li>Tables directory, should store a csv table with three columns, "Sample", "DataPath", and "MetaData" each of these should store the name of the input files (with no space), path to count matrix, and path to metadata respectively.</li>
  <li>Input Data directory, should store the metadata and the count matrix both stored in csv.gz formats, the meta.data should store a column named "Time" and have timepoints stored in numeric values.</li>
  <li>Input Files directory contains the necessary files for the pipeline to run such as list of important EMT genes for scoring, note that we are providing them separately so you can modify these lists directly.</li>
</ul>

<br>

This is an overview of how your directory should be structured:
<ul>
<li><strong>COMET_STAR_Protocol (working directory)</strong></li>
       <ul>
       <li>-Input_Data</li>
<ul>
  <li>-meta_data.csv.gz</li>
  <li>-matrix.csv.gz</li>
</ul>
<li>-Tables</li>
<ul>
    <li>-DataTableTest.csv (with columns named "Sample", "DataPath", and "MetaData". you should store <sample_name>, matrix.csv.gz, meta_data.csv.gz in that file)</li>
</ul>
</ul>
</ul>    

```
tables.dir <- "Tables/"
input.data.dir <- "Input_Data/"
input.files.dir <- "Input_Files/"
data.inputs <- read.csv(paste0(tables.dir, "DataTableTest.csv"), sep=",")
```

Step IV. Run the pipeline
For the example dataset, data coming from timepoints 7.33, 8, and 10 came were going through MET. To parallelize your code over cores set the parallelize argument to 'TRUE' for the 'generate_pipeline_files' function. 

```
COMET::start_pipeline(tables.dir, input.data.dir)
COMET::generate_pipeline_files(data.inputs, tables.dir, input.data.dir, parallelize=TRUE)
COMET::calculate_conf_intervals(data.inputs)
COMET::DTW_calculate(data.inputs,  c(7.33, 8, 10))
fit.all.data(data.inputs, c(7.33, 8, 10)) ->final.result
```

Step V. Visualize the results using the vignette notebooks 

<br>
For any technical questions, please contact <a href=mailto:annicenajafi@tamu.edu>Annice Najafi</a>. 
