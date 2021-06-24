import Combine
import SwiftUI

@main
struct BeFoodNotToApp: App {
    private var subscriptions = Set<AnyCancellable>()
    
    init() {
        EstablishmentsService().getEstablishments()
            .sink(receiveCompletion: {
                print($0)
            }, receiveValue: {
                print($0)
            })
            .store(in: &subscriptions)
    }
    
    var body: some Scene {
        WindowGroup {
            FoodSearch()
        }
    }
}
