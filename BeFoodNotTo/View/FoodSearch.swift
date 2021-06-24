import SwiftUI

struct FoodSearch: View {
    
    var body: some View {
        NavigationView {
            VStack {
                Text("FoodSearch")
                NavigationLink(destination: FoodResults(), label: {
                    Text("Do Something")
                })
                Button(action: {
                    //update user location
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
