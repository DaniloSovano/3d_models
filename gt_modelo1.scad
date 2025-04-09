largura_esp = 30; 
profundidade_esp = 38;


difference() {
    cube([largura_esp + 1, profundidade_esp + 1, 3], center = true); 
    translate([0,2,0])cube([largura_esp - 2, 42, 2], center = true);
    translate([0,-20,0])cube([5,5,1.2], center = true);
    translate([-10,10,3])rotate([90, 0, 0])cylinder(h = 40, r = 3, center = true);

}
