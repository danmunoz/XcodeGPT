//
//  Request.swift
//  OpenAI-Integration
//
//  Created by Daniel Munoz on 25.07.23.
//

import Foundation

/**
 A structure representing an API request.

 The `Request` struct includes the endpoint, HTTP method, and prompt type for making API requests. It also provides a
 computed property `urlRequest` that constructs a `URLRequest` with the necessary components.
 */
struct Request {
    /// The endpoint of the API request.
    let endpoint: Endpoint

    /// The HTTP method (GET or POST) for the request.
    let httpMethod: HttpMethod

    /// The type of prompt to use in the request (e.g., `system`, `user`, `assistant`).
    let promptType: PromptType

    /**
     A computed property that constructs a `URLRequest` based on the request's components.

     - Returns: A `URLRequest` instance ready to be used for making the API request.
     */
    var urlRequest: URLRequest {
        var urlRequest = URLRequest(url: endpoint.url)
        urlRequest.httpMethod = httpMethod.value
        urlRequest.allHTTPHeaderFields = defaultHeaders

        if case let .post(body) = httpMethod {
            urlRequest.httpBody = body.data
        }

        return urlRequest
    }

    // Default headers for the request, specifying the content type as JSON.
    private var defaultHeaders: [String: String] {
        ["Content-Type": "application/json"]
    }
}

