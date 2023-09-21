//
//  ChatCompletionRequestData.swift
//  OpenAI-Integration
//
//  Created by Daniel Munoz on 21.07.23.
//

import Foundation

/// Enum representing OpenAI models.
enum OpenAIModel: String, Codable {
    case gpt3_5Turbo = "gpt-3.5-turbo"
    case gpt4 = "gpt-4"
}

/// Enum representing roles in a conversation.
enum OpenAIRole: String, Codable {
    case system
    case user
    case assistant
    case function
}

/// Struct representing data for a chat completion request.
struct ChatCompletionRequestData: Codable {
    /// The OpenAI model to use for generating chat completions.
    let model: OpenAIModel

    /// An array of messages exchanged in the chat.
    struct Message: Codable {
        /// The role of the sender of the message (e.g., user, assistant).
        let role: OpenAIRole

        /// The content of the message.
        let content: String
    }
    /// An array of chat messages.
    let messages: [Message]
}
