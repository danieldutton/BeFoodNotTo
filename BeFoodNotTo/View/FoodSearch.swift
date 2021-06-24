import SwiftUI

struct FoodSearch: View {
    
    var body: some View {
        NavigationView {
            VStack {
                Text("FoodSearch")
                NavigationLink(destination: FoodResults(), label: {
                    Text("Do Something")
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
