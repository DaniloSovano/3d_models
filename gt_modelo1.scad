$fn = 50;
largura_esp = 30; 
profundidade_esp = 38;


difference() {
    cube([largura_esp + 1, profundidade_esp + 1, 6], center = true); 
    translate([0,2,0])cube([largura_esp - 2, 42, 5], center = true);
    translate([0,-20,0])cube([5,5,1.2], center = true);
    translate([-10,10,3])rotate([90, 0, 0])cylinder(h = 40, r = 4, center = true);
    translate([5,0,3])cylinder(h = 10, r = 4, center = true);

}