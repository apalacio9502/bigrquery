% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/bq-refs.R
\name{bq_refs}
\alias{bq_dataset}
\alias{as_bq_dataset}
\alias{bq_table}
\alias{as_bq_table}
\alias{bq_job}
\alias{as_bq_job}
\title{S3 classes that reference remote BigQuery datasets, tables and jobs}
\usage{
bq_dataset(project, dataset)

as_bq_dataset(x)

bq_table(project, dataset, table = NULL)

as_bq_table(x)

bq_job(project, job)

as_bq_job(x)
}
\arguments{
\item{project, dataset, table, job}{Individual project, dataset, table,
and job identifiers (strings).

For \code{bq_table()}, you if supply a \code{bq_dataset} as the first argument,
the 2nd argument will be interpreted as the \code{table}}

\item{x}{An object to coerce to a \code{bq_job}, \code{bq_dataset}, or \code{bq_table}.
Built-in methods handle strings and lists.}
}
\description{
Create references to BigQuery datasets, jobs, and tables. Each class
has a constructor function (\code{bq_dataset()}, \code{bq_table()}, \code{bq_job()})
and a coercion function (\code{as_bq_dataset()}, \code{as_bq_table()}, \code{as_bq_job()}).
The coercions functions come with methods for strings (which find components
by splitting on \code{.}), and lists (which look for named components like
\code{projectId} or \code{project_id}).

All \code{bq_table_}, \code{bq_dataset_} and \code{bq_job_} functions call the appropriate
coercion functions on their first argument, allowing you to flexible specify
their inputs.
}
\examples{
# Creation ------------------------------------------------
samples <- bq_dataset("publicdata", "samples")
natality <- bq_table("publicdata", "samples", "natality")
natality

# Or
bq_table(samples, "natality")

bq_job("bigrquery-examples", "m0SgFu2ycbbge6jgcvzvflBJ_Wft")

# Coercion ------------------------------------------------
as_bq_dataset("publicdata.shakespeare")
as_bq_table("publicdata.samples.natality")

as_bq_table(list(
  project_id = "publicdata",
  dataset_id = "samples",
  table_id = "natality"
))

as_bq_job(list(
  projectId = "bigrquery-examples",
  jobId = "US.job_m0SgFu2ycbbge6jgcvzvflBJ_Wft"
))

}
\seealso{
\link{api-job}, \link{api-perform}, \link{api-dataset}, and \link{api-table} for
functions that work with these objects.
}