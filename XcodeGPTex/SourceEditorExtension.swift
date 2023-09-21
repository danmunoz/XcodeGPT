//
//  SourceEditorExtension.swift
//  XcodeGPTex
//
//  Created by Daniel Munoz on 03.08.23.
//

import Foundation
import XcodeKit

class SourceEditorExtension: NSObject, XCSourceEditorExtension {
    
    func extensionDidFinishLaunching() {
        // Good place to set an audible breakpoint to make sure the extension was attached properly.
    }

    /*
    var commandDefinitions: [[XCSourceEditorCommandDefinitionKey: Any]] {
        // If your extension needs to return a collection of command definitions that differs from those in its Info.plist, implement this optional property getter.
        return []
    }
    */
    
}
