//
//  HomeViewController.swift
//  TMDB
//
//  Created by Pavel Mednikov on 12/09/2023.
//

import UIKit

enum Sections: Int {
    case TrendingMovies = 0
    case Popular = 1
    case Upcoming = 2
    case TopRated = 3
}

class HomeViewController: UIViewController {
    
  


    private var randomTrendingMovie: Title?
    
   

    
    
    let sectionTitles: [String] = ["Tranding Movies", "Popular", "Upcoming Movies", "Top rated"]
    
//    , "TrendingTV"
    
    private let homeFitTable: UITableView = {
      
        let table = UITableView(frame: .zero, style: .grouped)
        table.register(CollectionTableViewCell.self, forCellReuseIdentifier: CollectionTableViewCell.identifier)
        return table
        
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(homeFitTable)
        
        homeFitTable.delegate = self
        homeFitTable.dataSource = self
        
        configureNavbar()
        
       
        
     
       
        
    }
    
   
    
    
    private func configureNavbar(){
        var image = UIImage(named: "Tmdblogo.svg")
        image = image?.withRenderingMode(.alwaysOriginal)
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: image, style: .done, target: self, action: nil)
        navigationController?.navigationBar.tintColor = .white
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        homeFitTable.frame = view.bounds
        
    }
    
  
    

 

}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource{
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionTitles.count
    }
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CollectionTableViewCell.identifier, for: indexPath) as? CollectionTableViewCell else{
            return UITableViewCell()
        }
        
        cell.delegate = self
        
       
        
        switch indexPath.section{
        case Sections.TrendingMovies.rawValue:
            
            APICaller.shared.getTraidingMovies { result in
                switch result{
                case .success(let titles):
                    cell.configure(with: titles)
                case .failure(let error):
                    print(error)
                }
            }

            
        case Sections.Popular.rawValue:
            APICaller.shared.getPopular { result in
                switch result{
                case .success(let titles):
                    cell.configure(with: titles)
                case .failure(let error):
                    print(error)
                }
            }
        case Sections.Upcoming.rawValue:
            APICaller.shared.getUpcomingMovies { result in
                switch result{
                case .success(let titles):
                    cell.configure(with: titles)
                case .failure(let error):
                    print(error)
                }
            }
            
        case Sections.TopRated.rawValue:
            APICaller.shared.getTopRared { result in
                switch result{
                case .success(let titles):
                    cell.configure(with: titles)
                case .failure(let error):
                    print(error)
                }
            }
        default:
            return UITableViewCell()
        }
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        guard let header = view as? UITableViewHeaderFooterView else {
            return
        }
     
        header.textLabel?.font = .systemFont(ofSize: 18, weight: .semibold)
        header.textLabel?.frame = CGRect(x: header.bounds.origin.x + 40, y: header.bounds.origin.y, width: 100, height: header.bounds.height)
        header.textLabel?.textColor = UIColor(named: "modeColor")
        header.textLabel?.text = header.textLabel?.text?.capitalizeFirstLetter()
        
    }
    
  
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let defoultOffset = view.safeAreaInsets.top
        let offset = scrollView.contentOffset.y + defoultOffset
        
        navigationController?.navigationBar.transform = .init(translationX: 0, y: min(0, -offset))
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionTitles[section]
    }
    
    
    
}

extension HomeViewController: CollectionViewtableViewCellDelegate{
    func collectionTableViewCellDidTapCell(_ cell: CollectionTableViewCell, viewModel: TitlePreviewViewModel) {
        DispatchQueue.main.async { [weak self] in
            let vc = TitlePreviewViewController()
            vc.configure(with: viewModel)
            self?.navigationController?.pushViewController(vc, animated: true)
        }

    }


}
