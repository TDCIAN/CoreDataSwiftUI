//
//  MoviewDetailView.swift
//  CoreDataSwiftUI
//
//  Created by JeongminKim on 2022/06/08.
//

import SwiftUI

struct MovieDetailView: View {
    
    let movie: Movie
    @State private var movieName: String = ""
    let coreDM: CoreDataManager
    
    var body: some View {
        VStack {
            TextField(movie.title ?? "", text: $movieName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Button(action: {
                if !movieName.isEmpty {
                    movie.title = movieName
                    coreDM.updateMovie()
                }
            }, label: {
                Text("Update")
            })
        }
        .padding()
        .onAppear {
            movieName = movie.title ?? ""
        }
    }
}
