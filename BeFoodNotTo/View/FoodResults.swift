import Foundation
import SwiftUI

struct FoodResults: View {
    
    let establishments = Establishments(establishments: [
        Establishment(fhrsid: 1, localAuthorityBusinessID: "", businessName: "Business 1", businessType: "Takeaway", ratingValue: "5", ratingDate: "date"),
        Establishment(fhrsid: 2, localAuthorityBusinessID: "", businessName: "Business 2", businessType: "Takeaway", ratingValue: "5", ratingDate: "date"),
        Establishment(fhrsid: 3, localAuthorityBusinessID: "", businessName: "Business 3", businessType: "Takeaway", ratingValue: "5", ratingDate: "date"),
        Establishment(fhrsid: 4, localAuthorityBusinessID: "", businessName: "Business 4", businessType: "Takeaway", ratingValue: "5", ratingDate: "date"),
        Establishment(fhrsid: 5, localAuthorityBusinessID: "", businessName: "Business 5", businessType: "Takeaway", ratingValue: "5", ratingDate: "date"),
        Establishment(fhrsid: 6, localAuthorityBusinessID: "", businessName: "Business 6", businessType: "Takeaway", ratingValue: "5", ratingDate: "date"),
        Establishment(fhrsid: 7, localAuthorityBusinessID: "", businessName: "Business 7", businessType: "Takeaway", ratingValue: "5", ratingDate: "date"),
    ])
        
    var body: some View {
        VStack {
            List(establishments.establishments) { establishment in
                NavigationLink(destination: FoodDetails(), label: {
                    Text(establishment.businessName)
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
