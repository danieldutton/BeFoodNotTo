import Foundation

struct SortOption: Codable {
    let sortOptionID: Int
    let sortOptionName, sortOptionKey: String


    enum CodingKeys: String, CodingKey {
        case sortOptionID = "sortOptionId"
        case sortOptionName, sortOptionKey
    }
}
