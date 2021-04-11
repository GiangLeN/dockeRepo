source("renv/activate.R")
branch <- system("git rev-parse --abbrev-ref HEAD", intern = TRUE)
Sys.setenv(RENV_PATHS_LIBRARY = file.path("renv/library/branches", branch))
