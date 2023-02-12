//
//  Readjsonfile.swift
//  BetTips
//
//  Created by chandni chaudhari on 12/02/23.
//
import Foundation
struct DataFromServer: Codable {
    let feedList: [FeedItem]
}
struct FeedItem: Codable {
    let userId: Int
    let email: String?
    let message: String?
}

func getFeedList() -> [FeedItem] {
    var array = [FeedItem]()
    if let jsonData = readFromLocal() {
        if let response = parse(jsonData) {
            array = response.feedList
        }
    }
    return array
}

func readFromLocal() -> Data? {
    do {
        if let filename = Bundle.main.path(forResource: "json-data", ofType: "json") {
            let dataFromFile = try String(contentsOfFile: filename).data(using: .utf8)
            return dataFromFile
        }
    } catch {
        print(error)
    }
    return nil
}

func parse(_ jsonData: Data) -> DataFromServer? {
    do {
        let decodedData = try JSONDecoder().decode(DataFromServer.self,
                                                   from: jsonData)
        return decodedData
    } catch {
        print("decode error")
    }
    return nil
}

