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
                categoryId: categoryDict[frase.id],
                authorId: autorDict[frase.id]
            )
            context.insert(newFrace)
        }
    }
    
    func addFavoritePhrases(idFrase:Int){
        let newFrase = FrasesFavoritas(idFrase: idFrase)
        context.insert(newFrase)
        do{
            try? context.save()
        }catch(let e){
            print("Error addList: \(e.localizedDescription)")
        }
    }
    
}
