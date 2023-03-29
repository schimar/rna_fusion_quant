## duprate vs. expression smooth scatter
png(file=paste0(outdir,"/",gsub("(.*)\\.[^.]+","\\1",basename(bam)),"_dupRadar_drescatter.png"),
    width=1000, height=1000)
duprateExpDensPlot(dm, main=basename(bam))
dev.off()

## expression histogram
png(file=paste0(outdir,"/",gsub("(.*)\\.[^.]+","\\1",basename(bam)),"_dupRadar_ehist.png"),
    width=1000, height=1000)
expressionHist(dm)
dev.off()

## duprate vs. expression boxplot
png(file=paste0(outdir,"/",gsub("(.*)\\.[^.]+","\\1",basename(bam)),"_dupRadar_drebp.png"),
    width=1000, height=1000)
par(mar=c(10,4,4,2)+.1)
duprateExpBoxplot(dm, main=basename(bam))
dev.off()



png(file=paste0(outdir,"/",gsub("(.*)\\.[^.]+","\\1",basename(bam)),"_dupRadar_ebinhist.png"),
    width=1000, height=1000)
par(mar=c(10,4,4,2)+.1)
readcountExpBoxplot(dm) 
dev.off()



png(file=paste0(outdir,"/",gsub("(.*)\\.[^.]+","\\1",basename(bam)),"_dupRadar_multimap.png"),
    width=1000, height=1000)
par(mar=c(10,4,4,2)+.1)
hist(dm$mhRate, breaks= 50, col= 'grey60', main= "Frequency of multimapping rates", xlab= "Multimapping rate per gene", ylab= "Frequency")
dev.off()
