import MapKit
import SwiftUI

struct FoodDetails: View {
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275), span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))
    
    @ObservedObject var viewModel: FoodDetailsViewModel
    
    var body: some View {
        VStack {
            Map(coordinateRegion: .constant(MKCoordinateRegion(center: viewModel.establishmentDetail.latLong, span: MKCoordinateSpan(latitudeDelta: 0.0012, longitudeDelta: 0.0012))), interactionModes: [.all])
                .frame(width: 400, height: 300)
            
            Spacer()
            Text(viewModel.establishmentDetail.businessName)
            Text(viewModel.establishmentDetail.addressLine4)
            Text(viewModel.establishmentDetail.postCode)
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
