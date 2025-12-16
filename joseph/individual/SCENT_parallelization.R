args <- commandArgs(trailingOnly = TRUE)

library(SCENT)

#Obtain arguments: (from Cluster)
node = as.integer(args[1]) # integer. JOB ARRAY number: node usage
cores = as.integer(args[2]) # integer. Number of Cores
celltype = args[3] # character. CellType
group = args[4] # character. Group name
output_dir  = args[5] # character. Output of each text file to a specific folder

print(node)
print(cores)
print(celltype)
print(group)
print(output_dir)

base <- "/nowakowskilab/data1/Joseph/bmi_206/"
SCENTobj_rds <- paste0(base, "SCENT_obj_wang_", group, ".rds")
SCENT_obj <- readRDS(SCENTobj_rds)

SCENT_algorithm_new <- function(object, celltype, ncores){
  res <- data.frame()
  print('Starting SCENT Algorithm...')
  for (n in 1:nrow(object@peak.info)){ ####c(1:nrow(chunkinfo))

    gene <- object@peak.info[n,1] #GENE is FIRST COLUMN OF PEAK.INFO
    this_peak <- object@peak.info[n,2] #PEAK is SECOND COLUMN OF PEAK.INFO
    print(paste0(gene, " - ", this_peak, " - ", n, "/", nrow(object@peak.info)))

    atac_target <- data.frame(cell = colnames(object@atac), atac = object@atac[this_peak,])

    #binarize peaks:
    if(nrow(atac_target[atac_target$atac>0,])>0){
      atac_target[atac_target$atac>0,]$atac<-1
    }

    mrna_target <- object@rna[gene,]
    df <- data.frame(cell=names(mrna_target),exprs=as.numeric(mrna_target))
    df<-merge(df,atac_target,by="cell")
    df<-merge(df,object@meta.data,by="cell")

    df2 <- df[df$celltypes == celltype,]

    nonzero_m  <- length( df2$exprs[ df2$exprs > 0] ) / length( df2$exprs )
    nonzero_a  <- length( df2$atac[ df2$atac > 0] ) / length( df2$atac )

    if(nonzero_m > 0.05 & nonzero_a > 0.05){ # expression and atac peaks in at least 5% of cells
      #Run Regression Once Before Bootstrapping:
      res_var <- "exprs"
      pred_var <- c("atac", object@covariates)
      formula <- as.formula(paste(res_var, paste(pred_var, collapse = "+"), sep = "~"))


      #Estimated Coefficients Obtained without Bootstrapping:
      base = glm(formula, family = 'poisson', data = df2)
      coefs<-summary(base)$coefficients["atac",]
      assoc <- assoc_poisson
      print(assoc)

      bs = boot::boot(df2,assoc, R = 50, formula = formula, stype = 'i', parallel = "multicore", ncpus = ncores)
      p0 = basic_p(bs$t0[1], bs$t[,1])
      if(p0<0.1) {
        bs = boot::boot(df2,assoc, R = 500, formula = formula,  stype = 'i', parallel = "multicore", ncpus = ncores)
        p0 = basic_p(bs$t0[1], bs$t[,1])
      }
      out <- data.frame(gene=gene,peak=this_peak,beta=coefs[1],se=coefs[2],z=coefs[3],p=coefs[4],boot_basic_p=p0)
      res<-rbind(res,out)
    }
  }

  #Update the SCENT.result field of the constructor in R:
  object@SCENT.result <- res
  return(object)
}

#### Get the corresponding dataframe from the list:
SCENT_obj@peak.info <- SCENT_obj@peak.info.list[[node]]

SCENT_obj <- SCENT_algorithm_new(SCENT_obj, celltype, cores)

#### Output SCENT results for each gene-peak pair block.
filename <- paste0(output_dir,"/SCENTresult_",celltype,"_",group,"_",node,".txt")

write.table(SCENT_obj@SCENT.result, file = filename, row.names = F, col.names = T, quote = F)