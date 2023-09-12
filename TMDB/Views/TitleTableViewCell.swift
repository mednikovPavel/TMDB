//
//  TitleTableViewCell.swift
//  TMDB
//
//  Created by Pavel Mednikov on 12/09/2023.
//

import UIKit
import SDWebImage

class TitleTableViewCell: UITableViewCell {
    static let identefier = "TitleTableViewCell"
     
     private let playTitleButton: UIButton = {
        let button = UIButton()
         let image = UIImage(systemName: "play.circle", withConfiguration: UIImage.SymbolConfiguration(pointSize: 30))
         button.setImage(UIImage(systemName: "play.circle"), for: .normal)
         button.tintColor = UIColor.white
         button.translatesAutoresizingMaskIntoConstraints = false
         return button
     }()
     
     
     private let titleLabel: UILabel = {
         let label = UILabel()
         
         label.translatesAutoresizingMaskIntoConstraints = false
         return label
     }()
     
     private let titlesPosterImageView: UIImageView = {
        let imageView = UIImageView()
         imageView.contentMode = .scaleAspectFill
         imageView.translatesAutoresizingMaskIntoConstraints = false
         imageView.clipsToBounds = true
         return imageView
     }()
     

     
     override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
         super.init(style: style, reuseIdentifier: reuseIdentifier)
         contentView.addSubview(titlesPosterImageView)
         contentView.addSubview(titleLabel)
         contentView.addSubview(playTitleButton)
         
         applyConstraints()
     }
     
     private func applyConstraints(){
         let titlesPosterUIImageViewConstraints = [
             titlesPosterImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
             titlesPosterImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
             titlesPosterImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
             titlesPosterImageView.widthAnchor.constraint(equalToConstant: 100)
         ]
         
         let titleLabelConstreints = [
             titleLabel.leadingAnchor.constraint(equalTo: titlesPosterImageView.trailingAnchor, constant: 20),
             titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
         ]
         
         let playTitleButtonConstraints = [
             playTitleButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
             playTitleButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
         ]
         
         NSLayoutConstraint.activate(titlesPosterUIImageViewConstraints)
         NSLayoutConstraint.activate(titleLabelConstreints)
         NSLayoutConstraint.activate(playTitleButtonConstraints)
     }
     
     public func configure(with model: TitleViewModel){
     
         
         guard let url = URL(string: "https://image.tmdb.org/t/p/w500/\(model.posterURL)") else{
             return
         }
         
         titlesPosterImageView.sd_setImage(with: url, completed: nil)
         titleLabel.text = model.titleName
         
     }
     
     
     
     
     required init?(coder: NSCoder) {
         fatalError()
     }
     
}
