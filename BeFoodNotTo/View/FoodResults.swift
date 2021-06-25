import Foundation
import SwiftUI

struct FoodResults: View {
    
    let establishments: Establishments
        
    var body: some View {
        VStack {
            List(establishments.establishments) { establishment in
                NavigationLink(destination: FoodDetails(establishmentDetail: establishmentDetail), label: {
                    Text(establishment.businessName)
                    Spacer()
                    Text(establishment.ratingValue)
                })
            }
        }
    }
}

struct FoodResults_Previews: PreviewProvider {
    static var previews: some View {
        FoodSearch()
    }
}
