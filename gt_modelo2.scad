largura_esp = 30; 
profundidade_esp = 38;

difference() {
    color("Gray")cube([largura_esp + 1, profundidade_esp + 1, 3], center = true); 
    color("DarkSlateGray")translate([2,0,0])cube([largura_esp - 2, 38, 2], center = true);
    translate([0,-20,0])cube([5,5,1.2], center = true);
    
}
