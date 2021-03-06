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
        //latitude
        //longitide
        //maxDistanceLimit
        //businessTypeId
        //schemeTypeKey - FHRS or FHIS
        //ratingKey - 0,1,2,3,4,5 - FHIS= 'Pass', 'ImprovementRequired', 'AwaitingPublication', 'AwaitingInspection', 'Exempt'
        //ratingOperatorKey - 'LessThanOrEqual', 'GreaterThanOrEqual' and 'Equal',  Default val is equal.  These only work on FHRS
        //countryId
        let url = URL(string: "https://api.ratings.food.gov.uk/Establishments?latitude=53.9086163&longitude=-3.0474559&maxDistance=2&BusinessTypeId=7844&sortOptionKey=distance")!
        //-1 all
        //7-distributors/transporters
        //7838-farmers/growers
        //5-Hospitals/Childcare/Caring Premises
        //7842-Hotel/bed & breakfast/guest house
        //14-Importers/Exporters
        //7839-Manufacturers/packers
        //7847-Mobile caterers
        //7841-Other catering premises
        //7843-Pub/bar/nightclub
        //1 restaurant cafe canteen
        //4613- Retailers - other
        //7840- Retailers - supermarkets/hypermarkets
        //7845-School/college/university
        //7844 - Takeaway/sandwich shop
        var request = URLRequest(url: url)
        request.addValue("2", forHTTPHeaderField: "x-api-version")
        
        return URLSession.shared.dataTaskPublisher(for: request)
            .receive(on: DispatchQueue.global())
            .map(\.data)
            //.handleEvents(receiveOutput: {print($0)})
            .decode(type: Establishments.self, decoder: JSONDecoder())
            .replaceError(with: Establishments(establishments: []))
            .eraseToAnyPublisher()
    }
}
