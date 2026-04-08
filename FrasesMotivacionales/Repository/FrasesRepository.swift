import Foundation
import SwiftData

class FrasesRepository{
    
    private let context:ModelContext
    
    init(context: ModelContext) {
        self.context = context
    }
    
    func agregarFrases(frases:[Frases]){
        
    }
    
    func agregarFraseFavoritas(idFrase:Int){
        let newFrase = FrasesFavoritas(idFrase: idFrase)
        context.insert(newFrase)
        do{
            try? context.save()
        }catch(let e){
            print("Error addList: \(e.localizedDescription)")
        }
    }
    
}
