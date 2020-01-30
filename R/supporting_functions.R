
#' #' Function to install pkgr on Windows, Mac, or Linux.
#' install_pkgr <- function() {
#'
#' }

#' generates pkgr.yml
#' @param pkgs vector of package names
#' @param repos vector of repos to use
generate_pkgr_config <- function(pkgs, repos=getOption("repos")) {
  y <- list()

  y$Version <- 1
  y$Packages <- pkgs
  y$Repos <- as.list(repos)
  #y$Library <-  "pkgr-libs"
  y$Lockfile <- list(Type="renv")

  yaml::write_yaml(y, "pkgr.yml")
  # y <- yaml::as.yaml(y)
}

#' Wrapper for pkgr install
#' @param exe_path path to pkgr executable
r_pkgr_install <- function(exe_path) {
  system2(exe_path, "install")
}

#' Wrapper for pkgr add
#' @param pkgr pkg to add
#' @param exe_path path to pkgr executable
r_pkgr_add <- function(exe_path, pkg) {
  system2(exe_path, paste("add",  pkg))
}

#' Wrapper for pkgr remove
#' @param pkg pkg to remove
#' @param exe_path path to pkgr executable
r_pkgr_remove <- function(exe_path, pkg) {
  system2(exe_path, paste("remove",  pkg))
}
