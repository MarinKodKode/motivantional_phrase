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
    var phrasesCategory: [Frases] = []
    
    @Published var phrases : [Frases] = []
    @Published var favouritePhrases : [Frases] = []
        
    init(context: ModelContext) {
        self.repository = FrasesRepository(context: context)
        initPhrasesView()
        initFavouritesView()
    }
    
    func initPhrasesView() {
        getPhrasesFromRepo()
        fetchCategorias()
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
    
    func onTapButton_RemovePhraseToFavourites(_ phrase : Frases){
        self.repository.removeFavoritePhrases(fraseDTO: phrase)
    }

    func fetchCategorias() {
        self.categorias = self.repository.fetchCategorys()
    }
    func fetchPhrasesByCategory(with idCategory : Int) {
        self.phrases = self.repository
            .fetchPhrasesByRealCategory(idCategory: idCategory) ?? []
    }
}
