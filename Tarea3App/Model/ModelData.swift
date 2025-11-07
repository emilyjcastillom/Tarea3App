//
//  ModelData.swift
//  Tarea3App
//
//  Created by Alumno on 06/11/25.
//

import Foundation

import Foundation
import SwiftUI

let minutosTotales: Array<minutosEscuchados> = [
    minutosEscuchados(anio: 2020, minutos: 60),
    minutosEscuchados(anio: 2021, minutos: 60),
    minutosEscuchados(anio: 2022, minutos: 80),
    minutosEscuchados(anio: 2023, minutos: 100),
    minutosEscuchados(anio: 2024, minutos: 93)
]

let reproduccionesTotales: Array<reproducciones> = [
    reproducciones(id:1, cancion: "The Subway", reproducciones: 48),
    reproducciones(id:2, cancion: "12 to 12", reproducciones: 20),
    reproducciones(id:3, cancion: "Silver Springs", reproducciones: 15)
]
// barras - artistas mas escuchados
// pie chart - generos escuchados
// minutos escuchados - grafica valores x-y

let listaCanciones: Array<Cancion> = [
    Cancion(id: 1, titulo: "Good Luck, Babe!", artista: "Chappell Roan", anio: "2024", genero: "Pop", album: "https://cdn-images.dzcdn.net/images/cover/377470fb0413c43587769a7dea37f691/0x1900-000000-80-0-0.jpg"),
    Cancion(id: 2, titulo: "Tarde, Lejos", artista: "LAGOS", anio: "2024", genero: "Indie Roock", album: "https://images.genius.com/d28cac68e8f5c21dd74b1b83e771f440.1000x1000x1.png"),
    Cancion(id: 3, titulo: "Te lo Advertí", artista: "LAGOS", anio: "2024", genero: "Rock", album: "Cowboys de la A3"),
    Cancion(id: 4, titulo: "Let Me Down Easy", artista: "Arctic Monkeys", anio: "2021", genero: "Indie Pop", album: "Kaleidoscope Eyes"),
    Cancion(id: 5, titulo: "My Propeller", artista: "Arctic Monkeys", anio: "2009", genero: "Indie Rock", album: "Humbug"),
    Cancion(id: 6, titulo: "La Travesía", artista: "Duki", anio: "2021", genero: "Trap/Rap", album: "Desde el Fin del Mundo"),
    Cancion(id: 7, titulo: "12 to 12", artista: "Clairo", anio: "2021", genero: "Indie Pop", album: "Sling"),
    Cancion(id: 8, titulo: "The Subway", artista: "Arctic Monkeys", anio: "2024", genero: "Indie Rock", album: "Pick-Up Full of Pink Carnations"),
    Cancion(id: 9, titulo: "Tears", artista: "JAWNY", anio: "2020", genero: "Indie Pop", album: "For Abby"),
    Cancion(id: 10, titulo: "VOY A LLEVARTE PA PR", artista: "Tainy, Bad Bunny", anio: "2024", genero: "Reggaeton", album: "DATA"),
    Cancion(id: 11, titulo: "Sailor Song", artista: "Chappell Roan", anio: "2024", genero: "Indie Folk", album: "Single"),
    Cancion(id: 12, titulo: "Cariño", artista: "The Marías", anio: "2021", genero: "Indie Pop", album: "Cinema"),
    Cancion(id: 13, titulo: "Primaveral", artista: "Chappell Roan", anio: "2015", genero: "Folk/Latin", album: "Hasta la Raíz"),
    Cancion(id: 14, titulo: "Impacto", artista: "Chappell Roan", anio: "2008", genero: "Reggaeton", album: "Talento de Barrio"),
    Cancion(id: 15, titulo: "Ring Ring Ring", artista: "Chappell Roan", anio: "2023", genero: "Pop", album: "Single")
]


func getDatosCanciones() -> [Cancion] {
    return listaCanciones
}
