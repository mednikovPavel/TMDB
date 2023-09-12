//
//  TitlePreviewViewController.swift
//  TMDB
//
//  Created by Pavel Mednikov on 12/09/2023.
//

import UIKit

class TitlePreviewViewController: UIViewController {
    
    private var titles: [Title] = [Title]()

    private let titleLabel: UILabel = {
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 22, weight: .bold)
        label.text = "Harry Potter"
        
        return label
        
    }()
    
    private let overViewLabel: UILabel = {
      let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.text = "this is the best movie over to watch"
        
        return label
    }()
    
    

    
    
    private let imageView: UIImageView = {

        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        view.addSubview(imageView)
        view.addSubview(titleLabel)
        view.addSubview(overViewLabel)

        configureConstreints()
    }
    
    func configureConstreints(){
        let webViewConstreints = [
            imageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 100),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -100),
            imageView.heightAnchor.constraint(equalToConstant: 300)
            
        ]
        
        let titlelabelConstreints = [
            titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20)
            
        ]
        
        let overviewLabelConstreins = [
            overViewLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 15),
            overViewLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            overViewLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor)
            
        ]

        
        NSLayoutConstraint.activate(webViewConstreints)
        NSLayoutConstraint.activate(titlelabelConstreints)
        NSLayoutConstraint.activate(overviewLabelConstreins)

    }
    
    
    func configure( with model: TitlePreviewViewModel){
        titleLabel.text = model.title
        overViewLabel.text = model.titleOverView
        guard let url = URL(string: "https://image.tmdb.org/t/p/w500/\(model.posterURL)") else{
            return
        }
        
        imageView.sd_setImage(with: url, completed: nil)
       
        }
        


    }


    
    

    


