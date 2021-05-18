//
//  CustomTableViewCell.swift
//  achievements
//
//  Created by Nouman Mehmood on 17/05/2021.
//

import UIKit
import Stevia
import SDWebImage

class CustomTableViewCell: UITableViewCell {
    
    static let identifier = "CustomTableViewCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupFieldsAndConstraints()
    }
    
    func setupFieldsAndConstraints() {
        subviews {
            backgroundImage
            circle
            levelLabel
            levelValueLabel
            progress
            leftLabel
            rightLabel
        }
        setupBackgroundImage()
        setupCircle()
        setupLevelLabel()
        setupLevelValueLabel()
        setupProgressBar()
        setupLeftLabel()
        setupRightLabel()
    }
    
    var backgroundImage: UIImageView = {
        let image = UIImageView()
        return image
    }()
    
    var circle: UIImageView = {
        let cir = UIImageView()
        cir.image = UIImage(named: "round")
        return cir
    }()
    
    var levelLabel: UILabel = {
        let level = UILabel()
        return level
    }()
    
    var levelValueLabel: UILabel = {
       let level = UILabel()
        return level
    }()
    
    var progress: UIProgressView = {
        let progress = UIProgressView()
        return progress
    }()
    
    var leftLabel: UILabel = {
        let left = UILabel()
        return left
    }()
    
    var rightLabel: UILabel = {
        let right = UILabel()
        return right
    }()
    
    func setupBackgroundImage() {
        backgroundImage.style { b in
            b.layer.cornerRadius = 10
            b.clipsToBounds = true
            b.Top == 10
            b.Bottom == 10
            b.Left == 20
            b.Right == 20
        }
    }
    
    func setupCircle() {
        circle.style { c in
            c.Top == 42
            c.size(110)
            c.centerHorizontally()
        }
    }
    
    func setupLevelLabel() {
        levelLabel.style { l in
            l.textAlignment = .center
            l.text = "Level"
            l.Top == 60
            l.Left == 50
            l.Right == 50
        }
    }
    
    func setupLevelValueLabel() {
        levelValueLabel.style { l in
            l.textAlignment = .center
            l.font = UIFont.boldSystemFont(ofSize: 55)
            l.text = "1"
            l.Top == 75
            l.Left == 50
            l.Right == 50
        }
    }
    
    func setupProgressBar() {
        progress.style { p in
            p.progressViewStyle = .bar
            p.layer.cornerRadius = 3
            p.clipsToBounds = true
            p.transform = CGAffineTransform(scaleX: 1, y: 2.5)
            p.trackTintColor = .white
            p.tintColor = .systemGreen
            p.Top == 185
            p.Left == 40
            p.Right == 40
        }
    }
    
    func setupLeftLabel() {
        leftLabel.style { l in
            l.textAlignment = .left
            l.textColor = .white
            l.Top == 195
            l.Left == 40
            l.font = UIFont.boldSystemFont(ofSize: 14)
        }
    }
    
    func setupRightLabel() {
        rightLabel.style { l in
            l.textAlignment = .right
            l.textColor = .white
            l.Top == 195
            l.Right == 40
            l.font = UIFont.boldSystemFont(ofSize: 14)
        }
    }
    
    func setValues(achieve: Achievement) {
        backgroundImage.sd_setImage(with: URL(string: achieve.bg_image_url), placeholderImage: nil, options: [.progressiveLoad])
        levelValueLabel.text = achieve.level
        progress.setProgress(Float(Float(achieve.progress)/Float(achieve.total)), animated: true)
        leftLabel.text = "\(achieve.progress)pts"
        rightLabel.text = "\(achieve.total)pts"
    }
    
    func disableFields(achieve: Achievement) {
        backgroundImage.alpha = 0.5
        circle.alpha = 0.8
        levelLabel.isEnabled = false
        levelValueLabel.isEnabled = false
        progress.alpha = 0.5
        leftLabel.alpha = 0.8
        rightLabel.alpha = 0.8
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
