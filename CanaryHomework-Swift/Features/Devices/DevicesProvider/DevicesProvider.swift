//
//  DevicesProvider.swift
//  CanaryHomework-Swift
//
//  Created by Stanley Delacruz on 6/9/20.
//  Copyright © 2020 Stanle Delacruz. All rights reserved.
//

import Foundation

/// The devices provider. Handles all network request related to getting devices.
final class DevicesProvider: DevicesProviding {
    
    // MARK: - Properties
    
    private let client: NetworkClientProtocol
    
    // MARK: - Initializers
    
    init(_ client: NetworkClientProtocol) {
        self.client = client
    }
    
    // MARK: - Public Functions
    
    func getDevices(_ completion: @escaping (Result<[Device], NetworkError>) -> Void) {
        client.request(parameters: nil, requestType: .devices) { result in
            switch result {
            case .success(let data):
                do {
                    let devices = try JSONDecoder().decode(Array<Device>.self, from: data)
                    completion(.success(devices))
                } catch let jsonError {
                    print(jsonError)
                    completion(.failure(NetworkError.unknownError(text: Strings.parseDataErrorMessage)))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
