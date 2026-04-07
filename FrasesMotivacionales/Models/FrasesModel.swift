import Foundation

struct FrasesModel: Decodable{
    var id:Int
    var text:String
    var lang:String
    var categoryId:Int
    var authorId:Int
}
