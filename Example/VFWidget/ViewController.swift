//
//  ViewController.swift
//  VFWidget
//
//  Created by VideoForce on 03/05/2022.
//

import UIKit
import VFWidget

class ViewController: UIViewController {
    
    @IBOutlet weak var openWidgetBtn: UIButton!
    
    var widgetVC = VFWidget()
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        
        title = "VideoForce Widget"
    }
    
    @IBAction func openWidgetBtnAction(_ sender: UIButton) {
        widgetVC.model = VFWidgetModel(widgetId: "YOU-UUID-WIDGET")
        widgetVC.modalPresentationStyle = .pageSheet
        present(widgetVC, animated: true)
    }
    
 }

