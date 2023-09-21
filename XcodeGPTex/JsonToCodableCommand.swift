//
//  JsonToCodableCommand.swift
//  XcodeGPTex
//
//  Created by Daniel Munoz on 21.05.23.
//

import Foundation
import XcodeKit

class JsonToCodableCommand: NSObject, XCSourceEditorCommand {

    func perform(with invocation: XCSourceEditorCommandInvocation, completionHandler: @escaping (Error?) -> Void ) -> Void {
        let code = selectedCode(from: invocation.buffer) ?? invocation.buffer.completeBuffer
        Task {
            if let response = try? await XcodeGPT().processCode(for: .codableFromJson, input: code) {
                invocation.buffer.completeBuffer.append("\n\n\(response)")
            }
            completionHandler(nil)
        }
    }
}
