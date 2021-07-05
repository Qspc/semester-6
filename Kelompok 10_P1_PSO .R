# Tugas Akhir Sistem Cerdas
# Kelompok 10 | P1
# 1. Shibgotalloh sabilana   : G64180002
# 2. Arya Aminata            : G64180007
# 3. Rian Reftian N          : G64180009
# 4. Hafidz Yusuf Buchori    : G64180036    
# 5. Pradhipta Trimanggala S : G64180075
# Optimalisasi Nutrisi dan Harga Pakan Ayam Menggunakan Particle Swarm Optimization
# ========================================================================================
# inisialisasi variable
xmin = 1
xmax = 10
n = 6     # jumlah partikel
iterasimax = 90
rata_fit = c()
fitness_prev <- matrix(0, ncol = n)
v <- array(rep(0, n*6*iterasimax+1), dim=c(n, 6, iterasimax+1))
pBest <- array(rep(0, n*6), dim=c(n, 6))
gBest <- c(0,0,0,0,0,0)
r1 = 0.1
r2 = 0.2
kons = 0.6
c1i = 2.5
c1f = 0.5
c2i = 0.5
c2f = 2.5
fitness <- c(0)
omgmax = 0.9
omgmin = 0.4
# standar kebutuhan nutrisi ransum -- sesuai paper rujukan
kebutuhan_protein = 18
kebutuhan_lemak = 5
kebutuhan_seratkasar = 4
kebutuhan_ME = 2850
kebutuhan_kalsium = 3
kebutuhan_fosfor = 0.5

# inisialisasi posisi partikel acak
init_partikel <- function(n){
  x <- matrix(0, nrow = n, ncol = 6)
  for(i in 1:n){
    for(j in 1:6){
      x[i, j] = as.integer(xmin + runif(1, 1, 10))
    }
  }
  return(x)
}

x <- init_partikel(6)

