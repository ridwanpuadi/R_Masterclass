# Mengimpor library
library(ggplot2)

# Membuat plot pertama dengan data mtcars (layer 1 = data)
ggplot(data=mtcars)

dataku <- mtcars

# Membuat plot kedua dengan layer 2 = aesthetics (estetika)
ggplot(data=mtcars, aes(x=mpg, y=hp))

# Membuat plot ketiga dengan layer 3 = geometries (geometri)
ggplot(data=mtcars, aes(x=mpg, y=hp)) + geom_point()
# biasanya ditulis dengan cara lain
p <- ggplot(data=mtcars, aes(x=mpg, y=hp))
p + geom_point()

# Membuat plot keempat dengan layer 4 = facets
p + geom_point() + facet_grid(cyl ~ .)
# simbol ~ disebut dengan tilde

# Membuat plot kelima dengan layer 5 = statistics
p + geom_point() + facet_grid(cyl ~ .) + stat_sum()
p + geom_point() + facet_grid(cyl ~ .) + geom_count()
# perintah stat dan geom untuk layer statistics memiliki banyak kesamaan
p + geom_point() + facet_grid(cyl ~ .) + stat_smooth()

# Membuat plot keenam dengan layer 6 = coordinates
p2 <- p + geom_point() + facet_grid(cyl ~ .) + stat_sum()
p2 + coord_cartesian(xlim=c(15,30), expand=FALSE)

# Membuat plot ketujuh dengan layer 7 = themes (tema)
p2 + coord_cartesian(xlim=c(15,30)) + theme_bw()
