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
    cube([4, 3, 13.5], center = true);
}

module hasteSuperior(){
    cube([4, 6, 35], center = true);

}    

//suporte entre as janelas superiores
module trelicaSuperior(){
    
    cube([esp,prof-4,esp] , center = true);
    
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


module caixa() {
    //Recortes no topo
    translate([35/5,0,11.5])trelicaSuperior();
    translate([-35/5,0,11.5])trelicaSuperior();

    //Recortes laterais
    translate([34/2,0,-4.5])trelicaLateral();
    translate([-34/2,0,-4.5])trelicaLateral();


    difference() {
        // Corpo externo da caixa
        translate([0, esp, 0])
            cube([larg + 2 * esp, prof, alt + 2 * esp], center = true);

        // Subtrai o vão interno
        placa();

        // Recortes nas laterais 
        for (y = [30]) {
            // Lado direito
            translate([larg/2 + esp/2, y, 3])
                hasteLateral();
        }
        for (y = [ 10, 20,30]) {
            // Lado esquerdo
            translate([-larg/2 - esp/2, y, 3])
                hasteLateral();
        }
        translate([22 - esp/2, 10, 0.5])cube([8, 3, 7.5], center = true);
        translate([22 - esp/2, 20, 0.5])cube([8, 3, 7.5], center = true);



        // Recortes no topo
        for (x = [ 10, 20, 30]) {
            rotate([90, 0, 90]) // Roda para furar na tampa
                translate([x, 10, 0])
                    hasteSuperior();
        }
        //Entrada do cabo
        translate([23,17.5,9])cube([8,12,6.5], center = true);


    }
}
caixa();
