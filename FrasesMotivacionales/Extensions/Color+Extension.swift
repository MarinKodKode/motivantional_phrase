//
//  Color+Extension.swift
//  FrasesMotivacionales
//
//  Created by Manuel Alejandro Hernandez Marín on 07/04/26.
//

import Foundation
import SwiftUI


extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (1, 1, 1, 0)
        }
        
        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue:  Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
    
    
}


struct ColorPalette {
    
    static let pastels: [String] = [
        "#FFB3BA", // Rosa suave
        "#FFDFBA", // Durazno
        "#FFFFBA", // Amarillo claro
        "#BAFFC9", // Menta
        "#BAE1FF", // Azul cielo
        "#E8BAFF", // Lavanda
        "#FFBAF0", // Rosa chicle
        "#BAF0FF", // Aqua
        "#D4FFBA", // Verde lima
        "#FFD4BA", // Salmón
        "#BAFFEC", // Turquesa suave
        "#F0BAFF", // Malva
        "#FFDDF0", // Rosa pálido
        "#DDF0FF", // Azul bebé
        "#F0FFD4", // Verde pastel
        "#FFF0BA", // Mantequilla
        "#FFBAD4", // Rosa frambuesa
        "#BAD4FF", // Periwinkle
        "#D4BAFF", // Lila
        "#BAFFD4", // Esmeralda suave
    ]
    
    static let vivids: [String] = [
        "#FF2D55", // Rojo carmesí
        "#FF6B00", // Naranja fuego
        "#FFD60A", // Amarillo eléctrico
        "#30D158", // Verde neón
        "#0A84FF", // Azul eléctrico
        "#BF5AF2", // Púrpura vibrante
        "#FF375F", // Rosa intenso
        "#00C7BE", // Teal
        "#34C759", // Verde manzana
        "#FF9F0A", // Ámbar
        "#5E5CE6", // Índigo
        "#FF6482", // Coral
        "#00B4D8", // Cyan
        "#C77DFF", // Violeta
        "#F72585", // Magenta
        "#4CC9F0", // Azul claro intenso
        "#7B2FBE", // Morado oscuro
        "#FB5607", // Naranja intenso
        "#06D6A0", // Verde esmeralda
        "#EF233C", // Rojo brillante
    ]
    
    static let darks: [String] = [
        "#1A1A2E", // Azul marino profundo
        "#16213E", // Navy oscuro
        "#0F3460", // Azul real oscuro
        "#1B1B2F", // Índigo oscuro
        "#2C2C54", // Púrpura profundo
        "#1A1A1A", // Casi negro
        "#2D132C", // Vino oscuro
        "#1C3A4A", // Teal oscuro
        "#2E4057", // Slate azul
        "#1B4332", // Verde bosque
        "#3B1F2B", // Marrón rojizo oscuro
        "#2C3E50", // Gris azulado
        "#1A2634", // Azul acero oscuro
        "#3D2B1F", // Café oscuro
        "#2B2D42", // Gris azul profundo
        "#1F2041", // Azul medianoche
        "#3C1642", // Morado oscuro
        "#0D1B2A", // Azul noche
        "#1E3231", // Verde pizarra
        "#2A1A2E", // Berenjena oscura
    ]
    
    static var randomPastel: String {
        pastels.randomElement()!
    }
    
    
    static var randomDark: String {
        darks.randomElement()!
    }
    
    static var randomVivid: String {
        vivids.randomElement()!
    }
    
    static var randomGradientPair: (pastel: String, vivid: String) {
        (randomPastel, randomVivid)
    }
}
