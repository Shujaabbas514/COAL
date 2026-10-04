#Write RISC-V assembly code to find the area and perimeter of square. You need to
#write two procedures (i.e. AreaFinder and PerimeterFinder ) and call both functions in
#main module.

main:
li a1,10
li a2,10
jal ra,AreaFinder
jal ra,PerimeterFinder
li a0,10
ecall

AreaFinder:
mul a1,a1,a2
ret

PerimeterFinder:
slli a2,a2,2
ret