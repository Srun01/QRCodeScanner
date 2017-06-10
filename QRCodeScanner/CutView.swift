//
//  CutView.swift
//  QRCodeScanner
//
//  Created by Srun Zhou on 2017/6/9.
//  Copyright © 2017年 Srun Zhou. All rights reserved.
//

import Cocoa

class CutView: NSView {

    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)
        NSColor.windowBackgroundColor.set()
        NSRectFill(dirtyRect)
    }
    
    
}
