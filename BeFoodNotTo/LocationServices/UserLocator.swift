import Combine
import CoreLocation

struct User {
    var test: String
}

class UserLocator: NSObject,  CLLocationManagerDelegate {
    var userLocation = PassthroughSubject<User, Never>()
    
    private var subscriptions = Set<AnyCancellable>()
    let locationManager: CLLocationManager
    private let reverseGeocoder: ReverseGeocoder
    
    
    init(locationManager: CLLocationManager = CLLocationManager(),
        reverseGeocoder: ReverseGeocoder = ReverseGeocoder()) {
        self.locationManager = locationManager
        self.reverseGeocoder = reverseGeocoder
        super.init()
    }
    
    func startUpdatingUserLocation() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.startUpdatingLocation()
    }
    
    func stopUpdatingUserLocation() {
        locationManager.delegate = nil
        locationManager.stopUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        //print("didUpdateLocations")
        locationManager.delegate = nil
        guard let location = locations.last else {
            //possible error
            return
        }
        reverseGeocoder.reverseGeocode(location: location)
            .receive(on: DispatchQueue.main)
            .sink(receiveValue: {
                self.userLocation.send($0)
            })
            .store(in: &subscriptions)
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .notDetermined:
            print("LocationManager:- not determined called")
            locationManager.requestWhenInUseAuthorization()
        case .authorizedWhenInUse, .authorizedAlways:
            print("LocationManager:- authorised")
            //startUpdatingUserLocation()
        case .denied, .restricted:
            //user denied permission on prompt
            //turned off locationServices permission in device settings
            //device is in airplane mode
            //restrictions such as parental controls
            //alert advising user they have disabled
            print("location manager denied/restricted")
            //userLocation.send(completion: .failure(.error(CrimeViewContentPlaceholders.locationUpdateDenied)))
        @unknown default:
            break
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("did faile with error loc manager")
        //userLocation.send(completion: .failure(.error(CrimeViewContentPlaceholders.locationDidFailWithError)))
    }
}
