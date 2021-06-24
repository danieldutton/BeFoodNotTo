import Foundation

struct Meta: Codable {
    let dataSource, extractDate: String
    let itemCount: Int
    let returncode: String
    let totalCount, totalPages, pageSize, pageNumber: Int
}
