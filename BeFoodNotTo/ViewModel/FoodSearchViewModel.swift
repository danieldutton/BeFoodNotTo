import Combine
import CoreLocation
import Foundation
import SwiftUI

class FoodSearchViewModel: ObservableObject {
    
    private var subscriptions = Set<AnyCancellable>()
    
    private var userLocator = UserLocator()
    
    @Published var user = User(streetName: "", town: "", country: "", latLong: (lat: "", long: ""))
    
    @Published var establishments = Establishments(establishments: [])
    
    func getUserLocation() {
        userLocator.userLocation
            .sink(receiveValue: {
                self.user = $0
            })
            .store(in: &subscriptions)
        userLocator.startUpdatingUserLocation()
    }
    
    func getSavedSearchPreferences() {
        //need to combine the two above
    }
    
    func getEstablishments() {
        EstablishmentsService().getEstablishments()
            .receive(on: DispatchQueue.main)
            .replaceError(with: initialEmptyEstablishments())
            .assign(to: \.establishments, on: self)
            .store(in: &subscriptions)
    }
    
    private func initialEmptyEstablishments() -> Establishments {
        Establishments(establishments: [])
    }
}
