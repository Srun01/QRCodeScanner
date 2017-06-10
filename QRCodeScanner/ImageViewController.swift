//
//  ImageViewController.swift
//  QRCodeScanner
//
//  Created by Srun Zhou on 2017/6/9.
//  Copyright © 2017年 Srun Zhou. All rights reserved.
//

import Cocoa

class ImageViewController: NSViewController {

    @IBOutlet weak var imageView: NSImageView!
    
    var image:NSImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    
}
