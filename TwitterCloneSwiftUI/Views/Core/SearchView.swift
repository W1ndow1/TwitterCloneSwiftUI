//
//  SearchView.swift
//  TwitterCloneSwiftUI
//
//  Created by window1 on 2023/10/26.
//

import SwiftUI
import SwiftData

struct SearchView: View {
    @Query var searchHistories: [SearchHistory]
    @Environment(\.modelContext) var modelContext
    
    @State private var searchText: String = ""
    @State private var showingSetting: Bool = false
    
    @ObservedObject private var userViewModel = UserViewModel()
    let sample = SampleData()
    
    var body: some View {
        NavigationStack {
            List {
                Text("최근검색어")
                    .font(.system(size: 14, weight: .bold))
                    .foregroundStyle(.blue)
                    .listRowBackground(Color.clear)
                ForEach(searchHistories, id: \.startDate) { history in
                    VStack(alignment:.leading){
                        Text(history.word)
                            .font(.system(size: 15, weight: .medium))
                        Text(customDateFormat(history.startDate))
                            .font(.system(size: 13, weight: .thin))
                    }
                    .listRowBackground(Color.clear)
                }
                .onDelete(perform: deleteSearchHistory)
            }
            .padding(.top, -10)
            .toolbar {
                ToolbarItem(placement: .topBarLeading){
                    makeProfileToolbarItem()
                }
                ToolbarItem(placement: .topBarTrailing){
                    makeSearchSettingToolbarItem(setting: $showingSetting)
                }
            }
        }
        .background(Color.clear)
        .searchable(text: $searchText, placement: .automatic, prompt: "검색어를 입력하세요")
        .onAppear {
            NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification, object: nil, queue: .main) { _ in
                updateSearchHistory(searchText)
            }
        }
        var searchResults: [SampleHistroy] {
            if searchText.isEmpty {
                return sample.contents
            } else {
                return sample.contents.filter{ $0.word == searchText}
            }
        }
    }
    
    func customDateFormat(_ currentDate: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let formattedDate = dateFormatter.string(from: currentDate)
        return formattedDate
    }
    
    func updateSearchHistory(_ searchText: String) {
        var word: [String] = []
        for strings in searchHistories {
            word.append(strings.word)
        }
        guard searchText.count > 0,
              !word.contains(searchText) else { return }
        let value = SearchHistory(word: searchText)
        modelContext.insert(value)
    }
    
    func deleteSearchHistory(_ indexSet: IndexSet) {
        for index in indexSet {
            let destination = searchHistories[index]
            modelContext.delete(destination)
        }
    }
    
}

#Preview {
    SearchView()
}


