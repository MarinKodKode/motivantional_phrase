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
                
                SwipeableQuoteViewDes()

                
                HStack {
                    
                    Button(action: {
                        let image = takeScreenshot()
                
                        shareImage(image)
                    }) {
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

struct QuoteCardView: View {
    let card: QuoteCard
    
    var body: some View {
        
        HStack {
            VStack(alignment: .leading, spacing: 12) {
                Text(card.date)
                    .font(.system(size: 16, weight: .bold))
                    .foregroundStyle(.white.opacity(0.7))
                
                Text(card.quote)
                    .font(.system(size: 24, weight: .bold))
                    .padding(.trailing, 40)
                    .padding(.top, 12)
                    .foregroundStyle(.white)
                
                
                Text(card.author)
                    .font(.system(size: 16, weight: .regular))
                    .padding(.trailing, 40)
                    .padding(.top, 30)
                    .foregroundStyle(.white)
            }
            .padding()
            .padding(.vertical, 32)
        }
        .frame(width: 360, height: 320)
        .background(
            LinearGradient(colors: [
                Color(hex: ColorPalette.randomDark),
                Color(hex: ColorPalette.randomDark)],
                           startPoint: .top,
                           endPoint: .bottom)
        )
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .shadow(radius: 6.9)
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
