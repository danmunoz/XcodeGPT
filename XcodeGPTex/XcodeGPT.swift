//
//  XcodeGPT.swift
//  OpenAI-Integration
//
//  Created by Daniel Munoz on 25.07.23.
//

import Foundation

/**
 A class representing an Xcode-specific interface to interact with OpenAI's GPT model.

 The `XcodeGPT` class utilizes an instance of `OpenAIService` to process code-related prompts and obtain responses.
 */
final class XcodeGPT {
    private let openAIService: OpenAIService

    /**
     Initializes a new instance of the `XcodeGPT` class.
     */
    init(openAIService: OpenAIService = OpenAIService()) {
        self.openAIService = openAIService
    }

    /**
     Processes code based on the specified prompt type and input string asynchronously.

     - Parameters:
        - promptType: The type of prompt to use (e.g., `system`, `user`, `assistant`).
        - input: The input string to be used as a code prompt.

     - Returns: A processed string response based on the input and prompt type.

     - Throws: An error if processing the code prompt or response encounters an issue.
     */
    func processCode(for promptType: PromptType, input: String) async throws -> String {
        let prompt = promptType.getText(for: input)
        let response = try await openAIService.performRequest(for: prompt, promptType: promptType)
        return try processResponse(response)
    }

    /**
     Processes the response from the OpenAI service and extracts the content from the first choice.

     - Parameters:
        - response: The `ChatCompletionResponse` containing the response choices.

     - Returns: The content of the first choice in the response.

     - Throws: An error if the response is missing or encounters an issue.
     */
    private func processResponse(_ response: ChatCompletionResponse) throws -> String {
        guard let choice = response.choices.first else { throw OpenAIError.missingResponse }
        return choice.message.content
    }
}

/**
 An enumeration representing custom errors related to OpenAI interactions.

 - `missingResponse`: An error indicating that the OpenAI response is missing.
 */
enum OpenAIError: Error {
    case missingResponse
}

