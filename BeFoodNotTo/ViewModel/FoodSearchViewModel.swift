import Combine
import CoreLocation
import Foundation
import SwiftUI

class FoodSearchViewModel: ObservableObject {
    
    private var subscriptions = Set<AnyCancellable>()
    
    private var userLocator = UserLocator()
    
    @Published var user = User(streetName: "", town: "", country: "", latLong: (lat: "", long: ""))
    
    @Published var establishments: Establishments = Establishments(
        establishments: [],
        meta: Meta(dataSource: "",
                   extractDate: "",
                   itemCount: 0,
                   returncode: "",
                   totalCount: 0,
                   totalPages: 0,
                   pageSize: 0,
                   pageNumber: 0),
        links: [])
    
    func getUserLocation() {
        userLocator.userLocation
            .sink(receiveValue: {
                self.user = $0
            })
            .store(in: &subscriptions)
        userLocator.startUpdatingUserLocation()
    }
    
    func getEstablishments() {
        EstablishmentsService().getEstablishments()
            .receive(on: DispatchQueue.main)
            .replaceError(with: initialEmptyEstablishments())
            .assign(to: \.establishments, on: self)
            .store(in: &subscriptions)
    }
    
    private func initialEmptyEstablishments() -> Establishments {
        Establishments(
            establishments: [],
            meta: Meta(dataSource: "",
                       extractDate: "",
                       itemCount: 0,
                       returncode: "",
                       totalCount: 0,
                       totalPages: 0,
                       pageSize: 0,
                       pageNumber: 0),
            links: [])
    }
}
