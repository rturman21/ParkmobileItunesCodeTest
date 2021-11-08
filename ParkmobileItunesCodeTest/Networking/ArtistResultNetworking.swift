//
//  ArtistResultNetworking.swift
//  itunesCodeTest
//
//  Created by Robert Turman on 11/1/21.
//

import Foundation


///A class that handles the success or failure of a url request
class ArtistResultNetworking {
    typealias resultsHandler = (Result<Results, Error>) -> Void
    
    func search(searchTerm: String?, completionHandler: @escaping resultsHandler) {
        guard let searchTerm = searchTerm, let
                url = URL(string: "https://itunes.apple.com/search?term=\(searchTerm)") else {
            return completionHandler(.failure(URLError(.badURL)))
        }
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { data, _, error in
            do {
                guard let data = data, error == nil else { return }
                let decoder = JSONDecoder()
                let results = try decoder.decode(Results.self, from: data)
                
                completionHandler(.success(results))
            } catch {
                completionHandler(.failure(error))
            }
        }.resume()
    }
}
