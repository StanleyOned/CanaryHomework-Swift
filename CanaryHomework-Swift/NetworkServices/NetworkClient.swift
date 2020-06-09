//
//  NetworkClient.swift
//  CanaryHomework-Swift
//
//  Created by Stanley Delacruz on 6/9/20.
//  Copyright © 2020 Stanle Delacruz. All rights reserved.
//

import Foundation

/// Network client class which handle all the network requests.
final class NetworkClient: NetworkClientProtocol {
    
    // MARK: - Properties

    private let session: URLSession
    private let urlString: String

    // MARK: - Initializer

    init(urlString: String) {
        self.urlString = urlString
        session = URLSession(configuration: .default)
    }

    // MARK: - Public Functions

    /// Network request.
    /// - Parameters:
    ///   - parameters: The given parameters
    ///   - completion: Completion handler that returns a Result Type
    func request(parameters: [String: Any]?,
                 requestType: RequestDataType,
                 completion: @escaping (Result<Data, NetworkError>) -> Void) {
        guard !urlString.isEmpty, var components = URLComponents(string: urlString + requestType.endPointString) else {
            completion(.failure(NetworkError.faultyURL))
            return
        }

        if let parameters = parameters {
            components.queryItems = parameters.map { key, value in
                URLQueryItem(name: key, value: "\(value)")
            }
        }

        guard let url = components.url else {
            completion(.failure(NetworkError.faultyURL))
            return
        }

        var request = URLRequest(url: url)
        request.addValue("\(giphyAPIKey)", forHTTPHeaderField: "api_key")
        send(request: request, completion: completion)
    }
    
    // MARK: - Private Functions

    private func send(request: URLRequest, completion: @escaping ((Result<Data, NetworkError>) -> Void)) {
        session.dataTask(with: request) { data, response, error in
            DispatchQueue.main.async {
                if let error = error {
                    completion(.failure(NetworkError.unknownError(text: error.localizedDescription)))
                    return
                }
                if let httpResponse = response as? HTTPURLResponse {
                    if (200 ... 299).contains(httpResponse.statusCode) {
                        if let data = data {
                            completion(.success(data))
                        } else {
                            completion(.failure(NetworkError.noData))
                        }
                    } else {
                        completion(.failure(NetworkError.connectionError(httpResponse.statusCode)))
                    }
                }
            }
        }.resume()
    }
}

