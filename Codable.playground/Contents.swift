//: Playground - noun: a place where people can play

import UIKit

enum EpisodeType: String, Codable {
    case free
    case paid
}

struct Episode: Codable {
    var title: String
    var series: String
    var createdBy: String
    var type: EpisodeType
    var createdAt: Date
    var duration: Float
    var origin: Data
    var url: URL
    
    enum CodingKeys: String, CodingKey {
        case title
        case series
        case createdBy = "created_by"
        case type
        case createdAt = "created_at"
        case duration
        case origin
        case url
    }
}

let response = """
{
    "title": "How to parse JSON in swift 4",
    "series": "What's new in swift 4",
    "created_by": "Mars",
    "type": "free",
    "created_at": "2017-08-23T01:42:42Z",
    "duration": 6.5,
    "origin": "Ym94dWVpby5jb20=",
    "url": "boxueio.com"
}
"""

var data = response.data(using: .utf8)!
let decoder = JSONDecoder()
decoder.dateDecodingStrategy = .iso8601
decoder.dataDecodingStrategy = .base64
let episode = try! decoder.decode(Episode.self, from: data)
dump(episode)

let encoder = JSONEncoder()
encoder.outputFormatting = .prettyPrinted
encoder.dateEncodingStrategy = .iso8601
encoder.dataEncodingStrategy = .base64
data = try! encoder.encode(episode)
print(String(data: data, encoding: .utf8)!)

