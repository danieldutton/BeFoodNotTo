import SwiftUI

struct FoodSearch: View {
    
    @StateObject var viewModel = FoodSearchViewModel()
    @State private var launchPreferences = false
    
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
                //Text(viewModel.user.country)
                
                Text(viewModel.user.latLong.lat)
                Text(viewModel.user.latLong.long)
                
                Spacer()
                
                Button(action: {
                    launchPreferences.toggle()
                }, label: {
                    Text("Launch Preferences")
                })
                Button(action: {
                    //call viewModel and search
                }, label: {
                    Text("Perform Search")
                })
            }
            .sheet(isPresented: $launchPreferences, content: {
                FoodPreferences()
            })
        }
    }
}

struct FoodSearch_Previews: PreviewProvider {
    static var previews: some View {
        FoodSearch()
    }
}
