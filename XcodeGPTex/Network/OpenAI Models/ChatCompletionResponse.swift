//
//  ChatCompletionResponse.swift
//  OpenAI-Integration
//
//  Created by Daniel Munoz on 21.07.23.
//

import Foundation

/// Represents a response from the Chat API, containing information about the completed chat session.
public struct ChatCompletionResponse: Codable {
    /// A unique identifier for the chat completion chunk.
    public let id: String

    /// The object type, which is always chat.completion.chunk.
    public let object: String

    /// The Unix timestamp (in seconds) of when the chat completion chunk was created.
    public let created: Int

    /// A list of chat completion choices. Can be more than one if n is greater than 1.
    public let choices: [Choice]

    /// Usage statistics for the chat completion response, including prompt tokens, completion tokens, and total tokens.
    public let usage: Usage
}

public extension ChatCompletionResponse {
    /// Represents a choice made during the chat session, containing the choice index, message content, and finish reason.
    struct Choice: Codable {
        /// The index of the choice in the list of choices.
        public let index: Int

        /// A chat completion message generated by the model.
        public let message: Message

        /// The reason the model stopped generating tokens. This will be `stop` if the model hit a natural stop point or a provided stop sequence, `length` if the maximum number of tokens specified in the request was reached, or `function_call` if the model called a function.
        public let finishReason: String

        private enum CodingKeys: String, CodingKey {
            case index, message
            case finishReason = "finish_reason"
        }
    }

    /// Represents a message in the chat session, containing the sender's role and the message content.
    struct Message: Codable {
        /// The role of the author of this message.
        public let role: String

        /// The content of the message.
        public let content: String

        /// The name and arguments of a function that should be called, as generated by the model.
        public let functionCall: FunctionCall?

        private enum CodingKeys: String, CodingKey {
            case role, content
            case functionCall = "function_call"
        }
    }

    /// The name and arguments of a function that should be called, as generated by the model.
    struct FunctionCall: Codable {
        /// The name of the function to call.
        public let name: String

        /// The arguments to call the function with, as generated by the model in JSON format. Note that the model does not always generate valid JSON, and may hallucinate parameters not defined by your function schema. Validate the arguments in your code before calling your function.
        public let arguments: String
    }

    /// Represents usage statistics for the chat session, including prompt tokens, completion tokens, and total tokens.
    struct Usage: Codable {
        /// The number of tokens used in the prompt.
        public let promptTokens: Int

        /// Number of tokens in the generated completion.
        public let completionTokens: Int

        /// The total number of tokens used in the chat session (prompt + completion).
        public let totalTokens: Int

        private enum CodingKeys: String, CodingKey {
            case promptTokens = "prompt_tokens"
            case completionTokens = "completion_tokens"
            case totalTokens = "total_tokens"
        }
    }
}