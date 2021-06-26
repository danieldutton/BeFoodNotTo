import SwiftUI

struct FoodSearch: View {
    
    @StateObject var viewModel = FoodSearchViewModel()
    private var businessTypes = ["Red", "Green", "Blue"]
    private var maxDistanceMiles = ["100", "2", "3", "4", "5", "6", "7", "8", "9", "10", "15", "20"]
    
    @State private var selectedBusinessType = "Red"
    @State private var selectedMaxDistanceMiles = "1"
    
    @State private var locationObtained = false
    
    var body: some View {
        NavigationView {
            VStack {
                Button(action: {
                    viewModel.getUserLocation()
                }, label: {
                    Image(systemName: "location.circle.fill")
                        .font(.system(size: 260))
                        .foregroundColor(Color("Dark_Green"))
                })
                Text(viewModel.user.streetName)
                Text(viewModel.user.town)
                Form {
                    Picker("Business Type", selection: $selectedBusinessType) {
                        ForEach(businessTypes, id: \.self) {
                            Text($0)
                        }
                    }
                    Picker("Max Distance", selection: $selectedMaxDistanceMiles) {
                        ForEach(maxDistanceMiles, id: \.self) {
                            Text($0)
                        }
                    }
                    Picker("Sort By", selection: $selectedBusinessType) {
                        ForEach(businessTypes, id: \.self) {
                            Text($0)
                        }
                    }
                }
                Button(action: {
                    //call viewModel and search
                }, label: {
                    NavigationLink(destination: FoodResults(viewModel: FoodResultsViewModel()), label: {
                        Text("Search")
                    })
                })
                
                //.disabled(locationObtained == false)
                
            }
            .background(Color("Light_Green"))
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .edgesIgnoringSafeArea(.all)
    }
    
    private var previewEstablishments: Establishments {
        Establishments(establishments: [
            Establishment(fhrsid: 1, localAuthorityBusinessID: "", businessName: "Business 1", businessType: "Takeaway", ratingValue: "5", ratingDate: "date", links: []),
            Establishment(fhrsid: 2, localAuthorityBusinessID: "", businessName: "Business 2", businessType: "Takeaway", ratingValue: "5", ratingDate: "date", links: []),
            Establishment(fhrsid: 3, localAuthorityBusinessID: "", businessName: "Business 3", businessType: "Takeaway", ratingValue: "5", ratingDate: "date", links: []),
            Establishment(fhrsid: 4, localAuthorityBusinessID: "", businessName: "Business 4", businessType: "Takeaway", ratingValue: "5", ratingDate: "date", links: []),
            Establishment(fhrsid: 5, localAuthorityBusinessID: "", businessName: "Business 5", businessType: "Takeaway", ratingValue: "5", ratingDate: "date", links: []),
            Establishment(fhrsid: 6, localAuthorityBusinessID: "", businessName: "Business 6", businessType: "Takeaway", ratingValue: "5", ratingDate: "date", links: []),
            Establishment(fhrsid: 7, localAuthorityBusinessID: "", businessName: "Business 7", businessType: "Takeaway", ratingValue: "5", ratingDate: "date", links: []),
        ])
    }
    
}

struct FoodSearch_Previews: PreviewProvider {
    static var previews: some View {
        FoodSearch()
    }
}
