library(ggplot2)

df = read.table('D:/webLogs/access.log')

colnames(df)=c('host','ident','authuser','date','time','request','status','bytes','duration')

df$date=as.Date(df$date,"[%d/%b/%Y")

head(df)

table(df$status)

reqs=as.data.frame(table(df$date))


pdf("D:/webLogs/graph1.pdf")
ggplot(data=reqs, aes(x=as.Date(Var1), y=Freq)) + geom_line() + xlab('Date') + ylab('Requests') + opts(title='Traffic to Site')
dev.off()

pdf("D:/webLogs/graph2.pdf")
ggplot(data=df, aes(x=format(status))) + geom_bar() + xlab('Status') + ylab('Count') + opts(title='Status') 
dev.off()