//
//  CustomTableViewCell.swift
//  achievements
//
//  Created by Nouman on 16/05/2021.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    static let identifier = "CustomTableView"
    
    static func nib() -> UINib {
        return UINib(nibName: "CustomTableViewCell", bundle: nil)
    }
    
    @IBOutlet weak var level: UILabel!
    @IBOutlet weak var levelNumber: UILabel!
    @IBOutlet weak var progress: UIProgressView!
    @IBOutlet weak var leftProgress: UILabel!
    @IBOutlet weak var rightProgress: UILabel!
    
    public func configure(levelString: String, levelNum: String, prog: Float, left: String, right: String) {
        level.text = levelString
        levelNumber.text = levelNum
        progress.setProgress(prog, animated: true)
        leftProgress.text = left
        rightProgress.text = right
    }


    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
