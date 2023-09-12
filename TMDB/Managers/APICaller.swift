//
//  APICaller.swift
//  TMDB
//
//  Created by Pavel Mednikov on 12/09/2023.
//

import Foundation


struct Constents{
    static let API_KEY = "d2bc56bb74d10fcca04542127ebda98c"
    static let baseURl = "https://api.themoviedb.org"

}

enum APiError: Error{
    case failedToGetData
}


class APICaller{
    static let shared = APICaller()
    
    func getTraidingMovies(complection: @escaping (Result<[Title], Error>) -> Void){
      
        guard let url = URL(string: "\(Constents.baseURl)/3/trending/movie/day?api_key=\(Constents.API_KEY)") else {return}
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do{
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                complection(.success(results.results))
                
            }catch{
                complection(.failure(error))
            }
        }
        task.resume()
        
    }
    

    
    func getUpcomingMovies(completion: @escaping (Result<[Title], Error>) -> Void){
        guard let url = URL(string: "\(Constents.baseURl)/3/movie/upcoming?api_key=\(Constents.API_KEY)&language=en-US&page=1") else {return}
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do{
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                completion(.success(results.results))
            }catch{
                print(error)
                
            }
            

        }
        task.resume()
    }
    
    func getPopular(completion: @escaping (Result<[Title], Error>) -> Void){
        guard let url = URL(string: "\(Constents.baseURl)/3/movie/popular?api_key=\(Constents.API_KEY)&language=en-US&page=1") else {return}
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do{
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                completion(.success(results.results))
            }catch{
                print(error)
                
            }
            

        }
        task.resume()
    }
    
    func getTopRared(completion: @escaping (Result<[Title], Error>) -> Void){
        guard let url = URL(string: "\(Constents.baseURl)/3/movie/top_rated?api_key=\(Constents.API_KEY)&language=en-US&page=1") else {return}
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do{
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                completion(.success(results.results))
            }catch{
                print(error)
                
            }
            

        }
        task.resume()
    }
    
    func getDiscoverMovies(completion: @escaping (Result<[Title], Error>) -> Void){
        
        guard let url = URL(string: "\(Constents.baseURl)/3/discover/movie?api_key=\(Constents.API_KEY)&language=en-US&sort_by=popularity.desc&include_adult=false&include_video=false&page=1&with_watch_monetization_types=flatrate") else {return}
        
        let task = URLSession.shared.dataTask(with: url) { data, _, error    in
            guard let data = data, error == nil else {
                return
            }
            do{
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                completion(.success(results.results))
            }catch{
                print(error)
            }
        }
        task.resume()
        
    }
    
    func search (with query: String, completion: @escaping (Result<[Title], Error>) -> Void ){
        
        guard let query = query.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) else {return}
        
        
        guard let url = URL(string: "\(Constents.baseURl)/3/search/movie?api_key=\(Constents.API_KEY)&query=\(query)") else {return}
        
        let task = URLSession.shared.dataTask(with: url) { data, _, error    in
            guard let data = data, error == nil else {
                return
            }
            do{
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                completion(.success(results.results))
            }catch{
                print(error)
            }
        }
        task.resume()
        
    }
    
    
    }
    

