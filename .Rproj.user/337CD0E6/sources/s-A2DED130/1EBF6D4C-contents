# GenerateSegments
# =========================================================================
# This function generate adjacent and overlapped segments from a protein sequence
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

GenerateSegments <- function(seq_str, k, is.original = FALSE) {
  divider_i = k
  seq = RemoveUnrecognizeAminoAcid(seq_str)

  seq.length = nchar(seq)
  part_length = round(seq.length/divider_i)

  if(exists("main_data")){
    rm("main_data")
  }

  #generate adjacent segments
  if(exists("adjacent_segments")){
    rm("adjacent_segments")
  }

  for(j in 1:divider_i){
    if(j > 1){
      start = ((j - 1) * part_length) + 1
      end = j * part_length

      if(j == divider_i){
        end = seq.length
      }
    } else {
      start = 1
      end = part_length
    }

    seq.part = substr(seq, start, end)

    if(!exists("adjacent_segments")){
      assign("adjacent_segments", seq.part)
    } else {
      adjacent_segments = rbind(adjacent_segments, seq.part)
    }
  }

  #generate overlapped segments
  if(exists("overlapped_segments")){
    rm("overlapped_segments")
  }

  for(j in 1:(divider_i-1)){
    half_adj_i = substr(adjacent_segments[j,], (round(nchar(adjacent_segments[j,])/2)), nchar(adjacent_segments[j,]))
    half_adj_i_plus_1 = substr(adjacent_segments[j+1,], 0, (round(nchar(adjacent_segments[j+1,])/2)))

    seq.part = paste0(half_adj_i, half_adj_i_plus_1)

    if(!exists("overlapped_segments")){
      assign("overlapped_segments", seq.part)
    } else {
      overlapped_segments = rbind(overlapped_segments, seq.part)
    }

    if(j == divider_i){
      break()
    }
  }

  #combine segments data
  if(is.original){
    main_data = rbind(seq, adjacent_segments, overlapped_segments)
    rownames(main_data)[1] = "original"
    rownames(main_data)[2:(divider_i+1)] = paste0("adjacent_", 1:divider_i)
    rownames(main_data)[(divider_i+2):(2*divider_i)] = paste0("overlapped_", 1:(divider_i-1))
  } else {
    main_data = rbind(adjacent_segments, overlapped_segments)
    rownames(main_data)[1:(divider_i)] = paste0("adjacent_", 1:divider_i)
    rownames(main_data)[(divider_i+1):(2*divider_i-1)] = paste0("overlapped_", 1:(divider_i-1))
  }

  colnames(main_data)[1] = "amino_acids"

  #return value
  return(main_data)
}
