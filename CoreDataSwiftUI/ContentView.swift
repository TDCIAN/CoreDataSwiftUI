//
//  ContentView.swift
//  CoreDataSwiftUI
//
//  Created by JeongminKim on 2022/06/03.
//

import SwiftUI

struct ContentView: View {
    let coreDM: CoreDataManager
    
    @State private var movieName: String = ""
    @State private var movies: [Movie] = []
    
    var body: some View {
        VStack {
            TextField("Enter movie name", text: $movieName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Button(action: {
                coreDM.saveMovie(title: movieName)
                populateMovies()
            }, label: {
                Text("Save")
            })
            
            List {
                ForEach(movies, id: \.self) { movie in
                    Text(movie.title ?? "")
                }.onDelete { indexSet in
                    indexSet.forEach { index in
                        let movie = movies[index]
                        coreDM.deleteMovie(movie: movie)
                        populateMovies()
                    }
                }
            }
            
            Spacer()
        }
        .padding()
        .onAppear {
            populateMovies()
        }
    }
    
    private func populateMovies() {
        movies = coreDM.getAllMovies()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(coreDM: CoreDataManager())
    }
}
