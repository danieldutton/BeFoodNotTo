import XCTest

@testable import BeFoodNotTo

class BeFoodNotToTests: XCTestCase {

    func test_foo() {
        
    }
}

class EstablishmentURLCreator {
    //git status
    func createURL() -> URL {
        var urlComponents = URLComponents()
        
        urlComponents.scheme = "https"
        urlComponents.host = "api.ratings.food.gov.uk"
        urlComponents.path = "/Establishments/basic"
        let queryItems = [
            URLQueryItem(name: "latitude", value: ""),
            URLQueryItem(name: "longitude", value: ""),
            URLQueryItem(name: "maxDistanceLimit", value: ""),
            URLQueryItem(name: "ratingKey", value: "")
        ]
        urlComponents.queryItems = queryItems
        
        return urlComponents.url!
    }
}
