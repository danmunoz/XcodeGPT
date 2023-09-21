//
//  OpenAIService.swift
//  OpenAI-Integration
//
//  Created by Daniel Munoz on 21.07.23.
//

import Foundation

/**
 A class responsible for interacting with the OpenAI service to perform chat completions.

 The `OpenAIService` class uses the provided `NetworkService` to make API requests and performs chat completions
 based on user prompts.
 */
public final class OpenAIService {
    private let networkService: NetworkService

    // Lazily initializes the API key by attempting to read it from an environment file.
    private lazy var apiKey: String = getApiKey()

    /**
     Initializes a new instance of the `OpenAIService` class.

     - Parameters:
        - networkService: An optional `NetworkService` instance used for making API requests.
                           Default is a new instance of `NetworkService`.
     */
    public init(networkService: NetworkService = NetworkService()) {
        self.networkService = networkService
    }

    /**
     Performs an asynchronous API request to get a chat completion response based on a user prompt.

     - Parameters:
        - prompt: The user's input prompt as a string.
        - promptType: The type of prompt to use, which can be `system`, `user`, or `assistant`.

     - Returns: A `ChatCompletionResponse` containing the completion response from the OpenAI service.

     - Throws: An error if the API request or response encounters an issue.
     */
    public func performRequest(for prompt: String, promptType: PromptType) async throws -> ChatCompletionResponse {
        let completionData = ChatCompletionRequestData(
            model: .gpt3_5Turbo,
            messages: [
                .init(role: .system, content: "You are a helpful coding assistant. You help with Swift code."),
                .init(role: .user, content: prompt)
            ]
        )
        let request = Request(endpoint: .completions, httpMethod: .post(body: .json(completionData)), promptType: promptType)

        return try await networkService.performRequest(request, apiKey: apiKey)
    }
}

private extension OpenAIService {
    /**
     Attempts to retrieve the API key from an environment file.

     - Returns: The API key as a string if found, or `nil` if not found or an error occurs.
     */
    func getApiKey() -> String {
        guard 
            let keyURL = Bundle.main.url(forResource: "apikey", withExtension: "env"),
            let key = try? String(contentsOf: keyURL, encoding: .utf8)
        else {
            preconditionFailure("Couldn't find the API key. Make sure the key is defined in the apikey.env file.")
        }
        return key
    }
}
