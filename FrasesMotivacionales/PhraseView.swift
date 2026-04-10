//
//  PhraseView.swift
//  FrasesMotivacionales
//
//  Created by Manuel Alejandro Hernandez Marín on 07/04/26.
//
import Foundation
import SwiftUI

struct PhraseView : View {
    @Environment(\.modelContext)  var modelContext
    
    @ObservedObject  var vm : PhraseViewViewModel
    
    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(colors: [
                    Color(hex: ColorPalette.randomPastel).opacity(0.1),
                    Color(hex: ColorPalette.randomVivid).opacity(0.2)],
                               startPoint: .top,
                               endPoint: .bottom)
                .ignoresSafeArea()
                
                VStack {
                    HStack(){
                        NavigationLink{
                            FavouritesView(vm: PhraseViewViewModel(context: modelContext))
                        } label :{
                            Image(systemName: "square.stack.3d.down.forward.fill")
                                .font(.system(size: 24))
                                .foregroundStyle(.primary.opacity(0.8))
                                .padding(.horizontal, 16)
                                .padding(.top,24)
                        }
                        Spacer()
                    }
                    
                    Spacer()
                    
                    SwipeableQuoteViewDes(
                        vm: PhraseViewViewModel(context: modelContext)
                    )
                    
                    
                    
                    Spacer()
                    
                }
                .padding(.horizontal, 24)
            }
            .onAppear {
                vm.initPhrasesView()
            }
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
    let card: Frases
    
    var body: some View {
        
        HStack {
            VStack(alignment: .leading, spacing: 12) {
                Text(card.categoryId?.name ?? "")
                    .font(.system(size: 16, weight: .bold))
                    .foregroundStyle(.white.opacity(0.7))
                
                Text(card.text)
                    .font(.system(size: 24, weight: .bold))
                    .padding(.trailing, 40)
                    .padding(.top, 12)
                    .foregroundStyle(.white)
                
                
                Text(card.authorId?.name ?? "Autor desconocido")
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



//#Preview {
//    PhraseView()
//}
