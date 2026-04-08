import Foundation
import SwiftData

@Model
class Frases{
    var id:Int
    var text:String
    var lang:String
    var categoryId:Int
    var authorId:Int
    
    init(id: Int, text: String, lang: String, categoryId: Int, authorId: Int) {
        self.id = id
        self.text = text
        self.lang = lang
        self.categoryId = categoryId
        self.authorId = authorId
    }
}
