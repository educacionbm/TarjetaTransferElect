//Calculo de la Fuente Capacitiva para el Proyecto de la Tarjeta de Transferencia Eléctrica

//1. Calculo del Capacitor para AC
//Datos:
vin = 120 // Voltaje de entrada AC RMS
r1 = 50 // Resistor 
r2 = 1*10^6 // Resistor para descargar el capacitor
f = 60 // Frecuencia de la Red
iloaddc= 50*10^-3 // Corriente de carga maxima en DC

/*Incognitas:
iloadac = ?
xc1 = ?
c1 = ?
ztcc = ?
*/

/*Formulas:
iloadac = iloaddc * sqrt (2)
ztcc = vin / iloadac
xc1 =  ( (r1 - ztcc) * r2 ) / (ztcc - r1 - r2)
c1 = 1 / (2 * pi * f * xc1)
*/

iloadac = iloaddc * sqrt (2) // Corriente de carga maxima en AC
ztcc = vin / iloadac // Impedancia total de cortocircuito
xc1 =  ( (r1 - ztcc) * r2 ) / (ztcc - r1 - r2)
c1 = 1 / (2 * %pi * f * xc1)

////////////////////////////////////////////////////////////////////////////////

//2. Calculo Etapa de Regulacion Zener y Transistor de paso
//Datos:
vz = 24 // Voltaje del Zener
vbe =0.7 // Voltaje de Base Emisor del Transistor
vce = 10 // Voltaje Colector Emisor Máximo del transistor por Datasheet valor de 40
ic = 150*10^-3 // Corriente de colector máxima del transistor por Datasheet son 600mA
hef = 100 // ganancia de corriente mínima con la máxima corriente de colector
iz = 5*10^-3// Corriente mínima del zener para que empize a trabajar

/*Incognitas:
vout = ? Voltaje de salida de la fuente
vcap = ? Voltaje de salida de la fuente capacitiva
ib = ? Corriente de base del transistor
irb = ? Corriente del resistor de base del transistor
rb = ? Resistencia de base del transistor que soporta la iz y ib
pt = ? Potencia de disipación del transistor
*/

/*Fórmulas:
vout = vz - vbe
vcap = vce + vout
ib = ic/hfe
irb = iz + ib
rb = (vcap-vz)/ir
pt = vce * ic
*/

vout = vz - vbe
vcap = vce + vout
ib = ic/hef
irb = iz + ib
rb = (vcap-vz)/irb
pt = vce * ic

////////////////////////////////////////////////////////////////////////////////

//3. Calculo Etapa de Indicador Visual
//Datos:
idm = 1 // Corriente máxima instantánea de un diodo led por Datasheet
vd = 3 // Voltaje del diodo led
id = 0,0075 // corriente de conducción del diodo led

/*Incognitas:
rd = ? Resistor del diodo led
prd =? Potencia del resistor del diodo led
xcd = ? Impedancia capacitiva para protección el diodo
capd = ? capacitor para protección del diodo
*/

/*Fórmulas:
rd = (vin - vd)/idm
prd = id*id*rd
xcd = (vin - vd)/id
capd = 1 / (2 * %pi * f * xcd)
*/

rd = (vin - vd)/idm
prd = id*id*rd
xcd = (vin - vd)/id
capd = 1 / (2 * %pi * f * xcd)