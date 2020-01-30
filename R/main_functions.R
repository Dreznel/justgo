
#' now
#' function to init this R environment with a pkgr.yml file and isolate it with pkgr.yml
#' @param pkgs vector of packages to include in initial  pkgr.yml file.
#' @export
now <- function(pkgs = c()) {
  ## See if pkgr is installed
  pkgr_path <- Sys.which("pkgr")
  if(pkgr_path == "") {
    stop("pkgr installation not found. Is pkgr installed and on your PATH?")
  }

  ## If so, copy over the template .yml file to the working directory (maybe write this?_)
  generate_pkgr_config("tidyverse")

  ## Check if renv is installed
  renv_installed <- length(which(installed.packages()[,1] == "renv")) > 0

  ## If no, use tmp pkgr.yml and install to tmp folder, add tmp folder to libpaths, then run  init.
  if(!renv_installed) {
    tmp <-tempdir()
    .libPaths(tmp)
    install.packages(pkgs = "renv", lib = tmp, repos = c(getOption("repos"), "https://cran.rstudio.com/"))
    #stop("please install renv")
  }

  ## If  yes, run init
  renv::init()

  ## Add packages via system2(pkgr add ...)
  for(p in pkgs) {
    r_pkgr_add(pkgr_path, p)
  }

  ## Install packages via system2(pkgr install)
  r_pkgr_install(pkgr_path)
}

#' this_too
#' adds a package to your pkgr.yml file and installs it.
# this_too <- function() {
#
# }


