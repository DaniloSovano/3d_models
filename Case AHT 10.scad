$fn = 50;

// Parâmetros da caixa
larg = 40;
alt = 21;
prof = 70;
esp = 2;


nicho_largura = 1.5;  
nicho_altura = 2;      


// Módulo da haste usada como recorte
module hasteLateral() {
    cube([7, 3, 13.5], center = true);
}

module hasteSuperior(){
    cube([4, 5, 35], center = true);
}    

//suporte entre as janelas superiores
module trelicaSuperior(){    
    cube([esp,prof-4,esp+0.2] , center = true);
}



module trelicaLateral(){
    cube([7,prof-4,1.5] , center = true);   
}




//nicho para encaixe da placa
module nicho() {
    
    cube([nicho_largura, prof, nicho_altura], center=true);
}

// Módulo da placa interna (vão)
module placa() {
    cube([larg, prof, alt], center = true);
}

// Módulo da caixa com recortes nas laterais e topo
// Módulo da caixa com recortes nas laterais e topo
module caixa() {
    translate([35/5,0,11.6])trelicaSuperior();
    translate([-35/5,0,11.6])trelicaSuperior();
    
    translate([34/2,0,-4.5])trelicaLateral();
    translate([-34/2,0,-4.5])trelicaLateral();

    difference() {
        // Corpo externo da caixa
        minkowski() {
            translate([0, esp, 0])
            cube([larg + 2 * esp, prof, alt + 2 * esp], center = true);
            cylinder(r=2,h=0.2);
        }

        // Subtrai o vão interno
        placa();

        // Recortes nas laterais 
        for (y = [ 20,30]) {
            // Lado direito
            translate([larg/2 + esp/2, y, 3])
                hasteLateral();
        }
        for (y = [ 10, 20,30]) {
            // Lado esquerdo
            translate([-larg/2 - esp/2, y, 3])
                hasteLateral();
        }

        // Recortes no topo
        for (x = [0, 10, 20, 30]) {
            rotate([90, 0, 90]) // Roda para furar na tampa
                translate([x, 11, 0])
                    hasteSuperior();
        }
        //Entrada do cabo
        translate([23,15.5,9])cube([8,12,6.5], center = true);
    }
}


caixa();
// Gera a caixa com recortes
//difference() {
//    caixa();
//    
//    // Recorte temporário
//    translate([0,-40,0])cube([60,80,25], center = true);
//}
// Recortes no topo (parte superior da caixa)
//translate([larg/2 - nicho_largura/2,0,-5])nicho();
