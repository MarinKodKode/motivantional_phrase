//
//  ContentView.swift
//  FrasesMotivacionales
//
//  Created by Manuel Alejandro Hernandez Marín on 06/04/26.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    var repo:FrasesRepository {
        FrasesRepository(context: modelContext)
    }
    
    var body: some View {
        PhraseView()
            .task{
                guard repo.insertIfEmpty() else{
                    return
                }
                
                let autores = JSONLoader.loadAutors()
                let categorias = JSONLoader.loadCategories()
                let frases = JSONLoader.loadPhrases()
                
                do{
                    try repo.addPhrases(frasesDTO: frases, categoryDTO: categorias, autorDTO: autores)
                }catch(let e){
                    print("Error: \(e.localizedDescription)")
                }
                
                
            }
    }
}

#Preview {
    @Environment(\.modelContext) var modelContext
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
