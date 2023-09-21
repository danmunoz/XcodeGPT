//
//  NetworkService.swift
//  OpenAI-Integration
//
//  Created by Daniel Munoz on 19.07.23.
//

import Foundation

/**
 An enumeration representing network-related errors that can occur during API requests.

 - `invalidResponse`: An error indicating an invalid response received.
 - `failed(code:)`: An error indicating a failed request with a specific HTTP status code.
 - `invalidJSON(error:)`: An error indicating an issue with parsing JSON data.
 - `authentication`: An error indicating an authentication failure.
 - `serverError`: An error indicating a server-side error (HTTP status code 500).
 - `rateLimit`: An error indicating rate limiting (HTTP status code 429).
 - `engineOverload`: An error indicating engine overload (HTTP status code 503).
 - `missingApiKey`: An error indicating that an API key is missing.
 */
public enum NetworkError: Error {
    case invalidResponse
    case failed(code: Int)
    case invalidJSON(error: String)
    case authentication

    case serverError
    case rateLimit
    case engineOverload
    case missingApiKey
}

/**
 A class responsible for making network requests and handling responses.
 */
public final class NetworkService {
    /**
     Initializes a new instance of the `NetworkService` class.
     */
    public init() {}

    /**
     Performs an asynchronous network request and decodes the response to the specified type.

     - Parameters:
        - request: The `Request` instance representing the API request to be made.
        - apiKey: The API key to use for authentication.

     - Returns: A decoded object of the specified type.

     - Throws: An error of type `NetworkError` if the request or response encounters an issue.
     */
    func performRequest<T: Decodable>(_ request: Request, apiKey: String) async throws -> T {

        var urlRequest = request.urlRequest
        urlRequest.addValue("Bearer \(apiKey)", forHTTPHeaderField: "Authorization")

        let (data, response) = try await URLSession(configuration: .default).data(for: urlRequest)
        guard let httpResponse = response as? HTTPURLResponse else {
            throw NetworkError.invalidResponse
        }

        switch httpResponse.statusCode {
        case 200..<300:
            do {
                return try JSONDecoder().decode(T.self, from: data)
            } catch {
                throw NetworkError.invalidJSON(error: error.localizedDescription)
            }
        case 401:
            throw NetworkError.authentication
        case 429:
            throw NetworkError.rateLimit
        case 500:
            throw NetworkError.serverError
        case 503:
            throw NetworkError.engineOverload
        default:
            throw NetworkError.failed(code: httpResponse.statusCode)
        }
    }
}
