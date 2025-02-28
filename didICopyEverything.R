# compare 2 directories - for use after we extract a directory from a larger git repos. into
# its own repos but have untracked files in the original and move them over. This checks what we haven't copied yet.

cmpDirs = 
function(new = ".", old = "~/OGS/GradGroupAnalysis")
{
    paths = c(new, old)
    npaths = normalizePath(paths)

    files = lapply(paths, list.files, recursive = TRUE, include.dirs = TRUE, all = TRUE, full.names = TRUE)

    files2 = mapply(function(x, p) gsub( paste0("^", p, "/"), "", x),  files, npaths, SIMPLIFY = FALSE)

    files2[[1]] = files2[[1]][ - grep("\\.git/", files2[[1]] ) ]

    list(onlyInNew = do.call(setdiff, files2),
         notCopiedFromOld = do.call(setdiff, rev(files2)))
}
