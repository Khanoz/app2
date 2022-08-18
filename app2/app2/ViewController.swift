//
//  ViewController.swift
//  app2
//
//  Created by Universidad Anahac on 17/08/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var view_txt_pass: UIView!
    @IBOutlet weak var img_logo: UIImageView!
    @IBOutlet weak var text_email: UITextField!
    @IBOutlet weak var text_password: UITextField!
    @IBOutlet weak var text_view: UITextView!
    @IBAction func btn_read(_ sender: Any) {
        text_view.text = text_email.text!+":"+text_password.text!
    }
    
    @IBAction func btn_create_acc(_ sender: Any) {
        text_view.text = "se creo la cuenta"
    }
    @IBOutlet weak var forgotten_password: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        img_logo.layer.cornerRadius = img_logo.layer.bounds.width/2
        img_logo.clipsToBounds = true
        view_txt_pass.layer.borderWidth = 1
        view_txt_pass.layer.borderColor = CGColor.init(red: 198/255, green: 198/255, blue: 198/255, alpha: 1)
        view_txt_pass.layer.cornerRadius = 16
    }


}

