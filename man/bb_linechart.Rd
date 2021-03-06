% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/bb_helpers.R
\name{bb_linechart}
\alias{bb_linechart}
\title{Helper for creating a line chart}
\usage{
bb_linechart(bb, data, mapping = NULL, type = "line", show_point = FALSE,
  ...)
}
\arguments{
\item{bb}{A \code{billboard} \code{htmlwidget} object.}

\item{data}{A \code{data.frame} or a \code{vector}.}

\item{mapping}{Mapping of variables on the chart, see \code{\link{bbaes}}.}

\item{type}{Type of chart : line, spline, step, area, area-spline, area-step.}

\item{show_point}{Whether to show each point in line.}

\item{...}{Not used.}
}
\value{
A \code{billboard} \code{htmlwidget} object.
}
\description{
Helper for creating a line chart
}
\note{
This function can be used with \code{\link{billboarderProxy}} in shiny application.
}
\examples{

## Different types
x <- round(rnorm(20), 2)

billboarder() \%>\% 
  bb_linechart(data = x)

billboarder() \%>\% 
  bb_linechart(data = x, type = "spline")

billboarder() \%>\% 
  bb_linechart(data = x, type = "area")

billboarder() \%>\% 
  bb_linechart(data = x, type = "area-spline")
  
  
## Timeserie with date (Date)
data("economics", package = "ggplot2")

billboarder() \%>\%
  bb_linechart(data = economics[, c("date", "psavert")]) \%>\% 
  bb_x_axis(tick = list(format = "\%Y-\%m", fit = FALSE)) \%>\%
  bb_y_axis(tick = list(format = suffix("\%")), 
            label = list(text = "Personal savings rate")) \%>\% 
  bb_legend(show = FALSE) \%>\% 
  bb_x_grid(show = TRUE) \%>\% 
  bb_y_grid(show = TRUE) \%>\% 
  bb_subchart(show = TRUE)
  
  
# With multiple lines :

data("economics_long", package = "ggplot2")

billboarder() \%>\%
  bb_linechart(economics_long, bbaes(date, value, variable)) \%>\% 
  bb_data(hide = "pop") \%>\% 
  bb_x_axis(tick = list(format = "\%Y-\%m", fit = FALSE))
  
  

## Timeserie with datetime (POSIXct)
data("cdc_prod_filiere")

billboarder() \%>\% 
  bb_linechart(data = cdc_prod_filiere[, c("date_heure", "prod_eolien")])

# or with mapping :
billboarder() \%>\% 
  bb_linechart(cdc_prod_filiere, bbaes(date_heure, prod_bioenergies))
  
  
 
### Other type for x-axis 
 
## character/factor on x-axis
AirPassengers1960 <- data.frame(
  month = month.name, 
  AirPassengers = tail(AirPassengers, 12)
)
# you have to specify that x-axis is of type 'category'
# and that column 'month' must be used for x-axis values
billboarder() \%>\% 
  bb_linechart(data = AirPassengers1960, x = "month") \%>\% 
  bb_x_axis(type = "category")


## numeric on x-axis
lynx.df <- data.frame(
  year = time(lynx),
  lynx = lynx
)
# just specify which variable must be use n the x-axis
billboarder() \%>\% 
  bb_linechart(data = lynx.df, x = "year")
  
}
