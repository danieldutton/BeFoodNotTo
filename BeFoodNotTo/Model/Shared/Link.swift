import Foundation

struct Link: Codable {
    let rel: Rel
    let href: String
}

extension Link {
    var url: URL {
        URL(string: href)!
    }
}
