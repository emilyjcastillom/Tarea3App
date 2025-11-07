//
//  DashboardView.swift
//  Tarea3App
//
//  Created by Alumno on 06/11/25.
//

import SwiftUI
import Charts

struct DashboardView: View {
    @AppStorage("darkMode") private var darkMode = false
    @State private var colorFondo = Color(red: 203/255, green: 231/255, blue: 253/255)
    @State private var colorTexto = Color(red: 17/255, green: 42/255, blue: 70/255)
    @State private var colorBotones = Color(red: 88/255, green: 154/255, blue: 204/255)
    @State var dataPie = [
        (6.0, Color.red),
        (3.0, Color.blue),
        (1.0, Color.yellow),
        (4.0, Color.green)
    ]
    
    // Computed property: Top 5 most heard artists
    var top5Artists: [(artist: String, count: Int)] {
        let artistCounts = Dictionary(grouping: listaCanciones, by: { $0.artista })
            .mapValues { $0.count }
        
        return artistCounts.sorted { $0.value > $1.value }
            .prefix(5)
            .map { (artist: $0.key, count: $0.value) }
    }
    
    // Computed property: Filter minutes for years 2020-2025
    var filteredMinutes: [minutosEscuchados] {
        minutosTotales.filter { $0.anio >= 2020 && $0.anio <= 2025 }
    }

    var body: some View {
        ScrollView {
            VStack(spacing: 30) {
                // Header
                VStack(spacing: 12) {
                    Image(systemName: "chart.bar.fill")
                        .foregroundColor(colorBotones)
                        .font(.system(size: 60))
                    Text("Estadísticas Musicales")
                        .font(.system(size: 26, weight: .bold, design: .rounded))
                        .foregroundStyle(colorTexto)
                }
                .padding(.top, 20)
                
                // Bar Chart - Top 5 Artists
                VStack(alignment: .leading, spacing: 12) {
                    HStack {
                        Image(systemName: "music.mic")
                            .foregroundColor(colorBotones)
                            .font(.system(size: 20))
                        Text("Top 5 Artistas más escuchados")
                            .font(.system(size: 16, weight: .semibold))
                            .foregroundStyle(colorTexto)
                    }
                    
                    Chart(top5Artists, id: \.artist) { item in
                        BarMark(
                            x: .value("Artista", item.artist),
                            y: .value("Canciones", item.count)
                        )
                        .foregroundStyle(colorBotones)
                    }
                    .frame(height: 200)
                }
                .padding(16)
                .background(colorTexto.opacity(0.03))
                .cornerRadius(16)
                
                // Line Chart - Minutes 2020-2025
                VStack(alignment: .leading, spacing: 12) {
                    HStack {
                        Image(systemName: "clock.fill")
                            .foregroundColor(colorBotones)
                            .font(.system(size: 20))
                        Text("Minutos escuchados (2020-2025)")
                            .font(.system(size: 16, weight: .semibold))
                            .foregroundStyle(colorTexto)
                    }
                    
                    Chart(filteredMinutes) { item in
                        LineMark(
                            x: .value("Año", item.anio),
                            y: .value("Minutos", item.minutos)
                        )
                        .foregroundStyle(colorBotones)
                    }
                    .chartXScale(domain: 2020...2025)
                    .frame(height: 200)
                }
                .padding(16)
                .background(colorTexto.opacity(0.03))
                .cornerRadius(16)
                
                // Pie Chart
                VStack(alignment: .leading, spacing: 12) {
                    HStack {
                        Image(systemName: "chart.pie.fill")
                            .foregroundColor(colorBotones)
                            .font(.system(size: 20))
                        Text("Distribución por géneros")
                            .font(.system(size: 16, weight: .semibold))
                            .foregroundStyle(colorTexto)
                    }
                    
                    PieChartView(slices: dataPie, isDonut: false, hasGap: true)
                        .frame(height: 200)
                }
                .padding(16)
                .background(colorTexto.opacity(0.03))
                .cornerRadius(16)
                
                Spacer()
            }
            .padding(24)
        }
        .background(colorFondo)
    }
}

#Preview {
    DashboardView()
}
