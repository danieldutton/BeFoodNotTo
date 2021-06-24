import SwiftUI

struct FoodSearch: View {
    
    @StateObject var viewModel = FoodSearchViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                Text("FoodSearch")
                NavigationLink(destination: FoodResults(), label: {
                    Text("Do Something")
                })
                Button(action: {
                    viewModel.getUserLocation()
                }, label: {
                    Text("Get Location")
                })
                Text(viewModel.user.streetName)
                Text(viewModel.user.town)
                Text(viewModel.user.country)
                
                Text(viewModel.user.latLong.lat)
                Text(viewModel.user.latLong.long)
            }
        }
    }
}

struct FoodSearch_Previews: PreviewProvider {
    static var previews: some View {
        FoodSearch()
    }
}
