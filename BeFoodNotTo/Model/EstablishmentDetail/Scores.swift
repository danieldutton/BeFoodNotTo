import Foundation

struct Scores: Codable {
    let hygiene, structural, confidenceInManagement: Int

    enum CodingKeys: String, CodingKey {
        case hygiene = "Hygiene"
        case structural = "Structural"
        case confidenceInManagement = "ConfidenceInManagement"
    }
}
