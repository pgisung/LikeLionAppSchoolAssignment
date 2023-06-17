//
//  AppDelegate.swift
//  HelloAppKit
//
//  Created by JOHNNY_MAC_1 on 2023/06/09.
//

import Cocoa

@main
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet var window: NSWindow!
    
    @IBOutlet weak var nameTextField: NSTextField!
    
    @IBOutlet weak var helloLabel: NSTextField!
    
    let speechSynth = NSSpeechSynthesizer()

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }

    func applicationSupportsSecureRestorableState(_ app: NSApplication) -> Bool {
        return true
    }
    
    @IBAction func sayIt(_ sender: NSButton) {
        let name: String = nameTextField.stringValue
        let message: String = "\(name)"
        
        helloLabel.stringValue = message
        
        speechSynth.startSpeaking(message)
    }
    
    @IBAction func stopIt(_ sender: NSButton) {
        speechSynth.stopSpeaking()
    }
}

