# Mengimpor library
library(tidyr)

# Membuat dataframe
saham <- c('a','a','a','b','b','b','c','c','c')
tahun <- c(2019,2020,2021,
           2019,2020,2021,
           2019,2020,2021)
k1 <- runif(9, 1, 3000)
k2 <- runif(9, 1, 3000)
k3 <- runif(9, 1, 3000)
k4 <- runif(9, 1, 3000)
data.saham <- data.frame(tahun=tahun, saham=saham, kuartal1=k1,
                         kuartal2=k2, kuartal3=k3, kuartal4=k4)

# perintah gather()
gather(data=data.saham, key='kuartal', value='nilai', kuartal1:kuartal4)
baru <- gather(data=data.saham, key='kuartal', value='nilai', kuartal1:kuartal4)
baru2 <- data.saham %>% gather('kuartal', 'nilai', kuartal1:kuartal4)

# penggunaan contoh di gather()
stocks <- tibble(
  time = as.Date('2009-01-01') + 0:9,
  X = rnorm(10, 0, 1),
  Y = rnorm(10, 0, 2),
  Z = rnorm(10, 0, 4)
)
stocks2 <- data.frame(
  time = as.Date('2009-01-01') + 0:9,
  X = rnorm(10, 0, 1),
  Y = rnorm(10, 0, 2),
  Z = rnorm(10, 0, 4)
)

gather(stocks, "stock", "price", -time)
gather(stocks2, "stock", "price", -time)
baru3 <- gather(stocks, "stock", "price", X,Y,Z)

# perintah spread()
spread(baru3, stock, price)
baru3 %>% spread('stock', 'price')

# perintah separate()
separate()
data.baru <- data.frame(kolom.baru=c(NA, 'a.x','b.y','c.z'))
separate(data.baru, col=kolom.baru, into=c('ABC', 'XYZ'))
data.baru2 <- data.frame(kolom.baru=c(NA, 'a-x','b-y','c-z'))
separate(data.baru2, col=kolom.baru, into=c('g', 'h'), sep='-')

# perintah unite()
pisah <- separate(data.baru2, col=kolom.baru, into=c('g', 'h'))
unite(pisah, col=kol.gabung, g, h)
unite(pisah, col=kol.gabung, g, h, sep='___')
unite(pisah, col=kol.gabung, g, h, sep='**')
