import Combine
import Foundation
import SwiftUI

class FoodSearchViewModel: ObservableObject {
    
    private var subscriptions = Set<AnyCancellable>()
    
    private var userLocator = UserLocator()
    
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
