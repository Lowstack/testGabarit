library(dplyr)
library(ggplot2)
library(wbstats)

ExportUSA <- wb_data(country = "USA", indicator ="NE.EXP.GNFS.CD")


tail(ExportUSA, n=50)

ExportUSA %>% 
  ggplot(aes(date, NE.EXP.GNFS.CD))+
  geom_point()+
  geom_line()+ 
  labs(title = "What's up", x = "Années", y = "Exportations en $USD" )+
  ggsave(
    filename = "bigGraphyBoii.pdf",
    scale = 1,
    device = "pdf",
    width = 8,
    height = 8,
    )

