# 
paths = c(".", "~/OGS/GradGroupAnalysis")
npaths = normalizePath(paths)

#newDir = "."
#oldDir = normalizePath()

files = lapply(paths, list.files, recursive = TRUE, include.dirs = TRUE, all = TRUE, full.names = TRUE)

files2 = mapply(function(x, p) gsub( paste0("^", p, "/"), "", x),  files, npaths, SIMPLIFY = FALSE)

files2[[1]] = files2[[1]][ - grep("\\.git/", files2[[1]] ) ]

do.call(setdiff, files2)

#new2 = new[ - grep("\\.git/", new) ]
#old2 = gsub("^/Users/duncan/OGS/GradGroupAnalysis/", "", old)
#new3 = gsub("^\\./", "", new2)

setdiff(new3, old2)
setdiff(old2, new3)
