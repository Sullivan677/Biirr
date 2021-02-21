import Foundation

struct BeerResult: Codable {
    var currentPage: Int?
    var numberOfPages: Int?
    var totalResults: Int?
    var data: [Beer]?
}
