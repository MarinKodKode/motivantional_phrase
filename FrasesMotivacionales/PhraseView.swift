//
//  PhraseView.swift
//  FrasesMotivacionales
//
//  Created by Manuel Alejandro Hernandez Marín on 07/04/26.
//
import Foundation
import SwiftUI

struct PhraseView : View {
    var body: some View {
     
        ZStack {
            LinearGradient(colors: [
                Color(hex: ColorPalette.randomPastel).opacity(0.1),
                Color(hex: ColorPalette.randomVivid).opacity(0.2)],
                           startPoint: .top,
                           endPoint: .bottom)
            .ignoresSafeArea()
            
             
            VStack {
                
                HStack(){
                    Button (action : {} ){
                        Image(systemName: "square.stack.3d.down.forward.fill")
                            .font(.system(size: 24))
                            .foregroundStyle(.black.opacity(0.8))
                            .padding(.horizontal, 16)
                            .padding(.top,24)
                    }
                    
                    Spacer()
                }
                
                Spacer()
                HStack {
                    VStack(alignment: .leading) {
                        Text("Viernes, 09")
                            .font(.system(size: 20, weight: .bold))
                            .foregroundStyle(.white.opacity(0.7))
                         
                        Text("Lo imposible solo cuesta un poco más")
                            .font(.system(size: 28, weight: .bold))
                            .padding(.trailing, 40)
                            .padding(.top, 12)
                            .foregroundStyle(.white)
                        
                        Text("Autor desconocido")
                            .font(.system(size: 18, weight: .regular))
                            .padding(.trailing, 40)
                            .padding(.top, 30)
                            .foregroundStyle(.white)
                    }
                    .padding()
                    .padding(.vertical, 32)
                }
                .background(
                    LinearGradient(colors: [
                        Color(hex: ColorPalette.randomDark),
                        Color(hex: ColorPalette.randomDark).opacity(0.9)],
                                   startPoint: .top,
                                   endPoint: .bottom)
                )
                .clipShape(RoundedRectangle(cornerRadius: 16))
                .shadow(radius: 6.9)
                
                HStack {
                    
                    Button(action : {}) {
                        Image(systemName: "square.and.arrow.up.fill")
                            .fontWeight(.bold)
                            .foregroundStyle(.white)
                            .padding()
                    }
                    .background(Color.gray.opacity(0.6))
                    .clipShape(Circle())
                    
                    Button(action : {}) {
                        Image(systemName: "heart.fill")
                            .fontWeight(.bold)
                            .foregroundStyle(.white)
                            .padding()
                    }
                    .background(Color.gray.opacity(0.6))
                    .clipShape(Circle())
                    
                    
                    
                    Button(action : {}) {
                        Image(systemName: "arrowshape.turn.up.right.fill")
                            .fontWeight(.bold)
                            .foregroundStyle(.white)
                            .padding()
                    }
                    .background(Color.gray.opacity(0.6))
                    .clipShape(Circle())
                }
                .padding(.top, 24)
                
                Spacer()
                
            }
            .padding(.horizontal, 24)
        }
        
    }
}

struct QuoteCard : Identifiable {
    let id = UUID()
    let date : String
    let quote : String
    let author : String
    let backgroundHex : String
}

struct SwipeableQuoteView : View {
    @State private var cards: [QuoteCard] = [
        QuoteCard(date: "Viernes, 09", quote: "Lo imposible solo cuesta un poco más", author: "Autor desconocido", backgroundHex: "#1B1B2F"),
        QuoteCard(date: "Viernes, 09", quote: "El éxito es la suma de pequeños esfuerzos repetidos día tras día", author: "Robert Collier", backgroundHex: "#1C3A4A"),
        QuoteCard(date: "Viernes, 09", quote: "No cuentes los días, haz que los días cuenten", author: "Muhammad Ali", backgroundHex: "#2C2C54"),
        QuoteCard(date: "Viernes, 09", quote: "La disciplina es el puente entre metas y logros", author: "Jim Rohn", backgroundHex: "#1B4332"),
        QuoteCard(date: "Viernes, 09", quote: "Cae siete veces, levántate ocho", author: "Proverbio japonés", backgroundHex: "#2D132C"),
    ]
    
    
    @State private var dragOffset : CGSize = .zero
    @State private var isDraggind = false
    
    private let swipeThreshold : CGFloat = -120
    private let rotationFactor : CGFloat = 8
    
    var body : some View {
        ZStack {
            if cards.count > 1 {
                QuoteCardView(card: cards[0])
                    .scaleEffect(bakc)
            }
        }
    }
    
    private var tiltAngle : Double {
        let progress = dragOffset.height / swipeThreshold
        return Double(dragOffset.width / 30) * Double(progress.clamped(to: 0...1))
    }
    
    private var rotation3D : Double {
        let progress = dragOffset.height / swipeThreshold
        return Double(progress.clamped(to: 0...1)) * 25
    }
    
    private var backCardScale : CGFloat {
        let progress = abs(dragOffset.height) / abs(swipeThreshold)
        return 0.92 + (0.08 * progress.clamped(to: 0...1))
        
    }
    
    private var backCardOffset: CGFloat {
            let progress = abs(dragOffset.height) / abs(swipeThreshold)
            return 16 - (16 * progress.clamped(to: 0...1))
        }
        
    
}

struct QuoteCardView: View {
    let card: QuoteCard
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(card.date)
                .font(.system(size: 15, weight: .medium))
                .foregroundStyle(.white.opacity(0.6))
            
            Spacer()
            
            Text(card.quote)
                .font(.system(size: 26, weight: .bold))
                .foregroundStyle(.white)
                .lineSpacing(4)
            
            Spacer()
            
            Text(card.author)
                .font(.system(size: 15, weight: .regular))
                .foregroundStyle(.white.opacity(0.6))
        }
        .padding(28)
        .frame(maxWidth: .infinity, minHeight: 220)
        .background(
            RoundedRectangle(cornerRadius: 24)
                .fill(Color(hex: card.backgroundHex))
        )
        .padding(.horizontal, 24)
    }
}

extension Comparable {
    func clamped(to range : ClosedRange<Self>) -> Self {
        min(max(self, range.lowerBound), range.upperBound)
    }
}



#Preview {
    PhraseView()
}
