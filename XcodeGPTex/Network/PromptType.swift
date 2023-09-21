//
//  PromptType.swift
//  OpenAI-Integration
//
//  Created by Daniel Munoz on 21.07.23.
//

import Foundation

public enum PromptType: String {
    case codableFromJson
    case jsonFromStruct
    case unitTest
    case codeAnalysis
    case customInstruction
    case addDocumentation
    case findBug

    public func getText(for input: String) -> String {
        switch self {
        case .codableFromJson:
            return "Generate a Swift struct that conforms to the Codable protocol based on the given JSON. The names of the properties within the generated Swift struct should use camel-case formatting and CodingKeys should be used if needed. Make sure to return only the Swift code, no explanation is required. \n\(input)"
        case .jsonFromStruct:
            return "Generate a JSON file with three objects for the given Swift struct. Only respond with the json file, no explanation is required:\n\(input)"
        case .unitTest:
            return "Write unit tests for the given Swift code:\n\(input)\nOnly respond with the code, no explanation is needed."
        case .codeAnalysis:
            return "Analyze this Swift code and provide suggestions on how to improve it: \(input)"
        case .customInstruction:
            return "\(input)"
        case .addDocumentation:
            return "Add in-line documentation to the following Swift code. Make sure to use Swift-flavored Markdown for the documentation. No explanation required:\n\(input)"
        case .findBug:
            return "Find bugs in the provided Swift code, provide an explanation and a proposed fix."
        }
    }
}
