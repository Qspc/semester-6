#----------------------------------------
f= function(x){
  1/(1-exp(-x))
}
finv= function(x){
  f(x)*(1-f(x))
}
alfa= 0.2
x= matrix(c( 1, 1),ncol=1)
t= 0

vb= matrix(c(-0.3, 0.3, 0.3), ncol=1)
wb= matrix(c(-0.1), ncol=1)

v1= c(0.2, 0.3, -0.1)
v2= c(0.3, 0.1, -0.1)
v= matrix(c(v1,v2),ncol=2)

w1= c(0.5)
w2= c(-0.3)
w3= c(-0.4)
w= matrix(c(w1,w2,w3), ncol=3)

#feedforward
zin= v%*%x + vb
z= matrix(f(zin), ncol=1)
z

yin= w%*%z + wb
y= f(yin)
y

#backprop
erry= (t-y)*finv(yin)
erry
delta_w= t(z%*%(alfa*erry))
delta_wb= alfa*erry
erry
delta_w
delta_wb

err_zin= erry%*%w
err_zin
errz= t(finv(zin))*err_zin
errz
delta_v= t(x%*%(alfa*errz))
delta_vb= t(alfa*errz)

w= w+delta_w
v= v+delta_v
w
v

(0-(-0.1334))*(-0.1334)*(1-(-0.1334))
0.5*-0.0201
