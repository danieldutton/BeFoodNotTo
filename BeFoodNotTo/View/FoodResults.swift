import Foundation
import SwiftUI

struct FoodResults: View {
    
    @ObservedObject var viewModel: FoodResultsViewModel
        
    var body: some View {
        VStack {
            List(viewModel.establishments.establishments) { establishment in
                NavigationLink(destination: FoodDetails(viewModel: FoodDetailsViewModel()), label: {
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
