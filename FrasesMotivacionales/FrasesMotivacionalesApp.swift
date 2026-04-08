//
//  FrasesMotivacionalesApp.swift
//  FrasesMotivacionales
//
//  Created by Manuel Alejandro Hernandez Marín on 06/04/26.
//

import SwiftData
import SwiftUI

@main
struct FrasesMotivacionalesApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Frases.self,
            Categoria.self,
            Autor.self
        ])
        let modelConfiguration = ModelConfiguration(
            schema: schema,
            isStoredInMemoryOnly: false
        )

        do {
            return try ModelContainer(
                for: schema,
                configurations: [modelConfiguration]
            )
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(sharedModelContainer)
    }
}
