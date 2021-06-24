import Combine
import CoreLocation
import Foundation
import MapKit

class ReverseGeocoder {
    func reverseGeocode(location: CLLocation) -> Future<String, Never> {
        Future<String, Never> { promise in
            CLGeocoder().reverseGeocodeLocation(location, completionHandler: { (placemarks, error) in
                if error != nil {
                    promise(.success("newt found"))
                }
                if let area = placemarks?.first?.administrativeArea {
                    return promise(.success(area))
                } else {
                    return promise(.success("newt found"))
                }
            })
        }
    }
}
