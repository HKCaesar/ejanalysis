#' @title Overlay Two PDFs as Weighted Histograms
#' @description Use plotrix::weighted.hist to see overlay of two weighted histograms.
#' @details Does not handle NA values well yet. Assumes you have weights for each and are comparing values in one group vs another.
#' @param e Environmental or other indicator values vector
#' @param dcount Vector of weights for the demographic group of interest, such as population counts of Hispanics by Census tract.
#' @param refcount Vector of weights for the reference group, such as population counts of individuals who are not Hispanic, by Census tract.
#' @param etxt Character string to name e in graph
#' @param dtxt Character string to name d in graph
#' @param brks Default is 10. Passed as breaks param to plot function
#' @return Creates a plot
#' @seealso \code{\link{pop.cdf}}   \code{\link{pop.cdf2}} \code{\link{pop.ecdf}}  \code{\link{pop.cdf.density}}
#' @examples
#' \donotrun{
#' # can get a dataset for examples
#' load("~/../../Dropbox/EJSCREEN/R analysis/bg 2015-04-22 Rnames plus subgroups.RData")
#' # # to do this manually
#' # require(plotrix)
#' #weighted.hist(bg$proximity.rmp, bg$pop*bg$pctmin,
#' # main='pop hist for pctmin of RMP score', xlim=c(0,1.8),freq=FALSE,breaks=c(0:18)/10,col='red')
#' #weighted.hist(bg$proximity.rmp,bg$pop*(1-bg$pctmin),
#' # main='pop hist for pctmin of RMP score', xlim=c(0,1.8),freq=FALSE,breaks=c(0:18)/10,add=TRUE)
#' e <- bg$pm[!is.na(bg$pm)]
#' dcount   <- bg$pop[!is.na(bg$pm)] * bg$pctmin[!is.na(bg$pm)]
#' refcount <- bg$pop[!is.na(bg$pm)] * (1 - bg$pctmin[!is.na(bg$pm)])
#' brks = 0:17
#' etxt = 'PM2.5'
#' dtxt = 'minorities'
#'
#' #pop.cdf2(e, dcount, refcount, etxt, dtxt, brks)
#' pop.cdf2(e = e, dcount = dcount, refcount = refcount,
#'  etxt = etxt, dtxt = dtxt, brks = brks)
#' # *** BUT, why does it not look the same as ... *****
#' pop.cdf(scores = e, pcts = bg$pctmin, pops = bg$pop, breaks = brks,
#'  main='PM2.5 distribution within each group (minority vs other)',
#'   ylab='Density (percentage of group population)')
#' }
#' @export
pop.cdf2 <- function(e, dcount, refcount, etxt, dtxt, brks=10) {

  # much like ejanalysis::pop.cdf() but looks different for some reason
  # (also note it currently fails if NA values)

  plotrix::weighted.hist(e, dcount, breaks=brks,
                         main=paste(etxt, " distribution within each group
                                    (blue=', dtxt, ', clear=reference group)", sep=''),
                         freq = FALSE, col='lightblue', ylab='Density (percentage of group population)')
  plotrix::weighted.hist(e, refcount, breaks=brks , freq = FALSE, add=TRUE, col=NA, ylab='')
}
