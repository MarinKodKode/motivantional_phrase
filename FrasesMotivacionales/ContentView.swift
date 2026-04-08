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
    @Query private var items: [Item]
    
    var body: some View {
        PhraseView()
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
