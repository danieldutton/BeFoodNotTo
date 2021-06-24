import Combine
import CoreLocation
import Foundation
import MapKit

struct User {
    var streetName: String
    var town: String
    var country: String
    var latLong: (lat: String, long: String)
}

class ReverseGeocoder {
    func reverseGeocode(location: CLLocation) -> AnyPublisher<User, Never> {
        Future<User, Never> { promise in
            CLGeocoder().reverseGeocodeLocation(location, completionHandler: { (placemarks, error) in
                if error != nil {
                    promise(.success(User(streetName: "", town: "", country: "", latLong: (lat: "", long: ""))))
                }
                
                //we can do this better with "??" operator
                if let first = placemarks?.first,
                   let streetName = first.thoroughfare,
                   let town = first.locality,
                   let country = first.administrativeArea,
                   let latLong = first.location?.coordinate {
                    
                    return promise(
                        .success(
                            User(
                                streetName: streetName,
                                town: town,
                                country: country,
                                //is it the view models job to format cllocationCoord2d
                                latLong: (lat: String(latLong.latitude), long: String(latLong.longitude))
                        )))
                } else {
                    promise(.success(User(streetName: "", town: "", country: "", latLong: (lat: "", long: ""))))
                }
            })
        }.eraseToAnyPublisher()
    }
}
