import Combine
import CoreLocation
import Foundation
import MapKit

struct User {
    var town: String
    var country: String
    var latLong: CLLocationCoordinate2D
}

class ReverseGeocoder {
    func reverseGeocode(location: CLLocation) -> AnyPublisher<User, Never> {
        Future<User, Never> { promise in
            CLGeocoder().reverseGeocodeLocation(location, completionHandler: { (placemarks, error) in
                if error != nil {
                    promise(.success(User(town: "", country: "", latLong: CLLocationCoordinate2D())))
                }
                if let first = placemarks?.first,
                   let town = first.locality,
                   let country = first.administrativeArea,
                   let latLong = first.location?.coordinate {
                    
                    return promise(.success(User(town: town, country: country, latLong: latLong)))
                } else {
                    return promise(.success(User(town: "", country: "", latLong: CLLocationCoordinate2D())))
                }
            })
        }.eraseToAnyPublisher()
    }
}
