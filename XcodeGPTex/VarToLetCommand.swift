//
//  SourceEditorCommand.swift
//  XcodeGPTex
//
//  Created by Daniel Munoz on 03.08.23.
//

import Foundation
import XcodeKit

class VarToLetCommand: NSObject, XCSourceEditorCommand {
    
    func perform(with invocation: XCSourceEditorCommandInvocation, completionHandler: @escaping (Error?) -> Void ) -> Void {
        defer { completionHandler(nil) }
        // NSMutableArray to [String]
        let lines = invocation.buffer.lines.compactMap { $0 as? String }

        lines.enumerated().forEach { index, line in
            // Replace var with let
            let updatedLine = line.replacingOccurrences(of: "var", with: "let")
            // Update the buffer line
            invocation.buffer.lines[index] = updatedLine
        }
    }
}
