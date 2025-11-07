//
//  Cancion.swift
//  Tarea3App
//
//  Created by Alumno on 06/11/25.
//

import Foundation

struct Cancion: Identifiable{
    var id: Int
    var titulo: String
    var artista: String
    var anio: String
    var genero: String
    var album: String = ""
}
