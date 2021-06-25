import SwiftUI

struct FoodPreferences: View {
    @State private var colors = ["Red", "Green", "Blue"]
    
    var body: some View {
        Form {
            Section(header: Text("Distance"), content: {
                Text("Hello Section")
            })
        }
    }
}

struct FoodPreferences_Previews: PreviewProvider {
    static var previews: some View {
        FoodPreferences()
    }
}
