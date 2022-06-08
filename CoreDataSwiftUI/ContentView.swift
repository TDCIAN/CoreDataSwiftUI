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
    @State private var needRefresh: Bool = false
    
    var body: some View {
        NavigationView {
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
                        NavigationLink(
                            destination: MovieDetailView(
                                movie: movie,
                                coreDM: coreDM,
                                needRefresh: $needRefresh
                            ), label: {
                                Text(movie.title ?? "")
                            })
                    }.onDelete { indexSet in
                        indexSet.forEach { index in
                            let movie = movies[index]
                            coreDM.deleteMovie(movie: movie)
                            populateMovies()
                        }
                    }
                }.listStyle(PlainListStyle())
                .accentColor(needRefresh ? .white : .black)
                
                Spacer()
            }
            .padding()
            .onAppear {
                populateMovies()
            }

        }
    }
    
    private func populateMovies() {
        movies = coreDM.getAllMovies()
    }
}
