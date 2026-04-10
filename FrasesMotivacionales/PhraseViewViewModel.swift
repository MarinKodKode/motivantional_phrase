//
//  PhraseViewViewModel.swift
//  FrasesMotivacionales
//
//  Created by Manuel Alejandro Hernandez Marín on 07/04/26.
//

import Foundation
import Combine
import SwiftData

class PhraseViewViewModel : ObservableObject {
    
    private let repository: FrasesRepository
        
    var fraseActual: Frases?
    var categorias: [Categoria] = []
    
    @Published var phrases : [Frases] = []
    @Published var favouritePhrases : [Frases] = []
        
    init(context: ModelContext) {
        self.repository = FrasesRepository(context: context)
        initPhrasesView()
        initFavouritesView()
    }
    
    func initPhrasesView() {
        getPhrasesFromRepo()
    }
    
    func initFavouritesView() {
        getFavouritePhrases()
    }
    
    func getPhrasesFromRepo() {
        self.phrases = self.repository.fetchPhrases()
    }
    
    func getFavouritePhrases() {
        self.favouritePhrases = self.repository.getPhrasesFavorites() ?? []
    }
    
    func onTapButton_AddPhraseToFavourites(_ phrase : Frases){
        self.repository.addFavoritePhrases(fraseDTO: phrase, isFavorited: true)
    }
}
