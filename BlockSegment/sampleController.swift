//
//  sampleController.swift
//  BlockSegment
//
//  Created by Jorel Cruz on 02/02/2018.
//

import Foundation
import UIKit

class sampleController: UIViewController {
    
    @IBOutlet weak var selector: BlockSegment!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        selector.blockColor = .purple
        selector.Items = BlockSegment.Items(text: ["",""], icon: [UIImage(named:"")!])
//            BlockSegment.Items(text: ["BANK","BANK","BANK","BANK","BANK"], icon: [UIImage(named:"Amount")!,UIImage(named:"Amount")!,UIImage(named:"Amount")!,UIImage(named:"Amount")!,UIImage(named:"Amount")!])
        
    }
}
