//
//  HttpMethod.swift
//  OpenAI-Integration
//
//  Created by Daniel Munoz on 25.07.23.
//

import Foundation

/**
 Enum representing HTTP methods for making API requests.

 The `HttpMethod` enum includes cases for GET and POST requests, with an associated body for POST requests.
 */
enum HttpMethod {
    /// Represents a GET HTTP request.
    case get

    /// Represents a POST HTTP request with an associated request body.
    case post(body: Body)

    /// Returns the string value of the HTTP method (e.g., "GET" or "POST").
    var value: String {
        switch self {
        case .get: return "GET"
        case .post: return "POST"
        }
    }
}

extension HttpMethod {
    /**
     Struct representing the body of a POST HTTP request.

     The body can contain data for the request, typically used for sending JSON payloads.
     */
    struct Body {
        /// The data to include in the request body.
        let data: Data?

        /**
         Creates a JSON body for the POST request with the given Codable value.

         - Parameters:
            - value: The Codable value to encode as JSON data.

         - Returns: A `Body` instance containing the JSON-encoded data.
         */
        static func json<T>(_ value: T) -> Self where T: Codable {
            Body(data: try? JSONEncoder().encode(value))
        }
    }
}

