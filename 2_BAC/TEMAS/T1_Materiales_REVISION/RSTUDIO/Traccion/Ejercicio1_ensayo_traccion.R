# Tenemos los siguientes datos:
# Diámetro de la probeta 10mm
# Longitud de la probeta 100mm
# instalar el paquete udunits, antes apt-get install libudunits2-dev
library(units)

# diámetro
D = set_units(10,mm)
# units(D) = with(ud_units,m) #convierte la unidad a metros
S0=pi*((D/2)^2) # calculo de la superficie S0

# Longitud
L0 = set_units(100,mm)
units(L0) = with(ud_units,m) #convierte la unidad a metros

# Limite proporcional
Fp = set_units(3,kN)
Lp = set_units(0.2,mm)
Sigp = Fp / S0
units(Sigp) = with(ud_units, N/m^2)
Ep = Lp / L0

# Limite elástico
Fe = set_units(3.2,kN)
Le = set_units(0.22,mm)
Sige = Fe / S0
units(Sige) = with(ud_units, N/m^2)
Ee = Le / L0

# Resistencia a la tracción
FR = set_units(16,kN)
LR = set_units(4,mm)
SigR = FR / S0
units(SigR) = with(ud_units, N/m^2)
ER = LR / L0

# Resistencia a la rotura
FU = set_units(14,kN)
LU = set_units(4.5,mm)
SigU = FU / S0
units(SigU) = with(ud_units, N/m^2)
EU = LU / L0

# representando
epsilon = c(Ep,Ee,ER,EU)
sigma = c(Sigp,Sige,SigR,SigU)
plot(epsilon,sigma
     ,pch=22,col="blue"
     ,main="Ensayo de tracción - Ejercicio 1"
     ,xlim=c(0,0.05), ylim=c(0,2.1e+8))
segments(0,1,Ep,Sigp,col="red")
segments(Ee,Sige,Ep,Sigp,col="red")
segments(Ee,Sige,ER,SigR,col="red")
segments(EU,SigU,ER,SigR,col="red")

# Módulo de young 
E = Sigp / Ep
cat("El módulo de Young es E = ", as.character(E),as_cf(E))
units(E) = with(ud_units,GPa)
cat("El módulo de Young es E = ", as.character(E),as_cf(E))

# texto
sigma2=sigma
units(sigma)= with(ud_units,MPa) #lo pongo en Mega Pascales
etiquetas = paste0(
  "(",
  round(epsilon,4),
  " , ",
  round(sigma,2),
  as_cf(sigma),
  ")")
posiciones=c(1,3,2,1)
text(epsilon,sigma2,etiquetas,col="blue",pos=posiciones,cex=0.8)
text(0.03,sigma2[1],paste0("El módulo de Young es E = ", as.character(round(E,2)),as_cf(E)),col="black")

# Trabajo bajo la curva
W1=Fp*Lp/2
W2=Fp*(Le-Lp)
W3=(Fe-Fp)*(Le-Lp)/2
W4=Fe*(LR-Le)
W5=(FR-Fe)*(LR-Le)/2
W6=FU*(LU-LR)
W7=(FR-FU)*(LU-LR)/2
W=W1+W2+W3+W4+W5+W6+W7
units(W)=with(ud_units,J)
cat("El trabajo realizado es W=",as.character(W),as_cf(W))
