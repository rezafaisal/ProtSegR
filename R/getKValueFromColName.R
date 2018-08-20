# GetKValueFromColName
# =========================================================================
# This function generate feature representation from original sequence, adjacent and overlapped segments
#
# You can learn more about package authoring with RStudio at:
#
#   http://r-pkgs.had.co.nz/
#
# Some useful keyboard shortcuts for package authoring:
#
#   Build and Reload Package:  'Ctrl + Shift + B'
#   Check Package:             'Ctrl + Shift + E'
#   Test Package:              'Ctrl + Shift + T'

GetKValueFromColName <- function(colname_str) {
  colname_str.arr = unlist(strsplit(colname_str, '#'))

  return(colname_str.arr[1])
}
