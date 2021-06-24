import Foundation

struct Establishment: Codable {
    let fhrsid: Int
    let localAuthorityBusinessID: Int
    let businessName: String
    let businessType: String? //check this is a strign value as emitted jsonnull
    let ratingValue, ratingDate: String
    //let links: [Link]

}
