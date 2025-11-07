//
//  AjustesView.swift
//  Tarea3App
//
//  Created by Alumno on 06/11/25.
//

import SwiftUI
import AVKit

struct AjustesView: View {
    @State private var username = ""
    @State var audioPlayer: AVAudioPlayer!
    @State private var selectedColor = 1
    @State private var sonido = false
    @AppStorage("darkMode") private var darkMode = false
    @State private var colorFondo = Color(red: 203/255, green: 231/255, blue: 253/255)
    @State private var colorTexto = Color(red: 17/255, green: 42/255, blue: 70/255)
    @State private var colorBotones = Color(red: 88/255, green: 154/255, blue: 204/255)
    @State private var volumen: Float = 0
    
    var body: some View {
        ScrollView {
            VStack(spacing: 30) {
                VStack(spacing: 15) {
                    Image(systemName: "person.circle.fill")
                        .foregroundColor(colorBotones)
                        .font(.system(size: 60))
                    Text("Preferencias del usuario")
                        .font(.system(size: 26, weight: .bold, design: .rounded))
                        .foregroundStyle(colorTexto)
                }
                .padding(.top, 20)
                
                VStack(spacing: 24) {
                    VStack(alignment: .leading, spacing: 12) {
                        HStack {
                            Image(systemName: darkMode ? "moon.fill" : "sun.max.fill")
                                .foregroundColor(colorBotones)
                                .font(.system(size: 20))
                            Text("Modo de apariencia")
                                .font(.system(size: 16, weight: .semibold))
                                .foregroundStyle(colorTexto)
                            Spacer()
                        }
                        
                        HStack {
                            Text("Light")
                                .font(.system(size: 14))
                                .foregroundStyle(colorTexto.opacity(darkMode ? 0.5 : 1))
                            Toggle("", isOn: $darkMode)
                                .labelsHidden()
                                .tint(colorBotones)
                                .onChange(of: darkMode) { oldValue, newValue in
                                        if newValue {
                                            colorTexto = Color(red: 203/255, green: 231/255, blue: 253/255)
                                            colorFondo = Color(red: 17/255, green: 42/255, blue: 70/255)
                                        } else {
                                            colorFondo = Color(red: 203/255, green: 231/255, blue: 253/255)
                                            colorTexto = Color(red: 17/255, green: 42/255, blue: 70/255)
                                        }
                                }
                            Text("Dark")
                                .font(.system(size: 14))
                                .foregroundStyle(colorTexto.opacity(darkMode ? 1 : 0.5))
                        }
                        .padding(.horizontal, 16)
                        .padding(.vertical, 12)
                        .background(colorTexto.opacity(0.05))
                        .cornerRadius(12)
                    }
                    .padding(16)
                    .background(colorTexto.opacity(0.03))
                    .cornerRadius(16)
                    
                    VStack(alignment: .leading, spacing: 12) {
                        HStack {
                            Image(systemName: "person.fill")
                                .foregroundColor(colorBotones)
                                .font(.system(size: 20))
                            Text("Nombre del usuario")
                                .font(.system(size: 16, weight: .semibold))
                                .foregroundStyle(colorTexto)
                        }
                        TextField("Ingresa tu nombre", text: $username)
                            .textFieldStyle(.plain)
                            .padding(12)
                            .background(colorTexto.opacity(0.05))
                            .cornerRadius(10)
                            .foregroundStyle(colorTexto)
                    }
                    .padding(16)
                    .background(colorTexto.opacity(0.03))
                    .cornerRadius(16)
                    
                    
                    // Volume Section
                    VStack(alignment: .leading, spacing: 12) {
                        HStack {
                            Image(systemName: volumen > 0.5 ? "speaker.wave.3.fill" : (volumen > 0 ? "speaker.wave.1.fill" : "speaker.fill"))
                                .foregroundColor(colorBotones)
                                .font(.system(size: 20))
                            Text("Volumen")
                                .font(.system(size: 16, weight: .semibold))
                                .foregroundStyle(colorTexto)
                            Spacer()
                            Text("\(Int(volumen * 100))%")
                                .font(.system(size: 14, weight: .medium))
                                .foregroundStyle(colorTexto.opacity(0.7))
                        }
                        
                        HStack(spacing: 12) {
                            Image(systemName: "speaker.fill")
                                .foregroundColor(colorTexto.opacity(0.5))
                                .font(.system(size: 14))
                            Slider(value: $volumen, in: 0...1, onEditingChanged: { _ in
                                self.audioPlayer.volume = volumen
                            })
                            .tint(colorBotones)
                            Image(systemName: "speaker.wave.3.fill")
                                .foregroundColor(colorTexto.opacity(0.5))
                                .font(.system(size: 14))
                        }
                    }
                    .padding(16)
                    .background(colorTexto.opacity(0.03))
                    .cornerRadius(16)
                    
                    // Sound Toggle Section
                    VStack(alignment: .leading, spacing: 12) {
                        HStack {
                            Image(systemName: sonido ? "music.note" : "music.note.slash")
                                .foregroundColor(colorBotones)
                                .font(.system(size: 20))
                            Text("Reproducir música")
                                .font(.system(size: 16, weight: .semibold))
                                .foregroundStyle(colorTexto)
                            Spacer()
                            Toggle("", isOn: $sonido)
                                .labelsHidden()
                                .tint(colorBotones)
                                .onChange(of: sonido) { oldValue, newValue in
                                    if newValue {
                                        self.audioPlayer.play()
                                    } else {
                                        self.audioPlayer.stop()
                                        self.audioPlayer.currentTime = 0.0
                                    }
                                }
                        }
                    }
                    .padding(16)
                    .background(colorTexto.opacity(0.03))
                    .cornerRadius(16)
                }
                
                // Save Button
                Button(action: {
                    UserDefaults.standard.set(username, forKey: "username")
                    UserDefaults.standard.set(selectedColor, forKey: "selectedColor")
                    UserDefaults.standard.set(volumen, forKey: "volumen")
                    UserDefaults.standard.set(sonido, forKey: "sonido")
                    UserDefaults.standard.set(darkMode, forKey: "darkMode")
                }) {
                    HStack {
                        Image(systemName: "checkmark.circle.fill")
                            .font(.system(size: 18))
                        Text("Guardar Cambios")
                            .font(.system(size: 16, weight: .semibold))
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 16)
                    .background(colorBotones)
                    .foregroundColor(.white)
                    .cornerRadius(14)
                    .shadow(color: colorBotones.opacity(0.3), radius: 8, x: 0, y: 4)
                }
                .padding(.top, 10)
            }
            .padding(24)
            
        }
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
            
            volumen = UserDefaults.standard.float(forKey: "volumen")
            sonido = UserDefaults.standard.bool(forKey: "sonido")
            darkMode = UserDefaults.standard.bool(forKey: "darkMode")
            
            // Apply saved dark mode state
            if darkMode {
                colorTexto = Color(red: 203/255, green: 231/255, blue: 253/255)
                colorFondo = Color(red: 17/255, green: 42/255, blue: 70/255)
            }
            
            
            if sonido {
                audioPlayer.volume = volumen
                audioPlayer.play()
            }
        }
    }
}

#Preview {
    AjustesView()
}
