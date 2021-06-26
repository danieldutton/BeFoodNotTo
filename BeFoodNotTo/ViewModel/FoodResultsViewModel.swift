import Combine
import Foundation
import SwiftUI

class FoodResultsViewModel: ObservableObject {
    private var subscriptions = Set<AnyCancellable>()
    private var establishmentsService: EstablishmentsService
    
    @Published var isPerformingWork = false
    @Published var establishments: Establishments = Establishments(establishments: [])
    
    
    init(establishmentsService: EstablishmentsService = EstablishmentsService()) {
        self.establishmentsService = establishmentsService
        getEstablishments()
    }
    
    func getEstablishments() {
        establishmentsService.getEstablishments()
            .receive(on: DispatchQueue.main)
            .assign(to: \.establishments, on: self)
            .store(in: &subscriptions)
    }
}
