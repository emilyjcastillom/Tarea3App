//
//  ModelData.swift
//  Tarea3App
//
//  Created by Alumno on 06/11/25.
//

import Foundation
import SwiftUI

let minutosTotales: Array<minutosEscuchados> = [
    minutosEscuchados(anio: 2020, minutos: 25827),
    minutosEscuchados(anio: 2021, minutos: 24938),
    minutosEscuchados(anio: 2022, minutos: 28264),
    minutosEscuchados(anio: 2023, minutos: 41746),
    minutosEscuchados(anio: 2024, minutos: 57002)
]

let reproduccionesTotales: Array<reproducciones> = [
    reproducciones(id:1, cancion: "Dark Red", artista: "Steve Lacy", reproducciones: 185, anio: 2022),
    reproducciones(id:2, cancion: "City of Stars", artista: "Ryan Gosling", reproducciones: 415, anio: 2023),
    reproducciones(id:3, cancion: "I Don't Smoke", artista: "Mistki", reproducciones: 301, anio: 2024)
]
// barras - artistas mas escuchados
// pie chart - generos escuchados
// minutos escuchados - grafica valores x-y
// barra horizontal - reproduccion de canciones por año

let listaCanciones: Array<Cancion> = [
    Cancion(id: 1, titulo: "Good Luck, Babe!", artista: "Chappell Roan", anio: "2024", genero: "Pop", album: "https://cdn-images.dzcdn.net/images/cover/377470fb0413c43587769a7dea37f691/0x1900-000000-80-0-0.jpg"),
    Cancion(id: 2, titulo: "Tarde, Lejos", artista: "LAGOS", anio: "2024", genero: "Pop", album: "https://images.genius.com/d28cac68e8f5c21dd74b1b83e771f440.1000x1000x1.png"),
    Cancion(id: 3, titulo: "Te lo Advertí", artista: "Los Mesoneros", anio: "2019", genero: "Indie Rock", album: "https://i.scdn.co/image/ab67616d0000b2731222ae2c6d488691092bf830"),
    Cancion(id: 4, titulo: "Let Me Down Easy", artista: "Daisy Jones & The Six", anio: "2023", genero: "Rock", album: "https://i.scdn.co/image/ab67616d0000b27303d0025f96528545ca9a921d"),
    Cancion(id: 5, titulo: "My Propeller", artista: "Arctic Monkeys", anio: "2009", genero: "Indie Rock", album: "https://i.scdn.co/image/ab67616d0000b273758b7328e71d56dfa11fabf9"),
    Cancion(id: 6, titulo: "La Travesía", artista: "Juan Luis Guerra 4.0", anio: "2007", genero: "Música Latina", album: "https://akamai.sscdn.co/uploadfile/letras/fotos/d/0/b/6/d0b616dd01c4c3cac82e331768548daf.jpg"),
    Cancion(id: 7, titulo: "Exprópiese", artista: "Los Mesoneros", anio: "2019", genero: "Indie Rock", album: "https://i.scdn.co/image/ab67616d0000b2731222ae2c6d488691092bf830"),
    Cancion(id: 8, titulo: "Dark Red", artista: "Steve Lacy", anio: "2017", genero: "R&B", album: "https://i.scdn.co/image/ab67616d0000b2733d2dfa42f771cd458b194979"),
    Cancion(id: 9, titulo: "The Subway", artista: "Chappell Roan", anio: "2025", genero: "Pop", album: "https://cdn-images.dzcdn.net/images/cover/cf17950fcc770440235484271df2ee59/0x1900-000000-80-0-0.jpg"),
    Cancion(id: 10, titulo: "Vale la Pena", artista: "Juan Luis Guerra 4.0", anio: "1998", genero: "Música Latina", album: "https://i.scdn.co/image/ab67616d0000b273536c9d3bdf8a3959efc41a0f"),
    Cancion(id: 11, titulo: "505", artista: "Arctic Monkeys", anio: "2007", genero: "Indie Rock", album: "https://i.scdn.co/image/ab67616d0000b273b1f8da74f225fa1225cdface"),
    Cancion(id: 12, titulo: "City of Stars", artista: "Ryan Gosling", anio: "2016", genero: "Jazz", album: "https://i1.sndcdn.com/artworks-000206050820-g1xwab-t500x500.jpg"),
    Cancion(id: 13, titulo: "Últimas Palabras", artista: "Los Mesoneros", anio: "2019", genero: "Indie Rock", album: "https://i.scdn.co/image/ab67616d0000b2731222ae2c6d488691092bf830"),
    Cancion(id: 14, titulo: "HOT TO GO!", artista: "Chappell Roan", anio: "2023", genero: "Pop", album: "https://i.scdn.co/image/ab67616d00001e0296fa88fb1789be437d5cb4b6"),
    Cancion(id: 15, titulo: "Cariño", artista: "The Marías", anio: "2019", genero: "Alternativa", album: "https://i.scdn.co/image/ab67616d0000b273a64b06c0eb30ce15c3e6edc1"),
    Cancion(id: 16, titulo: "Primaveral", artista: "Mon Laferte", anio: "2017", genero: "Alternativa", album: "https://cdn-images.dzcdn.net/images/cover/5ee558ffdce01b3f88bf8b98470fa82c/1900x1900-000000-81-0-0.jpg"),
    Cancion(id: 17, titulo: "¿Qué Hora Es Allá?", artista: "Los Mesoneros", anio: "2024", genero: "Indie Rock", album: "https://i.scdn.co/image/ab67616d0000b27389c85c437bc3298dfee53705"),
    Cancion(id: 18, titulo: "Ring Ring Ring", artista: "Tyler, The Creator", anio: "2025", genero: "Alternativa", album: "https://i.scdn.co/image/ab67616d0000b2734b7fbb849ed845ddedcce346"),
    Cancion(id: 19, titulo: "De la noche a la mañana", artista: "Elefante", anio: "2001", genero: "Rock en Español", album: "https://cdn-images.dzcdn.net/images/cover/16bf8c28b7263ad3f9a67da5b224b21a/1900x1900-000000-80-0-0.jpg"),
    Cancion(id: 20, titulo: "Así es la vida", artista: "Elefante", anio: "2001", genero: "Rock en Español", album: "https://cdn-images.dzcdn.net/images/cover/16bf8c28b7263ad3f9a67da5b224b21a/1900x1900-000000-80-0-0.jpg")
]


func getDatosCanciones() -> [Cancion] {
    return listaCanciones
}
