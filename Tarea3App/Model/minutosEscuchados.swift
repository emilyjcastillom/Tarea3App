//
//  minutosEscuchados.swift
//  Tarea3App
//
//  Created by Alumno on 06/11/25.
//

import Foundation

struct minutosEscuchados: Identifiable {
    let id: Int
    let anio: Int
    let minutos: Int
    
    init (anio: Int, minutos: Int){
        self.id = anio
        self.anio = anio
        self.minutos = minutos
    }
}
