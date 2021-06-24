import Combine
import Foundation

class UserLocator {
    private var reverseGeocoder: ReverseGeocoder
    
    init(reverseGeocoder: ReverseGeocoder = ReverseGeocoder()) {
        self.reverseGeocoder = reverseGeocoder
    }
}
