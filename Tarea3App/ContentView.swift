//
//  ContentView.swift
//  Tarea3App
//
//  Created by Alumno on 05/11/25.
//

import SwiftUI
import AVKit

struct ContentView: View {
    @State private var username = ""
    @State var audioPlayer: AVAudioPlayer!
    @State private var selectedColor = 1
    @State private var sonido =  false
    @State private var darkMode =  false
    @State private var colorFondo = Color(red: 203/255, green: 231/255, blue: 253/255)
    @State private var colorTexto = Color(red: 17/255, green: 42/255, blue: 70/255)
    @State private var colorBotones = Color(red: 88/255, green: 154/255, blue: 204/255)
    @State private var volumen: Float = 0
    
    var body: some View {
        VStack(spacing: 50) {
            VStack(spacing: 5){
                Text("Preferencias del usuario")
                    .font(.system(size: 24, design: .rounded))
                    .bold()
                    .backgroundStyle(colorTexto)
            }
            .padding(.top, 20)
            .padding(.bottom, 20)
            
            HStack{
                Toggle("Light mode", isOn: $darkMode)
                    .tint(colorBotones)
                    .onChange(of: darkMode)
                { oldValue, newValue in
                    if(newValue){
                        colorTexto = Color(red: 203/255, green: 231/255, blue: 253/255)
                        colorFondo = Color(red: 17/255, green: 42/255, blue: 70/255)
                    }else{
                        colorFondo = Color(red: 203/255, green: 231/255, blue: 253/255)
                        colorTexto = Color(red: 17/255, green: 42/255, blue: 70/255)
                    }
                }
                Text("Dark mode")
            }
            
            VStack(alignment: .leading){
                Text("Nombre del usuario")
                    .backgroundStyle(colorTexto)
                TextField("Username", text: $username)
                    .textFieldStyle(.roundedBorder)
            }
            VStack(alignment: .leading){
                Text("Color de fondo")
                    .backgroundStyle(colorTexto)
                Picker(selection: $selectedColor, label: Text("Picker")){
                    Text("Verde").tag(1)
                    Text("Amarillo").tag(2)
                    Text("Azul").tag(3)
                }
                .pickerStyle(.segmented)
                .onChange(of: selectedColor) {oldValue, newValue in
                    if (newValue == 1){
                        colorFondo = Color(red: 181/255, green: 204/255, blue: 181/255)
                        
                    } else if (newValue == 2) {
                        colorFondo = Color(red: 248/255, green: 248/255, blue: 186/255)
                    } else if (newValue == 3){
                        colorFondo = Color(red: 186/255, green: 186/255, blue: 248/255)
                    } else {
                        colorFondo = Color(red: 203/255, green: 231/255, blue: 253/255)
                    }
                }
            }
            
            VStack(alignment: .leading){
                Text("Volúmen")
                    .backgroundStyle(colorTexto)
                Slider(value: $volumen, in: 0 ... 1,
                       onEditingChanged: { value in
                    self.audioPlayer.volume = volumen
                }).tint(colorBotones)
            }
            Toggle("Sonido:", isOn: $sonido)
                .onChange(of: sonido)
            { oldValue, newValue in
                if(newValue){
                    self.audioPlayer.play()
                }else{
                    self.audioPlayer.stop()
                    self.audioPlayer.currentTime = 0.0
                }
            }
            .tint(colorBotones)
            HStack{
                Spacer()
                Button("Guardar"){
                    UserDefaults.standard.set(username, forKey: "username")
                    UserDefaults.standard.set(selectedColor, forKey: "selectedColor")
                    UserDefaults.standard.set(volumen, forKey: "volumen")
                    UserDefaults.standard.set(sonido, forKey: "sonido")
                }.buttonStyle(.borderedProminent)
                    .tint(.black)
            }
            
            
        }
        .padding()
        .background(colorFondo)
        
        .onAppear() {
            let sound = Bundle.main.path(forResource: "MarioMundoAgua", ofType: "mp3")
            do {
                self.audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
            } catch {
                print("Error al cargar audio: \(error)")
            }
            
            if let usernameX = UserDefaults.standard.string(forKey: "username") {
                username = usernameX
            }
            
            selectedColor = UserDefaults.standard.integer(forKey: "selectedColor")
            volumen = UserDefaults.standard.float(forKey: "volumen")
            sonido = UserDefaults.standard.bool(forKey: "sonido")
            
            if selectedColor == 1 {
                colorFondo = Color(red: 181/255, green: 204/255, blue: 181/255)
            } else if selectedColor == 2 {
                colorFondo = Color(red: 248/255, green: 248/255, blue: 186/255)
            } else if selectedColor == 3 {
                colorFondo = Color(red: 186/255, green: 186/255, blue: 248/255)
            } else {
                colorFondo = Color(red: 203/255, green: 231/255, blue: 253/255)
            }
            
            if sonido {
                audioPlayer.play()
            }
        }
    }
}

#Preview {
    ContentView()
}

