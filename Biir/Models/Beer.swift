import Foundation

struct Beer: Codable {
    var id: String?
    var name: String?
    var nameDisplay: String?
    var description: String?
    var abv: String?
    var availableId: Int?
    var styleId: Int?
    var isOrganic: String?
    var isRetired: String?
    var status: String?
    var statusDisplay: String?
    var foodPairings: String?
    var createDisplay: String?
    var createDate: String?
    var updateDate: String?
    var labels: Label?
    var style: Style?
}
