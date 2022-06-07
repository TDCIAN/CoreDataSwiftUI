//
//  CoreDataManager.swift
//  CoreDataSwiftUI
//
//  Created by JeongminKim on 2022/06/03.
//

import Foundation
import CoreData

class CoreDataManager {
    let persistentContainer: NSPersistentContainer
    
    init() {
        persistentContainer = NSPersistentContainer(name: "HelloCoreDataModel")
        persistentContainer.loadPersistentStores { description, error in
            if let error = error {
                fatalError("Core Data Store failed to initialized - error: \(error.localizedDescription)")
            } else {
                
            }
        }
    }
    
    func updateMovie() {
        
    }
    
    func deleteMovie(movie: Movie) {
        persistentContainer.viewContext.delete(movie)
        
        do {
            try persistentContainer.viewContext.save()
        } catch {
            persistentContainer.viewContext.rollback()
            print("Failed to save context \(error.localizedDescription)")
        }
    }
    
    func getAllMovies() -> [Movie] {
        let fetchRequest: NSFetchRequest<Movie> = Movie.fetchRequest()
        do {
            return try persistentContainer.viewContext.fetch(fetchRequest)
        } catch {
            return []
        }
    }
    
    func saveMovie(title: String) {
        let movie = Movie(context: persistentContainer.viewContext)
        movie.title = title
        do {
            try persistentContainer.viewContext.save()
            print("Movie(\(title)) saved")
        } catch {
            print("Failed to save movie \(error)")
        }
    }
}
