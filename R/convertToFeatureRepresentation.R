# ConvertToFeatureRepresentation
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

ConvertToFeatureRepresentation <- function(seq_str, z, prot_desc) {
  if(z < 2){
    stop("z must be bigger than 1.")
  }

  original_sequence = seq_str

  if(exists("main_data")){
    rm("main_data")
  }

  prot_desc_arr = unlist(strsplit(prot_desc, ','))

  #generate input with z value (original sequence, adjacent & overlapped segments)
  #------------------------------------------------------------------------------- start
  if(exists("data_segments")){
    rm("data_segments")
  }

  for(k in 2:z){
    data_segments_temp = GenerateSegments(seq_str, k)
    rownames(data_segments_temp) = paste0(k, "#", rownames(data_segments_temp))

    if(!exists("data_segments")){
      assign("data_segments", data_segments_temp)
    } else {
      data_segments = rbind(data_segments, data_segments_temp)
    }

    #print(GenerateSegments(seq_str, k))
    #print("---------------------------")
  }

  #add original sequence to data frame of segments
  data_segments = rbind(original_sequence, data_segments)
  rownames(data_segments)[1] = "1#original"
  data_segments.rownames = rownames(data_segments)
  print(rownames(data_segments))
  #------------------------------------------------------------------------------- end

  #looping for protein descriptor
  for(prot_desc_i in prot_desc_arr){
    #print(prot_desc_i)

    #generate feature representation
    for(data_input_i in 1:nrow(data_segments)){
      #print(paste(input_i,"==============================="))
      input_i = data_segments[data_input_i,]
      print(data_segments[data_input_i,])
      divider_i = GetKValueFromColName(data_segments.rownames[data_input_i])
      # print("------------")
      # print(data_segments.rownames[data_input_i])
      # print(divider_i)

      result = ConvertToFeatureRepresentationByDescriptor(input_i, prot_desc_i)
      result = t(result)
      colnames(result) = paste0(prot_desc_i, divider_i,".", colnames(result))

      if(!exists("main_data")){
        assign("main_data", result)
      } else {
        main_data = cbind(main_data, result)
      }
    }
  }

  return(main_data)
}
