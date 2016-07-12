library(ggplot2)
temp<- read.table("/mnt/local-disk1/rsgeno2/huangyin/PRC2/igvbed/random_local_region_blind_model.aucs",skip = 1)
temp<- read.table("/mnt/local-disk1/rsgeno2/huangyin/PRC2/igvbed/Random_position_1KB_p1e-2_blind_model.aucs.txt",skip = 1)
temp<- read.table("/mnt/local-disk1/rsgeno2/huangyin/PRC2/igvbed/Random_region_1KB_p1e-2_blind_model.aucs.txt",skip = 1)

temp$AUC<- "AUC"

ggplot(temp,aes(AUC,V1))  + geom_boxplot(colour = "black",alpha=0.5,size = 2,width = 0.5) + geom_jitter(width = 0.25,colour = "#3366FF")+
  labs(x = "",y = "",title="Random region 1KB blind model") +
theme(plot.title = element_text(color="black", size=20, face="bold.italic"),
axis.title.x = element_text( face="bold",size=14),
#axis.title.y = element_text(color="#993333", size=14, face="bold"),
legend.title =element_text(face = "bold", size = 14, color = "black"),
legend.text = element_text(face = "bold", size = 12),
axis.text.x = element_text(face="bold",size=14),
axis.text.y = element_text(face="bold", size=14),
panel.background = element_rect(fill = "white"),
panel.border = element_rect(fill = "NA", colour = "black", size = 2)
)


require(R.matlab)
temp.files<-list.files("/mnt/local-disk1/rsgeno2/huangyin/PRC2/igvbed/Tu_20151220_PRC2_summary1",pattern = ".mat")
temp<-sapply(temp.files,function(x)readMat(paste0("/mnt/local-disk1/rsgeno2/huangyin/PRC2/igvbed/Tu_20151220_PRC2_summary1/",x))$auc.all)
temp<- cbind(temp[,4],temp[,1:3],temp[,6],temp[,c(5,7)])
colnames(temp)<- c(0,0.5,1,1.5,2,3,4,5)
boxplot(temp)
temp<- as.data.frame(temp)
require(reshape2)
temp.files<-list.files("/mnt/local-disk1/rsgeno2/huangyin/PRC2/igvbed/beta_for_P0.01_predictors/",pattern = ".mat")
temp<-sapply(temp.files,function(x)readMat(paste0("/mnt/local-disk1/rsgeno2/huangyin/PRC2/igvbed/beta_for_P0.01_predictors/",x))$auc.all)
temp<- as.data.frame(temp)
boxplot(temp)
colnames(temp)<- c(0,0.25,0.5,0.75,1,1.5,2)

require(ggplot2)
ggplot(melt(temp),aes(variable,value))  + geom_boxplot(colour = "black",alpha=0.5,size = 2,width = 0.5) + geom_jitter(width = 0.25,colour = "#3366FF")+
  labs(x = "beta",y = "AUC",title="StandardCV auc value for beta") +
  theme(plot.title = element_text(color="black", size=20, face="bold.italic"),
        axis.title.x = element_text( face="bold",size=14),
        axis.title.y = element_text(color="black", size=14, face="bold"),
        legend.title =element_text(face = "bold", size = 14, color = "black"),
        legend.text = element_text(face = "bold", size = 12),
        axis.text.x = element_text(face="bold",size=14),
        axis.text.y = element_text(face="bold", size=14),
        panel.background = element_rect(fill = "white"),
        panel.border = element_rect(fill = "NA", colour = "black", size = 2)
  )