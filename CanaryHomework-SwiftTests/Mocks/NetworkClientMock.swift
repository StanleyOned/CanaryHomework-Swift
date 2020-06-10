//
//  NetworkClientMock.swift
//  CanaryHomework-SwiftTests
//
//  Created by Stanley Delacruz on 6/10/20.
//  Copyright © 2020 Stanle Delacruz. All rights reserved.
//

import Foundation
@testable import CanaryHomework_Swift

/// Mock class for the network client
final class NetworkClientMock: NetworkClientProtocol {
    
    // MARK: - Properties
    
    var urlString: String
    
    // MARK: - Initializer
    
    init(urlString: String) {
        self.urlString = urlString
    }
    
    // MARK: - Public Functions
    
    func request(parameters: [String : Any]?,
                 requestType: RequestDataType,
                 completion: @escaping (Result<Data, NetworkError>) -> Void) {
        guard !urlString.isEmpty else {
            completion(.failure(NetworkError.faultyURL))
            return
        }
        guard var components = URLComponents(string: urlString + requestType.endPointString) else {
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
        urlString = url.absoluteString
        completion(.success(Data()))
    }
}
