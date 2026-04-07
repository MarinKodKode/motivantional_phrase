import Foundation
import SwiftData

@Model
class Frases{
    var id:Int
    var text:String
    var categoryId:Categoria?
    var authorId:Autor?
    
    init(id: Int, text: String, categoryId: Categoria?, authorId: Autor?) {
        self.id = id
        self.text = text
        self.categoryId = categoryId
        self.authorId = authorId
    }
}
