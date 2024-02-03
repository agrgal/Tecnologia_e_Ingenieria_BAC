# Barra cuadrada
# instalar el paquete udunits, antes apt-get install libudunits2-dev
library(units)
# Lado y L0
a = set_units(1,cm)
L0 = set_units(10,cm)
# Superficie
S0=a^2 # Ya que es cuadrado
# Fuerza de Tracción
F = set_units(8,kN)
# Módulo de Young
E=set_units(2,MN/cm^2)
# Límite de proporcionalidad
SigP =set_units(100,MPa)

# --- Resolución ----
Sigma = F / S0
epsilon = Sigma / E
cat("Sigma =",as.character(Sigma),as_cf(Sigma))
units(Sigma)=with(ud_units,MPa)
cat("Sigma =",as.character(Sigma),as_cf(Sigma))
cat("Claramente es menor que el límite proporcional ",as.character(SigP),as_cf(SigP))
cat(paste0("Y epsilon=",epsilon))
cat(paste0("Y epsilon(%)=",epsilon*100,"%"))
deltaL=epsilon*L0
cat(paste0("deltaL=",as.character(deltaL),as_cf(deltaL)))

# Carga de 80 kN
F2 = set_units(80,kN)
Sigma2 = F2 /S0
Sigma2
units(Sigma2)=with(ud_units,MPa) # cambiar a Mega Pascales
Sigma2
cat("$\Sigma$ es mayor que el límite proporcional, luego puedo decir que")
cat("epsilon > Sigma / E")
