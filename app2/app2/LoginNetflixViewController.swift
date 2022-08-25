//
//  LoginNetflixViewController.swift
//  app2
//
//  Created by Universidad Anahac on 24/08/22.
//

import UIKit

class LoginNetflixViewController: UIViewController {

    //var labelTitle: String = ""
    let checkedImage = UIImage(named: "checked")! as UIImage
    let uncheckedImage = UIImage(named: "checkbox")! as UIImage
    @IBOutlet weak var checkbox: UIImageView!
    var rememberMeBool = false
    @IBAction func rememberMe(_ sender: Any) {
        rememberMeBool = !rememberMeBool
        switch (rememberMeBool){
            case true:
                print("hola")
                checkbox.image = checkedImage
                break
            case false:
                checkbox.image = uncheckedImage
                break
            default:
                break
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        //label.text = self.labelTitle
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
