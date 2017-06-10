//
//  WindowController.swift
//  QRCodeScanner
//
//  Created by Srun Zhou on 2017/6/9.
//  Copyright © 2017年 Srun Zhou. All rights reserved.
//

import Cocoa

class WindowController: NSWindowController ,NSWindowDelegate{
    
    var image:NSImage?
    var context:CIContext?
    var viewController:ViewController?
    var windowID:CGWindowID?
    var frameRelativeToScreen:NSRect?
    

    
    override func windowDidLoad() {
        super.windowDidLoad()
        
        viewController = window?.contentViewController as? ViewController
        
    
        self.window?.level = Int(CGWindowLevelForKey(.floatingWindow))
        self.window?.level = Int(CGWindowLevelForKey(.maximumWindow))
        self.window?.isOpaque = false
        self.window?.backgroundColor = NSColor(calibratedWhite: 1.0, alpha: 0)
        context = CIContext()
    
    }
    
    
    func windowDidMove(_ notification: Notification) {
        print("I moved")
        
        windowID = UInt32(exactly: (self.window?.windowNumber)!)
        
        
        
        let mainDisplayBounds = CGDisplayBounds(CGMainDisplayID())
        var captureRect = NSRectToCGRect(window!.convertToScreen(NSRect(x: 0, y: 0, width: window!.frame.width, height: window!.frame.height)))
        
        captureRect.origin.y = mainDisplayBounds.height - captureRect.origin.y - captureRect.height
        
        let img = CGWindowListCreateImage(captureRect, CGWindowListOption.optionAll, windowID!, CGWindowImageOption.bestResolution)

            
        scanQRCode(image: NSImage(cgImage: img!, size: NSZeroSize))
    }
    
    
    func scanQRCode(image:NSImage) {
        let ciImage =  CIImage(cgImage:image.cgImage(forProposedRect: nil, context: nil, hints: nil)!)
        let ciDetector = CIDetector(ofType: CIDetectorTypeQRCode, context: context, options: nil)
        
        let features = ciDetector?.features(in: ciImage)
        
        
        if ((features?.count)! > 1){
            viewController?.resultTextField.string  = "Too many to Scan!!!"
            
        }else if (features?.count == 1) {
            for feature in features! {
                if feature.type == "QRCode" {
                    let aQRCodeFeature = feature as! CIQRCodeFeature
                    print(aQRCodeFeature.messageString!)
                    viewController?.resultTextField.string  = aQRCodeFeature.messageString!
                }
                return
            }
        }else {
            viewController?.resultTextField.string  = "Move to QRCode"
        }
        
    }

}
