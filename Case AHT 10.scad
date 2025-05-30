$fn = 50;

// Parâmetros da caixa
larg = 40;
alt = 18;
prof = 70;
esp = 2;


nicho_largura = 1.5;  
nicho_altura = 2;      


// Módulo da haste usada como recorte
module hasteLateral() {
    cube([4, 3, 16], center = true);
}

module hasteSuperior(){
    cube([4, 3, 35], center = true);

}    

//suporte entre as janelas superiores
module trelicaSuperior(){
    
    cube([esp,prof-4,esp] , center = true);
    
}

translate([35/5,0,10])trelicaSuperior();
translate([-35/5,0,10])trelicaSuperior();


module trelicaLateral(){
    
    cube([7,prof-4,1.5] , center = true);
    
}
translate([34/2,0,-4])trelicaLateral();
translate([-34/2,0,-4])trelicaLateral();



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
    difference() {
        // Corpo externo da caixa
        translate([0, esp, 0])
            cube([larg + 2 * esp, prof, alt + 2 * esp], center = true);

        // Subtrai o vão interno
        placa();

        // Recortes nas laterais 
        for (y = [-30, -20, -10, 0, 10]) {
            // Lado direito
            translate([larg/2 + esp/2, y, 0])
                hasteLateral();
        }
        for (y = [-30, -20, -10, 0, 10, 20, 30]) {
            // Lado esquerdo
            translate([-larg/2 - esp/2, y, 0])
                hasteLateral();
        }

        // Recortes no topo
        for (x = [-20, -10, 0, 10, 20, 30]) {
            rotate([90, 0, 90]) // Roda para furar na tampa
                translate([x, 10, 0])
                    hasteSuperior();
        }
        //Entrada do cabo
        translate([23,26,3])cube([10,10.5,6.5], center = true);

    }
}



// Gera a caixa com recortes
caixa();
// Recortes no topo (parte superior da caixa)
//translate([larg/2 - nicho_largura/2,0,-5])nicho();
