import Foundation
import SwiftData

class FrasesRepository{
    
    private let context:ModelContext
    
    init(context: ModelContext) {
        self.context = context
    }
    
    func addPhrases(frasesDTO:[FrasesModel], categoryDTO: [CategoriasModel], autorDTO: [AutorModel]) throws {
        var categoryDict: [Int: Categoria] = [:]
        var autorDict: [Int: Autor] = [:]
        
        for c in categoryDTO {
            let newCategory = Categoria(id: c.id, name: c.name)
            context.insert(newCategory)
            categoryDict[c.id] = newCategory
        }
        
        for a in autorDTO {
            let newAutor = Autor(id: a.id, name: a.name)
            context.insert(newAutor)
            autorDict[a.id] = newAutor
        }
        
        for frase in frasesDTO {
            let newFrace = Frases(
                id: frase.id,
                text: frase.text,
                categoryId: categoryDict[frase.categoryId],
                authorId: autorDict[frase.authorId ?? 0]
            )
            context.insert(newFrace)
        }
    }
    
    func addFavoritePhrases(fraseDTO:Frases,isFavorited:Bool){
        fraseDTO.favorite = isFavorited
    }
    
    func fetchPhrasesFavorites() -> Frases? {
        let descriptor = FetchDescriptor<Frases>(predicate: #Predicate { $0.favorite == true} )
        return (try? context.fetch(descriptor).randomElement())
    }
    
    func fetchPhraseRandom() -> Frases? {
        let descriptor = FetchDescriptor<Frases>()
        do{
            let frase = try context.fetch(descriptor)
            return frase.randomElement() ?? nil
        }catch{
         return nil
        }
    }
    
    func fetchPhrasesByCategory(idCategory:Int) -> Frases? {
        let descriptor = FetchDescriptor<Frases>(predicate: #Predicate { $0.categoryId?.id == idCategory } )
        do{
            let frase = try context.fetch(descriptor)
            return frase.randomElement() ?? nil
        }catch{
         return nil
        }
    }
    
    func fetchCategorys() -> [Categoria] {
        let descriptor = FetchDescriptor<Categoria>()
        return (try? context.fetch(descriptor)) ?? []
    }
    
    func fetchPhrases() -> [Frases] {
        let descriptor = FetchDescriptor<Frases>()
        let frases = (try? context.fetch(descriptor)) ?? []
        print("My prafes = \(frases)")
        return frases
    }
    
    func getPhrasesFavorites() -> [Frases]? {
        let descriptor = FetchDescriptor<Frases>(predicate: #Predicate { $0.favorite == true} )
        return (try? context.fetch(descriptor)) ?? []
    }
    
    func insertIfEmpty() -> Bool{
        var descriptor = FetchDescriptor<Frases>()
        descriptor.fetchLimit = 1
        
        if let result = try? context.fetch(descriptor), result.isEmpty {
            return true
        }else{
            return false
        }
    }
}
