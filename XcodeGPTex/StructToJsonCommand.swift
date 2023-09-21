//
//  StructToJsonCommand.swift
//  XcodeGPTex
//
//  Created by Daniel Munoz on 21.05.23.
//

import Foundation
import XcodeKit

class StructToJsonCommand: NSObject, XCSourceEditorCommand {

    func perform(with invocation: XCSourceEditorCommandInvocation, completionHandler: @escaping (Error?) -> Void ) -> Void {
        let code = selectedCode(from: invocation.buffer) ?? invocation.buffer.completeBuffer
        Task {
            if let response = try? await XcodeGPT().processCode(for: .jsonFromStruct, input: code) {
                invocation.buffer.completeBuffer.append("\n\n\(response)")
            }
            completionHandler(nil)
        }
    }
}

public extension XCSourceEditorCommand {
    func selectedCode(from buffer: XCSourceTextBuffer) -> String? {
        var text: String?
        for case let range as XCSourceTextRange in buffer.selections {
            for lineNumber in range.start.line...range.end.line {
                if lineNumber < buffer.lines.count {
                    guard let line = buffer.lines[lineNumber] as? String else { return nil }
                    text?.append(line)
                }
            }
        }
        return text?.trimmingCharacters(in: .whitespacesAndNewlines)
    }
}
