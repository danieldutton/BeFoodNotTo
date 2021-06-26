import Combine
import Foundation

struct SearchParams {
    
}

class URLBuilder {
    func buildURLUsing(searchParams: SearchParams) -> URL {
        return URL(string: "")!
    }
}

class EstablishmentsService {
    //will need failure type in due course
    func getEstablishments() -> AnyPublisher<Establishments, Never> {
        //to play with for now
        let url = URL(string: "https://api.ratings.food.gov.uk/Establishments?latitude=53.9086163&longitude=-3.0474559&maxDistance=2")!
        
        var request = URLRequest(url: url)
        request.addValue("2", forHTTPHeaderField: "x-api-version")
        
        return URLSession.shared.dataTaskPublisher(for: request)
            .receive(on: DispatchQueue.global())
            .map(\.data)
            //.handleEvents(receiveOutput: {print($0)})
            .decode(type: Establishments.self, decoder: JSONDecoder())
            .replaceError(with: Establishments(establishments: []))
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}

class EstablishmentDetailService {
    //will need failure type in due course
    func getEstablishmentDetails(fhrsid: Int) -> AnyPublisher<EstablishmentDetail, Never> {
        //to play with for now
        //ishttp so might need transport info.plist addition
        let url = URL(string: "http://api.ratings.food.gov.uk/establishments/\(fhrsid)")!
        
        var request = URLRequest(url: url)
        request.addValue("2", forHTTPHeaderField: "x-api-version")
        
        return URLSession.shared.dataTaskPublisher(for: request)
            .receive(on: DispatchQueue.global())
            .map(\.data)
            //.handleEvents(receiveOutput: {print($0)})
            .decode(type: EstablishmentDetail.self, decoder: JSONDecoder())
            .replaceError(with: establishmentDetail)
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
