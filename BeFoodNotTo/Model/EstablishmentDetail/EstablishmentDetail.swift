import Foundation

struct EstablishmentDetail: Codable {
    let fhrsid, changesByServerID: Int
    let localAuthorityBusinessID, businessName, businessType: String
    let businessTypeID: Int
    let addressLine1, addressLine2, addressLine3, addressLine4: String
    let postCode, phone, ratingValue, ratingKey: String
    let ratingDate, localAuthorityCode, localAuthorityName: String
    let localAuthorityWebSite: String
    let localAuthorityEmailAddress: String
    let scores: Scores
    let schemeType: String
    let geocode: Geocode
    let rightToReply: String
    let distance: Int? //could be string
    let newRatingPending: Bool
    //let meta: Meta
    //let links: [Link]

    enum CodingKeys: String, CodingKey {
        case fhrsid = "FHRSID"
        case changesByServerID = "ChangesByServerID"
        case localAuthorityBusinessID = "LocalAuthorityBusinessID"
        case businessName = "BusinessName"
        case businessType = "BusinessType"
        case businessTypeID = "BusinessTypeID"
        case addressLine1 = "AddressLine1"
        case addressLine2 = "AddressLine2"
        case addressLine3 = "AddressLine3"
        case addressLine4 = "AddressLine4"
        case postCode = "PostCode"
        case phone = "Phone"
        case ratingValue = "RatingValue"
        case ratingKey = "RatingKey"
        case ratingDate = "RatingDate"
        case localAuthorityCode = "LocalAuthorityCode"
        case localAuthorityName = "LocalAuthorityName"
        case localAuthorityWebSite = "LocalAuthorityWebSite"
        case localAuthorityEmailAddress = "LocalAuthorityEmailAddress"
        case scores
        case schemeType = "SchemeType"
        case geocode
        case rightToReply = "RightToReply"
        case distance = "Distance"
        case newRatingPending = "NewRatingPending"
        //case meta, links
    }
}

import CoreLocation

extension EstablishmentDetail {
    var latLong: CLLocationCoordinate2D {
        let result = CLLocationCoordinate2D(latitude: Double(geocode.latitude)!, longitude: Double(geocode.longitude)!)
        print(result)
        return result
    }
}




