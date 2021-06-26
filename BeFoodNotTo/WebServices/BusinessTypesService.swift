import Combine
import Foundation

class BusinessTypesService {
    func getBusinessTypes() -> AnyPublisher<BusinessTypes, Never> {
        //to play with for now
        let url = URL(string: "https://api.ratings.food.gov.uk/SortOptions")!
        
        var request = URLRequest(url: url)
        request.addValue("2", forHTTPHeaderField: "x-api-version")
        
        return URLSession.shared.dataTaskPublisher(for: request)
            .receive(on: DispatchQueue.global())
            .map(\.data)
            .handleEvents(receiveOutput: {print($0)})
            .decode(type: BusinessTypes.self, decoder: JSONDecoder())
            .replaceError(with: BusinessTypes(businessTypes: []))
            .eraseToAnyPublisher()
    }
}
