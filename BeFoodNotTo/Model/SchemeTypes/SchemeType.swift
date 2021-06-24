import Foundation

struct SchemeType: Codable {
    let schemeTypeid: Int
    let schemeTypeName, schemeTypeKey: String
    let links: [Link]
}
