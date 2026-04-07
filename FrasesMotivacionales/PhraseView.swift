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
                HStack {
                    VStack(alignment: .leading) {
                        Text("Viernes, 09")
                            .font(.system(size: 20, weight: .bold))
                            .foregroundStyle(.black.opacity(0.7)) 
                         
                        Text("Lo imposible solo cuesta un poco más")
                            .font(.system(size: 28, weight: .bold))
                            .padding(.trailing, 40)
                            .padding(.top, 12)
                            .foregroundStyle(.white)
                        
                        Text("Autor desconocido")
                            .font(.system(size: 18, weight: .thin))
                            .padding(.trailing, 40)
                            .padding(.top, 30)
                            .foregroundStyle(.white)
                    }
                    .padding()
                    .padding(.vertical, 32)
                }
                .background(
                    LinearGradient(colors: [
                        Color(hex: ColorPalette.randomVivid),
                        Color(hex: ColorPalette.randomVivid).opacity(0.9)],
                                   startPoint: .top,
                                   endPoint: .bottom)
                )
                .clipShape(RoundedRectangle(cornerRadius: 16))
                
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
                
            }
            .padding(.horizontal, 24)
        }
        
    }
}


#Preview {
    PhraseView()
}
