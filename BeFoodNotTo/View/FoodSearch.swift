import SwiftUI

struct FoodSearch: View {
    
    @StateObject var viewModel = FoodSearchViewModel()
    @State private var launchPreferences = false
    
    var body: some View {
        NavigationView {
            VStack {
                Text("FoodSearch")
                NavigationLink(destination: FoodResults(viewModel: FoodResultsViewModel()), label: {
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
        .navigationViewStyle(StackNavigationViewStyle())
    }
    
    private var previewEstablishments: Establishments {
        Establishments(establishments: [
            Establishment(fhrsid: 1, localAuthorityBusinessID: "", businessName: "Business 1", businessType: "Takeaway", ratingValue: "5", ratingDate: "date"),
            Establishment(fhrsid: 2, localAuthorityBusinessID: "", businessName: "Business 2", businessType: "Takeaway", ratingValue: "5", ratingDate: "date"),
            Establishment(fhrsid: 3, localAuthorityBusinessID: "", businessName: "Business 3", businessType: "Takeaway", ratingValue: "5", ratingDate: "date"),
            Establishment(fhrsid: 4, localAuthorityBusinessID: "", businessName: "Business 4", businessType: "Takeaway", ratingValue: "5", ratingDate: "date"),
            Establishment(fhrsid: 5, localAuthorityBusinessID: "", businessName: "Business 5", businessType: "Takeaway", ratingValue: "5", ratingDate: "date"),
            Establishment(fhrsid: 6, localAuthorityBusinessID: "", businessName: "Business 6", businessType: "Takeaway", ratingValue: "5", ratingDate: "date"),
            Establishment(fhrsid: 7, localAuthorityBusinessID: "", businessName: "Business 7", businessType: "Takeaway", ratingValue: "5", ratingDate: "date"),
        ])
    }
}

struct FoodSearch_Previews: PreviewProvider {
    static var previews: some View {
        FoodSearch()
    }
}
