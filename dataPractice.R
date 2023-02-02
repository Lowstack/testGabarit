library(dplyr)
library(wbstats)
library(ggplot2)
library(scales)

ExportUSA <- wb_data(country = "USA", indicator ="NE.EXP.GNFS.CD")


ExportUSA %>% 
  ggplot(aes(date, NE.EXP.GNFS.CD))+
  geom_point(colour="red")+
  geom_line(colour="blue")+ 
  labs(title = "Exportations amércaines en $USD de 1970 à 2020", x = "Années", y = "Exportations en $USD" )+
  scale_y_continuous(expand = c(0,0),
                     limits=c(0, 3000000000000), 
                     labels = label_number(suffix = "T", scale = 1e-11),
                     breaks=seq(from = 0, to = 3000000000000, by = 500000000000)
                     )+
  scale_x_continuous(limits = c(1970, 2022), 
                     expand = c(0,0),
                     breaks=seq(from = 1970, to = 2020, by = 5)
                     )+
  geom_smooth()+
  theme_classic()+
  ggsave(
    filename = "bigGraphyBoii.pdf",
    scale = 1,
    device = "pdf",
    width = 8,
    height = 8
    )