//
//  PokemonInfoViewController.swift
//  app2
//
//  Created by Universidad Anahac on 31/08/22.
//

import UIKit

struct PokemonInfo: Decodable{
    var base_experience: Int
    var height: Int
    var name: String
    var sprites: PokemonInfoSprite
}

struct PokemonInfoSprite: Decodable{
    var other: PokemonInfoOther
}

struct PokemonInfoOther : Decodable{
    var home: PokemonInfoHome
}

struct PokemonInfoHome: Decodable{
    var front_default: String
}

class PokemonInfoViewController: UIViewController {

    @IBOutlet weak var pokemon_name: UILabel!
    @IBOutlet weak var pokemon_image: UIImageView!
    var s : String = "a"
    var url: String = "b"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(s)
        print(url)
        loadPokemon()
        // Do any additional setup after loading the view.
    }
    
    func loadPokemon(){
        if true{
            let task = URLSession.shared.dataTask(with: URL(string: url)!) {data, response, error in
                let pokemonInfo = try! JSONDecoder().decode(PokemonInfo.self, from: data!)
                print(pokemonInfo)
                DispatchQueue.main.sync {
                    self.pokemon_name.text = pokemonInfo.name
                }
                self.loadPokemonImage(urlImage: pokemonInfo.sprites.other.home.front_default)
            }
            task.resume()
        }
    }
    func loadPokemonImage(urlImage: String){
        let task = URLSession.shared.dataTask(with: URL(string: urlImage)!) {data, response, error in
            if let data = data {
                let image = UIImage.init(data: data)
                DispatchQueue.main.sync {
                    self.pokemon_image.image = image
                }
            }
        }
        task.resume()
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
