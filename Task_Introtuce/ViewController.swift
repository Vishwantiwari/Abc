//
//  ViewController.swift
//  Task_Introtuce
//
//  Created by Vishwan Tiwari on 12/05/21.
//

import UIKit

class ViewController: UIViewController {
    let secondvc = SecondViewController()
    let thirdvc = ThirdViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        setup()
        // Do any additional setup after loading the view.
    }
    private func setup(){
        
        
        addChild(secondvc)
        addChild(thirdvc)
        
        self.view.addSubview(secondvc.view)
        self.view.addSubview(thirdvc.view)
        
        secondvc.didMove(toParent: self)
        thirdvc.didMove(toParent: self)
        
        secondvc.view.frame = self.view.bounds
        thirdvc.view.frame = self.view.bounds
        thirdvc.view.isHidden = true



        
    }
    
   
    @IBOutlet weak var firstView: UIView!
    @IBOutlet weak var secondView: UIView!

    @IBAction func switchViews( sender:UISegmentedControl){
        if sender.selectedSegmentIndex==0 {
            firstView.alpha=1
            secondView.alpha=0
        }else{firstView.alpha=0
            secondView.alpha=1
        }
    }

    
}
