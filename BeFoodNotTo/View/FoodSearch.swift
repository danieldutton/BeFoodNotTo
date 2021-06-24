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
            }
        }
    }
}

struct FoodSearch_Previews: PreviewProvider {
    static var previews: some View {
        FoodSearch()
    }
}
