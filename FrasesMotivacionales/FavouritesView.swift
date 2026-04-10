//
//  FavouritesView.swift
//  FrasesMotivacionales
//
//  Created by Manuel Alejandro Hernandez Marín on 09/04/26.
//

import Foundation
import SwiftUI

struct FavouritesView : View {
    
    @Environment(\.modelContext)  var modelContext
    
    @ObservedObject  var vm : PhraseViewViewModel
    
    
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(colors: [
                    Color(hex: ColorPalette.randomPastel).opacity(0.1),
                    Color(hex: ColorPalette.randomVivid).opacity(0.2)],
                               startPoint: .top,
                               endPoint: .bottom)
                .ignoresSafeArea()
                
                VStack {
                    if vm.favouritePhrases.count > 0 {
                        ScrollView (.vertical, showsIndicators: false){
                            ForEach(vm.favouritePhrases){ phrase in
                                FavouritePhraseView(phrase: phrase)
                            }
                        }
                    }else {
                        Text("Aún no has guardado frases")
                    }
                    
                    
                }
            }
            .navigationTitle("Tus favoritos")
            .navigationBarTitleDisplayMode(.large)
            .onAppear {
                vm.initFavouritesView()
            }
        }
    }
}

struct FavouritePhraseView : View {
    
    let phrase : Frases
    var body: some View {
        VStack (alignment: .leading, spacing : 8){
            HStack {
                VStack (alignment: .leading, spacing : 8){
                    Text(phrase.text)
                        .font(.system(size: 20, weight: .semibold))
                        .foregroundStyle(.white)
                    Text(phrase.authorId?.name ?? "Autor anónimo")
                        .font(.system(size: 14, weight: .light))
                        .foregroundStyle(.white)
                        .italic()
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
            }
        }
        .background(
            LinearGradient(colors: [
                Color(hex: ColorPalette.randomDark).opacity(0.8),
                Color(hex: ColorPalette.randomDark).opacity(0.7)],
       startPoint: .topLeading, endPoint: .bottomTrailing)
        )
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .padding(.horizontal, 24)
    }
}
//
//#Preview {
//    FavouritesView()
//}
