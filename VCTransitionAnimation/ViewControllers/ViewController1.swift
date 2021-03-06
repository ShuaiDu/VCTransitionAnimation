//
//  ViewController1.swift
//  VCTransitionAnimation
//
//  Created by renren on 15/9/11.
//  Copyright © 2015年 du. All rights reserved.
//

import UIKit

class ViewController1: UIViewController {
    
    var navigationDelegate : NavigationDelegate?

    /*
    let blockArray = NSMutableArray()
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        let block = { () -> Void in
            
        }
        blockArray.addObject(block)
    }
    */
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationDelegate = NavigationDelegate(navigationController: self.navigationController!)
        // Do any additional setup after loading the view.
        //let range = hello.rangeOfString("hello")
        
        var hello = "hello world"
        while let range1 = hello.rangeOfString("l") {
            hello = hello.stringByReplacingCharactersInRange(range1, withString: "")
        }
        print("result \(hello)")
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.addKeyboardNotification()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewWillDisappear(animated: Bool) {
        self.removeKeyboardNotification()
        super.viewWillDisappear(animated)
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if "pushSegue" == segue.identifier {
            self.navigationController?.delegate = self.navigationDelegate
        }
    }
    
    override func keyboardWillAppear(notification: NSNotification) {
        print("keyboardWillAppear")
    }

    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.textField.resignFirstResponder()
    }
}
