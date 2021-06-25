import XCTest

@testable import BeFoodNotTo

class BeFoodNotToTests: XCTestCase {

    func test_foo() {
        "https://api.ratings.food.gov.uk/Establishments/basic?latitude=53.9086163&longitude=-3.0474559&maxDistance=2"
    }
}

struct UserPreferences {
    var user: User
}

class EstablishmentURLCreator {
    //git status
    func createURLFor(user: User) -> URL {
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
