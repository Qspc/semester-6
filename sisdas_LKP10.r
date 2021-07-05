f= function(x){
  (2*(x^2))+(4*x)+5
}
update_v= function(rho,v,r1,r2,pb,gb,x){
  rho*v+r1*(pb-x)+r2*(gb-x)
}
update_x= function(x,v){
  return(x+v)
}
update_pbest= function(x,xold,fitold){
  newp=c()
  fitnew=f(x)
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

x=c(-4,-3,2,5)
v=c(0,0,0,0)

r1=c(0.1,0.1,0.4,0.2,0.7)
r2=c(0.2,0.1,0.4,0.6,1)
rho=c(0.77,0.58,0.42,0.26,0.1)

fitness_x= f(x)
fitness_x

p_best=x
g_best=min(x[which(fitness_x %in% min(fitness_x))])
p_best
g_best

#iterasi 1-------------------------------
iter=1
v= update_v(rho[iter],v,r1[iter],r2[iter],p_best,g_best,x)
xold= x
x= update_x(x,v)
v
x

p_best=update_pbest(x,xold,fitness_x)

fitness_x= f(x)
fitness_x

g_best=min(x[which(fitness_x %in% min(fitness_x))])
p_best
g_best

#iterasi 2-------------------------------
iter=2
v= update_v(rho[iter],v,r1[iter],r2[iter],p_best,g_best,x)
xold= x
x= update_x(x,v)
v
x

p_best=update_pbest(x,xold,fitness_x)

fitness_x= f(x)
fitness_x

g_best=min(x[which(fitness_x %in% min(fitness_x))])
p_best
g_best

#iterasi 3-------------------------------
iter=3
v= update_v(rho[iter],v,r1[iter],r2[iter],p_best,g_best,x)
xold= x
x= update_x(x,v)
v
x

p_best=update_pbest(x,xold,fitness_x)

fitness_x= f(x)
fitness_x

g_best=min(x[which(fitness_x %in% min(fitness_x))])
p_best
g_best

#iterasi 4-------------------------------
iter=4
v= update_v(rho[iter],v,r1[iter],r2[iter],p_best,g_best,x)
xold= x
x= update_x(x,v)
v
x

p_best=update_pbest(x,xold,fitness_x)

fitness_x= f(x)
fitness_x

g_best=min(x[which(fitness_x %in% min(fitness_x))])
p_best
g_best

#iterasi 5-------------------------------
iter=5
v= update_v(rho[iter],v,r1[iter],r2[iter],p_best,g_best,x)
xold= x
x= update_x(x,v)
v
x

p_best=update_pbest(x,xold,fitness_x)

fitness_x= f(x)
fitness_x

g_best=min(x[which(fitness_x %in% min(fitness_x))])
p_best
g_best

f(g_best)
