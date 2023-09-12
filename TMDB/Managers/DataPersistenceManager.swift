//
//  DataPersistenceManager.swift
//  TMDB
//
//  Created by Pavel Mednikov on 12/09/2023.
//

import Foundation
import UIKit
import CoreData


class DataPersistenceManager {
    
    static let shared = DataPersistenceManager()
    
    
    func downloadTitleWith(model: Title, complection: @escaping(Result<Void, Error>) -> Void){
        
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let context = appDelegate.persistentContainer.viewContext
        let item = TitleItem(context: context)
        
        
        item.name = model.original_name
        item.id = Int64(model.id)
        item.original_title = model.original_title
        item.overview = model.overview
        item.poster_path = model.poster_path
        item.overview = model.overview
   
        
        
        
        do{
            try context.save()
            complection(.success(()))

        }catch{
            print(error)
        }
                
    }
    
    
    func fecthingTitlesFromDataBase(comletion: @escaping (Result<[TitleItem], Error>) -> Void){
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let context = appDelegate.persistentContainer.viewContext
        
        
        let request: NSFetchRequest<TitleItem>
        
        request = TitleItem.fetchRequest()
        
        do{
           let titles =  try context.fetch(request)
            comletion(.success(titles))
            
        }catch{
            print(error)
        }
    }
    
    func deleteTitleWith(model: TitleItem, completion: @escaping(Result<Void, Error>) -> Void){
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let context = appDelegate.persistentContainer.viewContext
        
        context.delete(model)
        
        do{
            try context.save()
            completion(.success(()))
        }catch{
            completion(.failure(error))
            
        }
        
    }
    
}
