//
//  NetworkManager.swift
//  Directory App
//
//  Created by Kacper Cichosz on 23/07/2022.
//

import Foundation

enum NetworkError: Error {
    case noDataAvailable
    case canNotProcessData
}

struct NetworkManager {
    public typealias ModelCompletionHandler<T: Codable> = (T?, Error?) -> Void
    
    public func downloadData <T: Decodable> (classType: T.Type,
                                             settingsKey: String,
                                             substitution: String?,
                                             completion: ((T?, [String: Any]?, Error?) -> Void)?) {
        guard let url = URL(string: "\(settingsKey)\(String(describing: substitution ?? nil))") else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            guard let data = data else {
                completion?(nil, nil, error)
                return
            }
            
            do {
                let jsonData = try JSONSerialization.data(withJSONObject: data, options: .fragmentsAllowed)
                let decodedData = try JSONDecoder().decode(classType.self, from: jsonData)
                DispatchQueue.main.async {
                    completion?(decodedData, nil, error)
                }
            } catch let decodeError {
                completion?(nil, nil, decodeError)
            }
        }.resume()
    }
}
