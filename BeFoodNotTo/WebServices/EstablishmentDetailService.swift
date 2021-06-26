import Combine
import Foundation

class EstablishmentDetailService {
    //will need failure type in due course
    func getEstablishmentDetails(url: URL) -> AnyPublisher<EstablishmentDetail, Never> {
        //to play with for now
        //let url = URL(string: "http://api.ratings.food.gov.uk/establishments/\(fhrsid)")!
        
        var request = URLRequest(url: url)
        request.addValue("2", forHTTPHeaderField: "x-api-version")
        
        return URLSession.shared.dataTaskPublisher(for: request)
            .receive(on: DispatchQueue.global())
            .map(\.data)
            .handleEvents(receiveOutput: {print($0)})
            .decode(type: EstablishmentDetail.self, decoder: JSONDecoder())
            .replaceError(with: establishmentDetail)
            .eraseToAnyPublisher()
    }
}
