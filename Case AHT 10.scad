$fn = 50;

// Parâmetros da caixa
larg = 40;
alt = 21;
prof = 85;  // Aumentado
esp = 2;

nicho_largura = 1.5;  
nicho_altura = 2;      

module hasteLateral() {
    cube([4, 3, 13.5], center = true);
}

module hasteSuperior(){
    cube([4, 6, 35], center = true);
}    

module trelicaSuperior(){
    cube([esp, 70 - 4, esp], center = true);  // Mantém recorte no tamanho original
}

module trelicaLateral(){
    cube([7, 70 - 4, 1.5], center = true);   // Mantém recorte no tamanho original
}

module nicho() {
    cube([nicho_largura, prof, nicho_altura], center = true);
}

module placa() {
    cube([larg, prof, alt], center = true);
}

module caixa() {
    difference() {
        // Corpo externo da caixa (empurrado para trás)
        translate([0, -7.5 + esp, 0])
            cube([larg + 2 * esp, prof, alt + 2 * esp], center = true);

        // Vão interno (também empurrado para trás)
        translate([0, -7.5, 0])
            placa();

        // Recortes fixos (mantidos no lugar original)
        
        // Lado direito
        for (y = [30]) {
            translate([larg / 2 + esp / 2, y, 3])
                hasteLateral();
        }

        // Lado esquerdo
        for (y = [10, 20, 30]) {
            translate([-larg / 2 - esp / 2, y, 3])
                hasteLateral();
        }

        // Recortes pequenos
        translate([22 - esp / 2, 10, 0.5]) cube([8, 3, 7.5], center = true);
        translate([22 - esp / 2, 20, 0.5]) cube([8, 3, 7.5], center = true);

        // Recortes no topo
        for (x = [10, 20, 30]) {
            rotate([90, 0, 90])
                translate([x, 10, 0])
                    hasteSuperior();
        }

        // Entrada do cabo
        translate([23, 17.5, 9])
            cube([8, 12, 6.5], center = true);
    }

    // Elementos externos, fora do difference()

    // Treliças superiores (posições mantidas)
    translate([35 / 5, 0, 11.5]) trelicaSuperior();
    translate([-35 / 5, 0, 11.5]) trelicaSuperior();

    // Treliças laterais (posições mantidas)
    translate([34 / 2, 0, -4.5]) trelicaLateral();
    translate([-34 / 2, 0, -4.5]) trelicaLateral();
}

caixa();
