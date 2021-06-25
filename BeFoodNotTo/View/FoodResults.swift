import Foundation
import SwiftUI

struct FoodResults: View {
    
    let establishments = Establishments(establishments: [])
        
    var body: some View {
        VStack {
            Text("FoodResults")
            NavigationLink(destination: FoodDetails(), label: {
                Text("Do Something")
            })
        }
    }
}

struct FoodResults_Previews: PreviewProvider {
    static var previews: some View {
        FoodSearch()
    }
}
