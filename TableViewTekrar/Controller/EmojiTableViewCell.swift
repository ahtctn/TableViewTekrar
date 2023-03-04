//
//  EmojiTableViewCell.swift
//  TableViewTekrar
//
//  Created by Ahmet Ali ÇETİN on 4.03.2023.
//

import UIKit

class EmojiTableViewCell: UITableViewCell {
    //MARK: OUTLETS
    @IBOutlet weak var symbolName: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var desc: UILabel!
    
    func update(with emoji: EmojiModel) {
        symbolName.text = emoji.symbolName
        name.text = emoji.name
        desc.text = emoji.description
    }

}
