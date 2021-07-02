#pso with R

fx = function(x) {
  (2*x^2) + (4*x) + 5
}
n = 4
cuy = 1
v = c(0,0,0,0)

x = c(-4,-3,2,5)
r1 = c(0.1, 0.1, 0.4, 0.2, 0.7)
r2 = c(0.2, 0.1, 0.4, 0.6, 1)
omega = c(0.77, 0.58, 0.42, 0.26, 0.1)

new_v = function(omega, v, cuy, r1, r2, pbest, x, gbest){
  omega*v + cuy*r1*(pbest-x) + cuy*r2*(gbest-x) 
}

new_x = function(x,v){
  v+x
}

update_pbest= function(x,xold,fitold){
  newp=c()
  fitnew=fx(x)
  for(i in 1:length(x)){
    if(fitold[i]<fitnew[i]){
      newp=c(newp,xold[i])
    }
    else{
      newp=c(newp,x[i])
    }
  }
  return(newp)
}



#iterasi 1

nilai_fx = fx(x)
nilai_fx
pbest = x
pbest
gbest = min(x[which(nilai_fx %in% min(nilai_fx))])
gbest

v_awal = v
x_awal = x
v = new_v(omega[1],v_awal,cuy,r1[1],r2[1],pbest,x_awal,gbest)
v
x = new_x(x,v)
x

#iterasi 2
nilai_fx = fx(x)
nilai_fx
p_best = update_pbest(x,x_awal,nilai_fx)
p_best
gbest = min(x[which(nilai_fx %in% min(nilai_fx))])
gbest

v_awal = v
x_awal = x
v = new_v(omega[2],v_awal,cuy,r1[2],r2[2],pbest,x_awal,gbest)
v
x = new_x(x,v)
x


#iterasi3
nilai_fx = fx(x)
nilai_fx
p_best = update_pbest(x,x_awal,nilai_fx)
p_best
gbest = min(x[which(nilai_fx %in% min(nilai_fx))])
gbest

v_awal = v
x_awal = x
v = new_v(omega[3],v_awal,cuy,r1[3],r2[3],pbest,x_awal,gbest)
v
x = new_x(x,v)
x


#iterasi4
nilai_fx = fx(x)
nilai_fx
p_best = update_pbest(x,x_awal,nilai_fx)
p_best
gbest = min(x[which(nilai_fx %in% min(nilai_fx))])
gbest

v_awal = v
x_awal = x
v = new_v(omega[4],v_awal,cuy,r1[4],r2[4],pbest,x_awal,gbest)
v
x = new_x(x,v)
x


#iterasi5
nilai_fx = fx(x)
nilai_fx
p_best = update_pbest(x,x_awal,nilai_fx)
p_best
gbest = min(x[which(nilai_fx %in% min(nilai_fx))])
gbest

v_awal = v
x_awal = x
v = new_v(omega[5],v_awal,cuy,r1[5],r2[5],pbest,x_awal,gbest)
v
x = new_x(x,v)
x


nilai_fx = fx(x)
nilai_fx
p_best = update_pbest(x,x_awal,nilai_fx)
p_best
gbest = min(x[which(nilai_fx %in% min(nilai_fx))])
gbest

