# Mengimpor library
library(dplyr)
library(nycflights13)

# Meyiapkan dataset
dataku <- flights
summary(flights) # melihat summary

# Menyiapkan rownames sebagai index yg merupakan bagian dari kolom
dataku <- cbind(nomor = rownames(dataku), dataku)

# Memfilter data dengan filter()
baru <- filter(dataku, day==15, month==8, dest=='IND')
baru2 <- dataku[dataku$day==15 & dataku$month==8 & dataku$dest=='IND', ]
baru3 <- na.omit(dataku[dataku$day==15 & dataku$month==8 & dataku$dest=='IND', ])

coba <- filter(dataku, day==15, month==8, dep_time<=1000) # masih mengandung NA di beberapa kolom (293378)
coba2 <- dataku[dataku$day==15 & dataku$month==8 & dataku$dep_time<=1000,]
coba3 <- na.omit(dataku[dataku$day==15 & dataku$month==8 & dataku$dep_time<=1000,])

# Mengetahui nomor baris keberapa yang berbeda
for (i in 1:nrow(coba3)){
  #hitung = 0
  if (coba$nomor[i] != coba3$nomor[i]){
    print(coba$nomor[i])
    #hitung = hitung+1
    break
  }
}

# Filter dengan tidak mengikutikan kolom manapun yg ada NA
coba4 <- na.omit(filter(dataku, day==15, month==8, dep_time<=2000))

# Penggunaan slice
potong <- slice(dataku, 2:10)

# Penggunan arrange() untuk mengurutkan berdasarkan kolom yang kita tulis
dataku2 <- dataku
dataku2 <- arrange(dataku2, year, month, flight)

# Memilih kolom tertentu dengan select()
pilih <- select(dataku, nomor, carrier, arr_time)

# Merubah nama kolom dengan rename()
ganti <- rename(dataku, indeks = nomor)

# Memilih isi data yang unik (mirip dengan set di Python) dengan distinct()
unik <- distinct(select(dataku, carrier))

# Menambah kolom baru yang merupakan hasil algoritma beberapa kolom dengan mutate()
tambah <- mutate(dataku, kol_baru = arr_delay - dep_delay)
tambah <- select(tambah, nomor, kol_baru, arr_delay, dep_delay)

# Menambah kolom baru seperti mutate tapi tidak ikut menampilkan kolom lainnya dengan transmute()
khusus <- transmute(dataku, kol_baru = arr_delay - dep_delay)

# Meringkas kolom dengan summarise()
summarise(dataku, rataan_air_time = mean(air_time, na.rm=TRUE))
summarise(dataku, jumlah_air_time = sum(air_time, na.rm=TRUE))

# Memunculkan sampling dari data kita secara acak (random) dengan sample_n() dan sample_frac()
sample_n(dataku, 10)
sampel <- sample_frac(dataku, 0.1)
