//
//  ViewController.swift
//  pokemon-app
//
//  Created by Liam O'Brien on 8/16/22.
//


import UIKit

class ViewController: UIViewController {
    
    private let showData: UIImageView = {
        let showData = UIImageView()
        showData.contentMode = .scaleAspectFill
        showData.backgroundColor = .white
        return showData
        
    }()
    
    
    private let button: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.setTitle("Choose Your Pokemon", for: .normal)
        button.setTitleColor(.black, for: .normal)
        return button
        
    }()
    
    
    private let textField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .white
        textField.placeholder = "Enter PokeDex Number"
        
        return textField
        
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemMint;
        
        view.addSubview(showData)
        
        showData.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
        
        showData.center = view.center
        
        view.addSubview(button)
        
        getData()
        
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        
        
        view.addSubview(textField)
        
    }
    
    @objc func buttonPressed() {
        getData()
    }
    
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        button.frame = CGRect(x: 20, y: view.frame.size.height-150-view.safeAreaInsets.bottom, width: view.frame.size.width-40, height: 55)
        
        
        textField.frame = CGRect(x: 20, y: view.frame.size.height-225-view.safeAreaInsets.bottom, width: view.frame.size.width-40, height: 55)
    }
    
    func getData() {
        let invalidPokemonAlert = UIAlertController(title: "Invalid Pokemon", message: "You have selected a Pokemon that is not in the Pokedex.", preferredStyle: .alert)

        let textFieldInput = textField.text
        
        let textFieldInputNumber = Int(textField.text!) ?? 0
        print(textFieldInputNumber)

        let urlString = "https://randompokemon.com/sprites/png/normal/"
        
        let urlStringFinal = urlString + textFieldInput! + ".png"
        print(urlStringFinal)
        
        if (textFieldInputNumber >= 906 || textFieldInputNumber < 0)
        {
            
            self.present(invalidPokemonAlert, animated: true, completion: nil)
            
        }
        
        else
        {
            
            let url = URL(string: urlStringFinal)!
            guard let data = try? Data(contentsOf: url) else {
                return
            }
            showData.image = UIImage(data: data)
            
        }
        
        
    }
    
    

}



