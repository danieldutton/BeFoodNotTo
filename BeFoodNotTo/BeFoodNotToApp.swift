import Combine
import SwiftUI

@main
struct BeFoodNotToApp: App {
    private var subscriptions = Set<AnyCancellable>()
    
    init() {
        
    }
    
    var body: some Scene {
        WindowGroup {
            FoodSearch()
        }
    }
}
