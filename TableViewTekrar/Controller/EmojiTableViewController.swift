//
//  EmojiTableViewController.swift
//  TableViewTekrar
//
//  Created by Ahmet Ali ÃETÄ°N on 3.03.2023.
//

import UIKit

class EmojiTableViewController: UITableViewController {
    
    
    let identifier: String = "reuseIdentifier"
    //MARK: UNWIND SEGUE ID'S
    let saveUnwined = "saveUnwined"
    let cancelUnwined = "cancelUnwined"
    var emojis: [EmojiModel] = [
        EmojiModel(symbolName: "ð", name: "Smiling man", description: "This man is always smiling", usage: "You can use this emoji when you are literally laughing."),
        EmojiModel(symbolName: "ð¤", name: "Nerd", description: "This guy has a happiness of knowledge", usage: "When you feel nerd, you can use this emoji"),
        EmojiModel(symbolName: "ð¤¡", name: "Clown", description: "Clown has always suprises for you", usage: "If you feel like a clown like the well known story, you can use this."),
        EmojiModel(symbolName: "â¨ï¸", name: "Keyboard", description: "Keyboards are the new type for writing.", usage: "If you are working on something with keyboard, you can use this emoji."),
        EmojiModel(symbolName: "ð¨ð»", name: "Mustache Man", description: "This is a very common stereotype of the traditional dad", usage: "If one of your friend talk like stereotype dad, you can use this emoji"),
        EmojiModel(symbolName: "ð¨ð»âð»", name: "Tech Guy", description: "Tech guys and genius are always around us", usage: "When you or one of your friend talking like a technological genius, you can use this emoji."),
        EmojiModel(symbolName: "ð¥¹", name: "Sad Eyes", description: "Sad eyes tells us more...", usage: "If you feel sad and depressed, you can use this emoji"),
        EmojiModel(symbolName: "ð½", name: "Alien", description: "Aliens in your iPhones", usage: "If you feel very unique or out of the conversation, you can use this emoji."),
        EmojiModel(symbolName: "ð¤®", name: "Puking", description: "OMG I feel sick", usage: "If you feel sick after a message, you can use this emoji."),
        EmojiModel(symbolName: "ð¤¢", name: "Almost puking", description: "I am going to puke! ð¤¢", usage: "If a message get feels you like this, you can use this emoji."),
        EmojiModel(symbolName: "ð¤¯", name: "Brain Exploding", description: "Brain is literally exploding", usage: "If you feel like your brain is going to explode, use this emoji.")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toEmojiEdit" {
            let selectedIndexPath = tableView.indexPathForSelectedRow!
            let selectedEmoji = emojis[selectedIndexPath.row]
            let navigationController = segue.destination as! UINavigationController
            let editEmojiController = navigationController.topViewController as! EditEmojiTableViewController
            editEmojiController.emoji = selectedEmoji
            
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return emojis.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let emoji = emojis[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier) as! EmojiTableViewCell
        cell.update(with: emoji)
        return cell
    }
    
    //MARK: TABLE VIEW DELEGATE
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedEmoji = emojis[indexPath.row]
        performSegue(withIdentifier: "toEditEmoji", sender: nil)
    }
    
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let movedEmoji = emojis.remove(at: sourceIndexPath.row)
        emojis.insert(movedEmoji, at: destinationIndexPath.row)
        tableView.reloadData()
        
    }
    
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        //indexPath: Editing Aksiyonunun gerÃ§ekleÅtiÄi hÃ¼crenin konumu
        //editingStyle: GerÃ§ekleÅen aksiyon. (.delete veya .insert olabilir.)
        
        if editingStyle == .delete {
            emojis.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    

    //MARK: ACTIONS
    @IBAction func editButtonTapped(_ button: UIBarButtonItem) {
        var tableViewEditing = tableView.isEditing
        tableView.setEditing(!tableViewEditing, animated: true)
    }
    
    @IBAction func unwindFromNewEmojiVC(_ segue: UIStoryboardSegue) {
        //Bu fonksiyon, NewEmojiViewController tarafÄ±ndan Ã§alÄ±ÅÄ±tÄ±rÄ±lacak
        guard segue.identifier == saveUnwined,
              let sourceTableVC = segue.source as? EditEmojiTableViewController,
              let newEmoji = sourceTableVC.emoji else { return }
        
        if let selectedIndexPath = tableView.indexPathForSelectedRow {
            //Daha Ã¶nceden bir hÃ¼cre seÃ§ilmiÅ ve emojinin tableView hÃ¼cresi gÃ¼ncellemesi gerekiyor.
            //AdÄ±m 1: 'emojis' arrayinin seÃ§ili hÃ¼crenin iÃ§inde indexinde bulunan nesnenin gÃ¼ncellenmesi.
            emojis[selectedIndexPath.row] = newEmoji
            
            //AdÄ±m 2:
            tableView.reloadRows(at: [selectedIndexPath], with: .automatic)
        } else {
            //AdÄ±m 1: Yeni bir hÃ¼cre iÃ§in IndexPath oluÅtur.
            let newIndexPath = IndexPath(row: emojis.count, section: 0)
            
            //AdÄ±m 2: Yeni emoji objesini emojis array'ine ekle
            emojis.append(newEmoji)
            
            //AdÄ±m 3: OluÅturulan IndexPath ile TableView'a yeni bir hÃ¼cre eklenir.
            tableView.insertRows(at: [newIndexPath], with: .automatic)
        }
        
    }
}
