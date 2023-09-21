//
//  Endpoint.swift
//  OpenAI-Integration
//
//  Created by Daniel Munoz on 25.07.23.
//

import Foundation

/**
 A structure representing an API endpoint.

 An endpoint consists of a path and optional query items for constructing URLs.
 */
struct Endpoint {
    /// The path component of the API endpoint.
    var path: String

    /// An optional array of query items to include in the URL.
    var queryItems: [URLQueryItem]?

    /**
     Initializes an Endpoint with the specified path and optional query items.

     - Parameters:
        - path: The path component of the API endpoint.
        - queryItems: An optional array of query items to include in the URL. Default is `nil`.
     */
    init(path: String, queryItems: [URLQueryItem]? = nil) {
        self.path = path
        self.queryItems = queryItems
    }
}

extension Endpoint {
    /**
     Constructs a URL using the endpoint's path and optional query items.

     - Returns: A URL constructed from the endpoint's components.
     */
    var url: URL {
        var components = baseURLComponents
        components.path = path
        components.queryItems = queryItems

        guard let url = components.url else {
            preconditionFailure("Invalid URL components: \(components)")
        }
        return url
    }

    /// Returns the base URL components for the OpenAI API.
    var baseURLComponents: URLComponents {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.openai.com"
        return components
    }
}

extension Endpoint {
    /// Represents an API endpoint for chat completions.
    static var completions: Self {
        Endpoint(path: "/v1/chat/completions")
    }
}
