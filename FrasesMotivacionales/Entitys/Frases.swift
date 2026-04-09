import Foundation
import SwiftData

@Model
class Frases{
    var id:Int
    var text:String
    var categoryId:Categoria?
    var authorId:Autor?
    var favorite:Bool?
    
    init(id: Int, text: String, categoryId: Categoria?, authorId: Autor?,favorite:Bool = false) {
        self.id = id
        self.text = text
        self.categoryId = categoryId
        self.authorId = authorId
        self.favorite = favorite
    }
}
