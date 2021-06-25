import MapKit
import SwiftUI

struct FoodDetails: View {
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275), span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))
    
    @ObservedObject var viewModel: FoodDetailsViewModel
    
    var body: some View {
        VStack {
            Map(coordinateRegion: .constant(MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275), span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))), interactionModes: [])
                .frame(width: 400, height: 300)
            Spacer()
            Text(viewModel.establishmentDetail.businessName)
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
