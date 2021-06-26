import Combine
import Foundation

class SortOptionsService {
    //will need failure type in due course
    func getSortOptions() -> AnyPublisher<SortOptions, Never> {
        //to play with for now
        let url = URL(string: "https://api.ratings.food.gov.uk/SortOptions")!
        
        var request = URLRequest(url: url)
        request.addValue("2", forHTTPHeaderField: "x-api-version")
        
        return URLSession.shared.dataTaskPublisher(for: request)
            .receive(on: DispatchQueue.global())
            .map(\.data)
            .handleEvents(receiveOutput: {print($0)})
            .decode(type: SortOptions.self, decoder: JSONDecoder())
            .replaceError(with: SortOptions(sortOptions: []))
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
