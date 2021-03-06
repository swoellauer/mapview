% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/plainView.R
\docType{methods}
\name{plainView}
\alias{plainView}
\alias{plainView,RasterLayer-method}
\alias{plainView,RasterStackBrick-method}
\alias{plainView,SpatialPixelsDataFrame-method}
\alias{plainview,ANY-method}
\alias{plainview}
\title{View raster objects interactively without background map but in any CRS}
\usage{
\S4method{plainView}{RasterLayer}(x,
  maxpixels = mapviewGetOption("plainview.maxpixels"),
  col.regions = mapviewGetOption("raster.palette")(256), at,
  na.color = mapviewGetOption("na.color"), legend = TRUE,
  verbose = mapviewGetOption("verbose"), layer.name = deparse(substitute(x,
  env = parent.frame())), gdal = TRUE, ...)

\S4method{plainView}{RasterStackBrick}(x, r = 3, g = 2, b = 1,
  na.color = mapviewGetOption("na.color"),
  maxpixels = mapviewGetOption("plainview.maxpixels"),
  layer.name = deparse(substitute(x, env = parent.frame())), ...)

\S4method{plainView}{SpatialPixelsDataFrame}(x, zcol = 1, ...)

\S4method{plainview}{ANY}(...)
}
\arguments{
\item{x}{a \code{\link{raster}}* object}

\item{maxpixels}{integer > 0. Maximum number of cells to use for the plot.
If maxpixels < \code{ncell(x)}, sampleRegular is used before plotting.}

\item{col.regions}{color (palette).See \code{\link{levelplot}} for details.}

\item{at}{the breakpoints used for the visualisation. See
\code{\link{levelplot}} for details.}

\item{na.color}{color for missing values.}

\item{legend}{logical, whether to draw a legend for the raster layer.}

\item{verbose}{should some details be printed during the process}

\item{layer.name}{the name of the layer to be shown on the map}

\item{gdal}{logical. If TRUE (default) gdalUtils::gdal_translate is used
to create the png file for display when possible. See details for further
information.}

\item{...}{additional arguments passed on to repective functions.
See \code{\link{addRasterImage}}, \code{\link{addCircles}},
\code{\link{addPolygons}}, \code{\link{addPolylines}} for details}

\item{r}{integer. Index of the Red channel, between 1 and nlayers(x)}

\item{g}{integer. Index of the Green channel, between 1 and nlayers(x)}

\item{b}{integer. Index of the Blue channel, between 1 and nlayers(x)}

\item{zcol}{attribute name or column number in attribute table
of the column to be rendered}
}
\description{
this function produces an interactive view of the specified
raster object(s) on a plain grey background but for any CRS.
}
\details{
If the raster object is not in memory
(i.e. if \code{raster::inMemory} is \code{FLASE})
and argument \code{gdal} is set to TRUE (default) gdalUtils::gdal_translate
is used to translate the rsater object to a png file to be rendered in
the viewer/browser. This is fast for large rasters. In this case, argument
\code{maxpixels} is not used, instead the image is rendered in original resolution.
However, this means that RasterLayers will be shown in greyscale.
If you want to set a color palette manually, use \code{gdal = FALSE} and
(optionally provide) \code{col.regions}.\cr
\cr
For plainView there are a few keyboard shortcuts defined:
\itemize{
  \item plus/minus - zoom in/out
  \item space - toggle antialiasing
  \item esc - zoom to layer extent
  \item enter - set zoom to 1
  \item ctrl - increase panning speed by 10
}
}
\section{Methods (by class)}{
\itemize{
\item \code{RasterStackBrick}: \code{\link{stack}} / \code{\link{brick}}

\item \code{SpatialPixelsDataFrame}: \code{\link{SpatialPixelsDataFrame}}

\item \code{ANY}: alias for ease of typing
}}

\examples{
\dontrun{
### raster data ###
library(sp)
library(raster)

data(meuse.grid)
coordinates(meuse.grid) = ~x+y
proj4string(meuse.grid) <- CRS("+init=epsg:28992")
gridded(meuse.grid) = TRUE
meuse_rst <- stack(meuse.grid)

# SpatialPixelsDataFrame
plainView(meuse.grid, zcol = "dist")


# raster layer
m1 <- plainView(poppendorf[[5]])
m1

# raster stack
plainview(poppendorf, 4, 3, 2)

}

}
\author{
Stephan Woellauer

Tim Appelhans
}
