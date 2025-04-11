$fn = 50;


larg = 33;
alt = 11;
prof = 45;
esp = 2;

module caixa() {
    difference() {
        translate([0,esp,0]) cube([larg+2*esp,prof,alt+2*esp], center=true);
        cube([larg,prof,alt], center=true);
        // Furo para o sensor DS18B20
        translate([12.5,20,-6.5]) rotate([90,0,0]) DS18B20();
        
        // Furo para fixação do imã
        translate([0,0,-8]) ima();
     
    }
}

module tampa() {
    difference() {
        translate([0,esp,0]) cube([larg+2*esp,esp,alt+2*esp], center=true);
        cube([8,10,3], center = true);
    }
}

module DS18B20() {
    cylinder(d=6.8, h=54, center=true);
}

module ima() {
    cylinder( d=8.2, h=3, center=true);
}
module nicho(){
    cube([36,3.4,0.6]);
    
    
}


caixa(); 
