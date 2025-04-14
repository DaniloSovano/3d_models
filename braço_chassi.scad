$fn = 50;
larg = 15;
prof = 37;
alt = 2;
larg_menor = 11.6;

difference() {
    cube([larg_menor, 35, alt], center=true);
    
    translate([0, -9, 0])
    scale([2, 4, 1])  // Aumenta no eixo X (deixa mais "comprido")
    cylinder(h = 3, d =2, center=true);

    translate([0, 12, 0])
    cylinder(h=6, d=4, center=true);
}

translate([0, -16, 0])
cube([larg, 6, alt], center=true);
