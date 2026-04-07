import Foundation
import SwiftData

@Model
class Categoria{
    var id:Int
    var name:String
    var frases:[Frases] = []
    
    init(id: Int, name: String) {
        self.id = id
        self.name = name
    }
}
