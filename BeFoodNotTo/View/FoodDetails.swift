import MapKit
import SwiftUI

struct FoodDetails: View {

    @ObservedObject var viewModel: FoodDetailsViewModel
    
    var body: some View {
        VStack {
            Map(coordinateRegion: .constant(MKCoordinateRegion(center: viewModel.establishmentDetail.latLong, span: MKCoordinateSpan(latitudeDelta: 0.0012, longitudeDelta: 0.0012))), interactionModes: [])
                
            Text(viewModel.establishmentDetail.businessName)
            Text(viewModel.establishmentDetail.addressLine4)
            Text(viewModel.establishmentDetail.postCode)
            Text(viewModel.establishmentDetail.phone)
            Text(viewModel.establishmentDetail.ratingValue)
            Form {
                Section(header: Text("Confidence In Management"), content: {
                    Text("\(viewModel.establishmentDetail.scores.confidenceInManagement)")
                })
                Section(header: Text("Hygiene"), content: {
                    Text("\(viewModel.establishmentDetail.scores.hygiene)")
                })
                Section(header: Text("Structural"), content: {
                    Text("\(viewModel.establishmentDetail.scores.structural)")
                })
            }
            //Text(viewModel.establishmentDetail.distance)
        }
    }
}

/*
struct FoodDetails_Previews: PreviewProvider {
    static var previews: some View {
        FoodDetails(establishmentDetail: establishmentDetail)
    }
}
*/
