import Combine
import Foundation
import SwiftUI

class FoodDetailsViewModel: ObservableObject {
    private var subscriptions = Set<AnyCancellable>()
    private var establishmentDetailService: EstablishmentDetailService
    
    @Published var establishmentDetail: EstablishmentDetail = getEstablishmentDetail()
    
    
    init(establishmentDetailService: EstablishmentDetailService = EstablishmentDetailService()) {
        self.establishmentDetailService = establishmentDetailService
        
        //possibly consider calling from onAppear (does it reload all the time
        getEstablishmentDetails()
    }
    
    func getEstablishmentDetails() {
        establishmentDetailService.getEstablishmentDetails(fhrsid: 1223)
            .assign(to: \.establishmentDetail, on: self)
            .store(in: &subscriptions)
    }
    
    private static func getEstablishmentDetail() -> EstablishmentDetail {
        EstablishmentDetail(fhrsid: 0, changesByServerID: 0, localAuthorityBusinessID: "", businessName: "", businessType: "", businessTypeID: 0, addressLine1: "", addressLine2: "", addressLine3: "", addressLine4: "", postCode: "", phone: "", ratingValue: "", ratingKey: "", ratingDate: "", localAuthorityCode: "", localAuthorityName: "", localAuthorityWebSite: "", localAuthorityEmailAddress: "", scores: Scores(hygiene: 0, structural: 0, confidenceInManagement: 0), schemeType: "", geocode: Geocode(longitude: "", latitude: ""), rightToReply: "", distance: nil, newRatingPending: false)
    }
}
