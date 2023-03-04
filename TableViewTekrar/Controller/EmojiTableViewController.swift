//
//  EmojiTableViewController.swift
//  TableViewTekrar
//
//  Created by Ahmet Ali ÇETİN on 3.03.2023.
//

import UIKit

class EmojiTableViewController: UITableViewController {
    
    
    let identifier: String = "reuseIdentifier"
    let emojis: [EmojiModel] = [
        EmojiModel(symbolName: "😁", name: "Smiling man", description: "This man is always smiling", usage: "You can use this emoji when you are literally laughing."),
        EmojiModel(symbolName: "🤓", name: "Nerd", description: "This guy has a happiness of knowledge", usage: "When you feel nerd, you can use this emoji"),
        EmojiModel(symbolName: "🤡", name: "Clown", description: "Clown has always suprises for you", usage: "If you feel like a clown like the well known story, you can use this."),
        EmojiModel(symbolName: "⌨️", name: "Keyboard", description: "Keyboards are the new type for writing.", usage: "If you are working on something with keyboard, you can use this emoji."),
        EmojiModel(symbolName: "👨🏻", name: "Mustache Man", description: "This is a very common stereotype of the traditional dad", usage: "If one of your friend talk like stereotype dad, you can use this emoji"),
        EmojiModel(symbolName: "👨🏻‍💻", name: "Tech Guy", description: "Tech guys and genius are always around us", usage: "When you or one of your friend talking like a technological genius, you can use this emoji."),
        EmojiModel(symbolName: "🥹", name: "Sad Eyes", description: "Sad eyes tells us more...", usage: "If you feel sad and depressed, you can use this emoji"),
        EmojiModel(symbolName: "👽", name: "Alien", description: "Aliens in your iPhones", usage: "If you feel very unique or out of the conversation, you can use this emoji."),
        EmojiModel(symbolName: "🤮", name: "Puking", description: "OMG I feel sick", usage: "If you feel sick after a message, you can use this emoji."),
        EmojiModel(symbolName: "🤢", name: "Almost puking", description: "I am going to puke! 🤢", usage: "If a message get feels you like this, you can use this emoji."),
        EmojiModel(symbolName: "🤯", name: "Brain Exploding", description: "Brain is literally exploding", usage: "If you feel like your brain is going to explode, use this emoji.")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier)!
        cell.textLabel?.text = "\(emoji.symbolName) - \(emoji.name)"
        cell.detailTextLabel?.text = emoji.description
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */
    //Push

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    //MARK: TABLE VIEW DELEGATE
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedEmoji = emojis[indexPath.row]
        print("\(selectedEmoji.name) - \(indexPath)")
    }

    //MARK: ACTIONS
    @IBAction func addButtonTapped(_ button: UIBarButtonItem) {
        
    }
}
