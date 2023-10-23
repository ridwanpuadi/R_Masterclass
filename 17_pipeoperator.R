# Penggunaan pipe operator

library(dplyr)
dataku <- mtcars

# alternatif 1
hasil <- arrange(sample_n(filter(dataku, hp>60), size=5), desc(hp))

# alternatif 2
a <- filter(dataku, hp>60)
b <- sample_n(a, size=5)
hasil2 <- arrange(b, desc(hp))

# alternatif 3 = pipe operator
# data %>% op1 %>% op2 %>% op3
hasil4 <- dataku %>% filter(hp>60) %>% sample_n(size=5) %>% arrange(desc(hp)) %>% sample_n(size=2)