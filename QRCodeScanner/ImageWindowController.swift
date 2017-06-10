//
//  ImageWindowController.swift
//  QRCodeScanner
//
//  Created by Srun Zhou on 2017/6/9.
//  Copyright © 2017年 Srun Zhou. All rights reserved.
//

import Cocoa

class ImageWindowController: NSWindowController {
    var imageViewVC:ImageViewController?
    var image:NSImage?

    override func windowDidLoad() {
        super.windowDidLoad()
    
        imageViewVC = self.window?.contentViewController as? ImageViewController
    
        // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
    }

}
