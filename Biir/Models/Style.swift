import Foundation

struct Style: Codable {
    var id: Int?
    var categoryId: Int?
    var name: String?
    var shortName: String?
    var description: String?
    var ibuMin: String?
    var ibuMax: String?
    var createData: String?
    var category: Category?
}
