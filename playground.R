df = read.csv("Duke Data_2018.csv")
oppo.df = read.csv("Opponent Data_2018.csv")

oppo.df[oppo.df == ''] = NA
oppo.df$date = as.Date(oppo.df$date)
oppo.df$X = NULL
oppo.df$id = NULL
for(i in names(oppo.df)){
  if(sum(is.na(oppo.df[i])) > 15000){
    oppo.df[i] = NULL
    next()
  }
  for(j in c("X", "id", "info")){
    if(grepl(j, i)){
      oppo.df[i] = NULL
    }
  }
}
colSums(is.na(oppo.df))
write.csv(oppo.df, "oppo calib.csv")
