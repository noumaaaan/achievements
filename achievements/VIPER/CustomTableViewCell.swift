//
//  CustomTableViewCell.swift
//  achievements
//
//  Created by Nouman Mehmood on 17/05/2021.
//

import UIKit
import SDWebImage

class CustomTableViewCell: UITableViewCell {
    
    var backgroundImage = UIImageView()
    var level = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(backgroundImage)
        
        setUpBackgroundImage()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpBackgroundImage() {
        backgroundImage.layer.cornerRadius = 5
        backgroundImage.clipsToBounds = true
        
        backgroundImage.translatesAutoresizingMaskIntoConstraints = false
        backgroundImage.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        backgroundImage.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        backgroundImage.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        backgroundImage.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
    
    
    
    
    
    func setValues(achieve: Achievement) {
        backgroundImage.sd_setImage(with: URL(string: achieve.bg_image_url), placeholderImage: nil, options: [.progressiveLoad])
        level.text = String(achieve.progress)
    }
    
    func disableFields(achieve: Achievement) {
        backgroundImage.alpha = 0.5
    }
    
    
    func configureLevelLabel() {
        level.numberOfLines = 0
        level.adjustsFontSizeToFitWidth = true
    }
    
    func setImageConstraints() {
        backgroundImage.translatesAutoresizingMaskIntoConstraints = false
        backgroundImage.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        backgroundImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12).isActive = true
        backgroundImage.heightAnchor.constraint(equalToConstant: 80).isActive = true
        backgroundImage.widthAnchor.constraint(equalTo: backgroundImage.heightAnchor, multiplier: 16/9).isActive = true
    }
    
    func setLabelConstraints() {
        level.translatesAutoresizingMaskIntoConstraints = false
        level.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        level.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        level.heightAnchor.constraint(equalToConstant: 80).isActive = true
        level.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
    }
    
}
