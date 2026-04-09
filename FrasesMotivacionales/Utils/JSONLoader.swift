import Foundation
final class JSONLoader {
    static func loadPhrases() -> [FrasesModel] {
        guard let url = Bundle.main.url(forResource: "phrases", withExtension: "json") else {
            return []
        }
        do {
            let data = try Data(contentsOf: url)
            let phrases = try JSONDecoder().decode([FrasesModel].self, from: data)
            return phrases
        } catch {
            return []
        }
    }
    
    static func loadAutors() -> [AutorModel] {
        guard let url = Bundle.main.url(forResource: "autors", withExtension: "json") else {
            return []
        }
        do {
            let data = try Data(contentsOf: url)
            let autors = try JSONDecoder().decode([AutorModel].self, from: data)
            return autors
        } catch {
            return []
        }
    }
    
    static func loadCategories() -> [CategoriasModel] {
        guard let url = Bundle.main.url(forResource: "categories", withExtension: "json") else {
            return []
        }
        do {
            let data = try Data(contentsOf: url)
            let categories = try JSONDecoder().decode([CategoriasModel].self, from: data)
            return categories
        } catch {
            return []
        }
    }
}

