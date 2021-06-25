import Foundation

struct Establishment: Codable, Identifiable {
    let id = UUID().uuidString
    let fhrsid: Int
    let localAuthorityBusinessID: String
    let businessName: String
    let businessType: String?
    let ratingValue, ratingDate: String
    //let links: [Link]
    
    enum CodingKeys: String, CodingKey {
        case fhrsid = "FHRSID"
        case localAuthorityBusinessID = "LocalAuthorityBusinessID"
        case businessName = "BusinessName"
        case businessType = "BusinessType"
        case ratingValue = "RatingValue"
        case ratingDate = "RatingDate"
        //case links
    }
}
