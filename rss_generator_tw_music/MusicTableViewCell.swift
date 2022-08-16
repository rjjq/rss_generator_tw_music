//
//  MusicTableViewCell.swift
//  rss_generator_tw_music
//
//  Created by rjjq on 2022/8/16.
//

import UIKit

class MusicTableViewCell: UITableViewCell {

    @IBOutlet weak var musicLabel: UILabel!
    @IBOutlet weak var photoView: UIImageView!
    
    @IBOutlet weak var rowLabel: UILabel!
    @IBOutlet weak var songLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
