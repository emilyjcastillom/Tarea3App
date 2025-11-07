//
//  ContentView.swift
//  Recomendaciones
//
//  Created by Alumno on 22/10/25.
//

import SwiftUI

struct ContentView: View {
    @State private var colorFondo = Color(red: 203/255, green: 231/255, blue: 253/255)
    @State private var colorTexto = Color(red: 17/255, green: 42/255, blue: 70/255)

    var body: some View {
        TabView {
            DashboardView()
                .tabItem {
                    Label("Tablero", systemImage: "chart.bar.xaxis")
                }

            DetalleView()
                .tabItem {
                    Label("Detalles", systemImage: "info.circle.fill")
                }

            AjustesView()
                .tabItem {
                    Label("Ajustes", systemImage: "gearshape.fill")
                }
        }
        .onAppear {
            let tabBarAppearance = UITabBarAppearance()
            tabBarAppearance.backgroundColor = UIColor.systemGray5
            UITabBar.appearance().standardAppearance = tabBarAppearance
            UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
        }
        .tint(colorTexto)
    }
}


#Preview {
    ContentView()
}
