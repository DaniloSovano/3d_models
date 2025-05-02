$fn = 100;


larg = 34;
alt = 12;
prof = 45.5;
esp = 3.5;

module caixa() {
    difference() {
        translate([0,esp,0]) cube([larg+2*esp,prof,alt+2*esp], center=true);
        cube([larg,prof,alt], center=true);
        
        // Furo para o sensor DS18B20
        //14mm da base até o inicio do buraco
        furo_uniforme();
    
       
        
        // Furo para fixação do imã
      translate([0,0,-8.5]) ima();
        translate([12,-14,-8.5]) ima();
        translate([-12,-14,-8.5]) ima();
        translate([-12,17,-8.5]) ima();
    }
}
module furo_uniforme(){
    hull(){
        //25mm da base até o inicio do furo no eixo Y
        translate([12.5,35.5,-9]) rotate([90,0,0]) DS18B20();
        translate([12.5,35.5,-7.5]) rotate([90,0,0]) DS18B20();
    }
}

module tampa() {
    difference() {
        translate([0,esp,0]) cube([larg+2*esp,esp,alt+2*esp], center=true);
        translate([0,0,6])cube([11,12,8.5], center = true);
    }
}

module DS18B20() {
    cylinder(d=7, h=54, center=true);
}
module ima() {
    cylinder( d=8.3, h=3, center=true);
}
module nicho(){
    cube([36,3.4,1]);
    
    
}
//translate([0,-30,0]) tampa();
//rotate([0,0,-90])

//nicho para melhor encaixe
//5mm de distancia da base
translate([14,19,-0.2])rotate([0,0,-90])nicho();
translate([-17,19,-0.2])rotate([0,0,-90])nicho();
//
caixa();