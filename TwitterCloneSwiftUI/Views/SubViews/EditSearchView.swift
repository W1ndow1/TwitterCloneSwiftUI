//
//  EditSearchView.swift
//  TwitterCloneSwiftUI
//
//  Created by window1 on 1/19/24.
//

import SwiftUI
import SwiftData

struct EditSearchView: View {
    @Bindable var searchHistories: SearchHistory
    
    var body: some View {
        Form { 
            TextField("검색어", text: $searchHistories.word)
            DatePicker("날짜", selection: $searchHistories.startDate)
        }
        .navigationTitle("수정")
        .navigationBarTitleDisplayMode(.automatic)
    }
}
#Preview {
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: SearchHistory.self, configurations: config)
        let example = SearchHistory(word: "AsianCup2023", startDate: .now)
        return EditSearchView(searchHistories: example)
            .modelContainer(container)
    } catch {
        fatalError("Failed to create model container")
    }
}
