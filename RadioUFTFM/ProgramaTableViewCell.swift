//
//  ProgramaTableViewCell.swift
//  RadioUFT
//
//  Created by Paulo Atavila on 07/12/17.
//  Copyright © 2017 Paulo Atavila. All rights reserved.
//

import UIKit

class ProgramaTableViewCell: UITableViewCell {

    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var nomeProgramaLabel: UILabel!
    @IBOutlet weak var dataLabel: UILabel!
    @IBOutlet weak var descricaoLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
