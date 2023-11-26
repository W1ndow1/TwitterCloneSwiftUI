//
//  SearchView.swift
//  TwitterCloneSwiftUI
//
//  Created by window1 on 2023/10/26.
//

import SwiftUI

struct SearchView: View {
    @State private var isPlaying: Bool = false
    @State private var currentTime: TimeInterval = 3751.0
    let episode: Episode
    var body: some View {
        VStack {
            Image(systemName: "magnifyingglass")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text(episode.title).font(.title)
            
            Button(action: {
                print("Touch autor")
            }, label: {
                Text(episode.author).font(.caption).foregroundColor( isPlaying ? .black : .gray)
            })
            ControlButton(isplaying: $isPlaying)
            
            Text(convertSecondToTime(timeInSeconds:currentTime))
        }
        .padding()
    }
    
    func convertSecondToTime(timeInSeconds: Double) -> String {
        let hour = (Int)(fmod((timeInSeconds/3600), 12))
        let minutes = (Int)(fmod((timeInSeconds/60), 60))
        let seconds = (Int)(fmod(timeInSeconds, 60))
        return String(format: "%02d:%02d:%02d", hour, minutes, seconds)
    }
}





struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView(episode: Episode())
    }
}
