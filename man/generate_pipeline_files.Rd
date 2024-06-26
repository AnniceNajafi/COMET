% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/COMET_functions.R
\name{generate_pipeline_files}
\alias{generate_pipeline_files}
\title{This function is to be ran for all cutoffs, purpose is to find the optimal
number of EMT genes to minimize the DTW distance between the flow cytometry
trajectories and data}
\usage{
generate_pipeline_files(data.inputs, tables.dir, input.data.dir, parallelize)
}
\arguments{
\item{data.inputs}{the input datasheet stored in a csv file in the tables dir}

\item{tables.dir}{directory with a csv file that had the address
for the data and metadata}

\item{input.data.dir}{this is the directory where the input file
should be saved in}

\item{parallelize}{this boolean variable indicates whether code is parallelized
over cores or not, set parallelize to 'TRUE' for parallelizing code over cores}
}
\value{
does not return, saves the files in the COMET_populated_files dir
}
\description{
This function is to be ran for all cutoffs, purpose is to find the optimal
number of EMT genes to minimize the DTW distance between the flow cytometry
trajectories and data
}
