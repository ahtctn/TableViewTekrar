//
//  NewEmojiTableViewController.swift
//  TableViewTekrar
//
//  Created by Ahmet Ali ÇETİN on 4.03.2023.
//

import UIKit

class EditEmojiTableViewController: UITableViewController {

    //MARK: OUTLETS
    @IBOutlet weak var symbolName: UITextField!
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var desc: UITextField!
    @IBOutlet weak var usage: UITextField!
    
    let saveUnwined = "saveUnwined"
    var emoji: EmojiModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let emoji = emoji {
            title = "Edit Emoji 😎"
            symbolName.text = emoji.symbolName
            name.text = emoji.name
            desc.text = emoji.description
            usage.text = emoji.usage
        }
        
    }


    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //Yalnızca saveUnwined ise çalışmaya devam etmeli
        guard segue.identifier == saveUnwined else { return }
        let symbol = symbolName.text!
        let name = name.text!
        let desc = desc.text!
        let usage = usage.text!
        
        emoji = EmojiModel(symbolName: symbol, name: name, description: desc, usage: usage)
        
    }
    
    func isItNil() {
        
    }

}
