import Combine
import CoreLocation
import Foundation
import MapKit

class ReverseGeocoder {
    func reverseGeocode(location: CLLocation) -> AnyPublisher<User, Never> {
        Future<User, Never> { promise in
            CLGeocoder().reverseGeocodeLocation(location, completionHandler: { (placemarks, error) in
                if error != nil {
                    promise(.success(User(test: "newt found")))
                }
                if let area = placemarks?.first?.administrativeArea {
                    return promise(.success(User(test: area)))
                } else {
                    return promise(.success(User(test: "newt found")))
                }
            })
        }.eraseToAnyPublisher()
    }
}
