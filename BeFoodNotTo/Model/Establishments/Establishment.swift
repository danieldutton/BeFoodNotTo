import Foundation

struct Establishment: Codable {
    let fhrsid: Int
    let localAuthorityBusinessID, businessName: String
    let businessType: String? //check this is a strign value as emitted jsonnull
    let ratingValue, ratingDate: String
    let links: [Link]

    enum CodingKeys: String, CodingKey {
        case fhrsid
        case localAuthorityBusinessID
        case businessName
        case businessType
        case ratingValue
        case ratingDate
        case links
    }
}
