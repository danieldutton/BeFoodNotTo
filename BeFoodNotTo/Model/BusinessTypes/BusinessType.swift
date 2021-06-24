import Foundation

struct BusinessType: Codable {
    let businessTypeID: Int
    let businessTypeName: String
    let links: [Link]

    enum CodingKeys: String, CodingKey {
        case businessTypeID
        case businessTypeName
        case links
    }
}
