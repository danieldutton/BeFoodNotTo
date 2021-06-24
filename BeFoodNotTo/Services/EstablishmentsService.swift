import Combine
import Foundation

class EstablishmentsService {
    //will need failure type in due course
    func getEstablishments() -> AnyPublisher<Establishments, Error> {
        //to play with for now
        let url = URL(string: "https://api.ratings.food.gov.uk/Establishments/basic?latitude=53.9086163&longitude=-3.0474559&maxDistance=2")!
        
        var request = URLRequest(url: url)
        request.addValue("2", forHTTPHeaderField: "x-api-version")
        
        return URLSession.shared.dataTaskPublisher(for: request)
            .map(\.data)
            .handleEvents(receiveOutput: {print($0)})
            .decode(type: Establishments.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}