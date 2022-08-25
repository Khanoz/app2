//
//  HomeViewController.swift
//  app2
//
//  Created by Universidad Anahac on 22/08/22.
//

import UIKit

class HomeViewController: UIViewController {
    
    

    @IBOutlet weak var table_view: UITableView!
    /*let labels: [String] = ["login", "label"]
    let segues: [String] = ["homeToFacebook", "toLabel"]*/
    let data: [Segues] = [Segues(id: "login", segueId: "homeToFacebook"), Segues(id: "label", segueId: "toLabel")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        table_view.dataSource = self
        table_view.delegate = self
        // Do any additional setup after load ing the view.
    }
    /*override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == data.last?.segueId{
            let lnvw = segue.destination as? LoginNetflixViewController
            lnvw?.labelTitle = data.last?.id ?? ""
        }
    }*/
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension HomeViewController: UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = table_view.dequeueReusableCell(withIdentifier: "cell")
        if (cell == nil){
            cell = UITableViewCell()
        }
        let item = data[indexPath.row]
        cell?.textLabel?.text = item.id
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = data[indexPath.row]
        print("click: \(type(of: item))")
        performSegue(withIdentifier: item.segueId, sender: nil)
        //navigationController?.performSegue(withIdentifier: "homeToFacebook", sender: nil)
    }
    
}
/*
 blue: 9
 orange: 7
 yellow: 4
 green: 5
 red: 3
 brown: 4
*/
