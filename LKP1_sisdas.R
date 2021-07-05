
#perubahan Reamur ke Farenheit
suhu<-function(r) {
  r*9/4 + 32
}
f <- suhu(37)
f

- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
  
#data
country <- c("USA","India","Brazil","Russian","UK","France")
cases <- c(27491574,10950201,9921981,4125598,4071189,3453645)
death <- c(485379,156014,240940,81926,118933,82692)
#pembuatan data frame
covid <-data.frame(country,cases,death)
covid

#a. menghitung rata-rata kasus covid
mean(cases)

#b. menghitung total kematian covid
sum(death)

#c. mengurutkan data berdasarkan abjad
covid[order(covid$country),]

- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
#membuat fungsi turunan pertama
f <- function(x){
  x^3 + sqrt(x^2 + 2*x)
}
faks <- Deriv(f)
faks