# implementasi PSO
for (iterasike in 1:iterasimax){
  # normalisasi bobot
  normalisasi_bobot <- function(x, n){
    norm <- matrix(0, nrow = n, ncol = 6)
    for(i in 1:n){
      for(j in 1:6){
        norm[i, j] = (x[i, j]/sum(x[i,]))*100
      }
    }
    return(norm)
  }
  result_norm <- normalisasi_bobot(x, n)
  
  # menghitung total nutrisi
  protein <- matrix(0, nrow = n, ncol = 6)
  lemak <- matrix(0, nrow = n, ncol = 6)
  seratkasar <- matrix(0, nrow = n, ncol = 6)
  ME <- matrix(0, nrow = n, ncol = 6)
  kalsium <- matrix(0, nrow = n, ncol = 6)
  fosfor <- matrix(0, nrow = n, ncol = 6)
  for(i in 1:n){
    for(j in 1:6){
      protein[i,j] = result_norm[i,j] * 12 / 100
      lemak[i,j]  = result_norm[i,j] * 12 / 100
      seratkasar[i,j]  = result_norm[i,j] * 3 / 100
      ME[i,j]  = result_norm[i,j] * 2860 / 100
      kalsium[i,j]  = result_norm[i,j] * 0.04 / 100
      fosfor[i,j]  = result_norm[i,j] * 1.4 / 100
    }
  }
  
  total_protein <- c(0,0,0,0,0,0)
  total_lemak <- c(0,0,0,0,0,0)
  total_seratkasar <- c(0,0,0,0,0,0)
  total_ME <- c(0,0,0,0,0,0)
  total_kalsium <- c(0,0,0,0,0,0)
  total_fosfor <- c(0,0,0,0,0,0)
  for(i in 1:6){
    for(j in 1:6){
      total_protein[i] = total_protein[i] + protein[j,i]
      total_lemak[i] = total_lemak[i] + lemak[j,i]
      total_seratkasar[i] = total_seratkasar[i] + seratkasar[j,i]
      total_ME[i] = total_ME[i] + ME[j,i]
      total_kalsium[i] = total_kalsium[i] + kalsium[j,i]
      total_fosfor[i] = total_fosfor[i] + fosfor[j,i]
    }
  }
  
  # menghitung nilai penalti
  penalti <- c()
  for(i in 1:6){
    nilai_penalty = 0
    if(total_protein[i] < kebutuhan_protein){
      nilai_penalty = nilai_penalty + (kebutuhan_protein- total_protein[i] )
    }
    if(total_lemak[i] < kebutuhan_lemak){
      nilai_penalty = nilai_penalty + (kebutuhan_lemak- total_lemak[i] )
    }
    if(total_seratkasar[i] < kebutuhan_seratkasar){
      nilai_penalty = nilai_penalty + (kebutuhan_seratkasar- total_seratkasar[i] )
    }
    if(total_ME[i] < kebutuhan_ME){
      nilai_penalty = nilai_penalty + ((kebutuhan_ME- total_ME[i]) / 2850 * 100)
    }
    if(total_kalsium[i] < kebutuhan_kalsium){
      nilai_penalty = nilai_penalty + (kebutuhan_kalsium- total_kalsium[i] )
    }
    if(total_fosfor[i] < kebutuhan_fosfor){
      nilai_penalty = nilai_penalty + (kebutuhan_fosfor- total_fosfor[i])
    }
    penalti[i] = nilai_penalty
  }
  
  # menghitung harga pakan
  jml_pakanhari = 109.062
  # misal: bekatul,beras merah, beras putih, bungkil kedelai, bungkil kelapa, bungkil wijen
  # note : harga yang didefinisikan merupakan perkiraan dan bukan dari data real
  harga <- c(1.6, 16, 10, 6.5, 8, 5.5)
  total_harga <- c(0,0,0,0,0,0)
  for(i in 1:n){
    sum_harga = 0
    for(j in 1:6){
      harganya = (result_norm[i,j]/100)*jml_pakanhari*harga[i]
      sum_harga = sum_harga + harganya
    }
    total_harga[i] = sum_harga
  }
  
  # menghitung nilai fitness
  a = 20
  k = 1000
  for(i in 1:n){
    fitness[i] = (1/(total_harga[i]+(penalti[i]*a)))*k
  }
  
  # update kecepatan v
  omg = omgmax - (((omgmax-omgmin)/iterasimax) * iterasike )
  c1 = ((c1f-c1i)*(iterasike/iterasimax))+c1i
  c2 = ((c2f-c2i)*(iterasike/iterasimax))+c2i
  vmax <- kons *((xmax - xmin)/2)
  for (i in 1:n) {
    for (j in 1:6){
      temp <- (omg*v[i, j, iterasike]) + (c1*r1*(pBest[i, j] - x[i, j])  + (c2 * r2 * (gBest[j]-x[i,j])) )
      if(temp > vmax){
        v[i, j, iterasike+1] <- vmax
      }
      else if(temp < -vmax){
        v[i, j, iterasike+1] <- -vmax
      }
      else{
        v[i, j, iterasike+1] <- temp
      }
    }
  }
  
  # update posisi x
  for (i in 1:n) {
    for (j in 1:6){
      x[i,j] = x[i,j] + v[i,j,iterasike+1]
    }
  }
  
  # update pBest & gBest
  for(i in 1:n){
    if(fitness[i] > fitness_prev[i]){
      pBest[i,] = x[i,]
    }
    else{
      pBest[i,] = pBest[i,]
    }
  }
  if(all(max(fitness) > fitness_prev)){
    gBest <- x[which.max(fitness),]
  }
  fitness_prev <- fitness
  
  # menghitung nilai rataan fitness
  cat("fitness\n", iterasike)
  print(fitness)
  rata_fit[iterasike] = mean(fitness)
}
# mencetak nilai rataan fitness
print(rata_fit)
# plot 
plot(rata_fit, type="o", col="blue", xlab = "iterasi"  )
title(main="Plot Iterasi-Fitness", col.main="red", font.main=4)