$fn = 50;
larg_base = 15.8;
alt_base = 7;
prof_base= 3;

larg_braco = 11.6;
alt_braco = 23;
prof_braco= 3;

alt_buraco_meio = 6.3;
larg_buraco_meio = 3.8;

module base(){
cube([larg_base,prof_base,alt_base], center = true);

}

module buraco_meio(){
translate([0, 0, alt_base])
    cube([larg_buraco_meio,4,alt_buraco_meio], center=true);
}

module buraco_topo(){
translate([0,0,3.8+19])    
    rotate([90,0,0])
        cylinder(5,r=3.8/2,center=true);
}
module braco(){
difference(){
    difference(){
    translate([0,0,(alt_braco/2)+(alt_base/2)])
        cube([larg_braco,prof_braco,alt_braco], center = true);
          buraco_meio();
 }
 buraco_topo();
 } 
}



//buraco_topo();
base();
braco();