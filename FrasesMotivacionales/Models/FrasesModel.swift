import Foundation

struct FrasesModel: Decodable{
    var id:Int
    var text:String
    var lang:String
    var categoryId:Int
    var authorId:Int?
    enum CodingKeys: String, CodingKey {
        case id
        case text
        case lang
        case categoryId = "category_id"
        case authorId = "author_id"
    }
}
