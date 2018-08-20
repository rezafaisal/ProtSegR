# RemoveUnrecognizeAminoAcid
# =========================================================================
# This function remove amino acid code that is not in these 20 amino acids:
# Glycine/G
# Alanine/A
# Valine/V
# Cysteine/C
# Proline/P
# Leucine/L
# Isoleucine/I
# Methionine/M
# Tryptophan/W
# Phenylalanine/F
# Lysine/K
# Arginine/R
# Histidine/H
# Serine/S
# Threonine/T
# Tyrosine/Y
# Asparagine/N
# Glutamine/Q
# Aspartic Acid/D
# Glutamic Acid/E
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

RemoveUnrecognizeAminoAcid <- function(seq_str) {
  #remove B, J, X, Z in seq
  seq_str =  gsub("B", "", seq_str)
  seq_str =  gsub("J", "", seq_str)
  seq_str =  gsub("X", "", seq_str)
  seq_str =  gsub("Z", "", seq_str)
  seq_str =  gsub("U", "", seq_str)
  seq_str =  gsub("O", "", seq_str)

  return(seq_str)
}
