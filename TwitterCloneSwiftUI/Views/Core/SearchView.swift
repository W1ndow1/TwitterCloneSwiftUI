//
//  SearchView.swift
//  TwitterCloneSwiftUI
//
//  Created by window1 on 2023/10/26.
//

import SwiftUI
import SwiftData

struct SearchView: View {
    @Environment(\.modelContext) var modelContext
    @Query(sort: \SearchHistory.startDate, order: .reverse) var searchHistories: [SearchHistory]
    @State private var path = [SearchHistory]()
    @State private var searchText: String = ""
    @State private var showingSetting: Bool = false
    @State private var sortOrder = SortDescriptor(\SearchHistory.startDate, order: .reverse)
    var body: some View {
        NavigationStack(path: $path) {
            List {
                Text("최근검색어")
                    .font(.system(size: 14, weight: .bold))
                    .foregroundStyle(.blue)
                    .listRowBackground(Color.clear)
                ForEach(filter, id: \.startDate) { history in
                    NavigationLink(value: history) {
                        VStack(alignment:.leading){
                            Text(history.word)
                                .font(.system(size: 15, weight: .medium))
                            Text(customDateFormat(history.startDate))
                                .font(.system(size: 13, weight: .thin))
                        }
                    }
                    .listRowBackground(Color.clear)
                }
                .onDelete(perform: deleteSearchHistory)
            }
            .navigationDestination(for: SearchHistory.self, destination: EditSearchView.init)
            .padding(.top, -10)
            .toolbar {
                ToolbarItem(placement: .topBarLeading){
                    makeProfileToolbarItem()
                }
                ToolbarItem(placement: .topBarTrailing){
                    makeSearchSettingToolbarItem(setting: $showingSetting)
                }
                ToolbarItem(placement: .topBarLeading){
                    Button("추가하기", systemImage: "plus", action: addSearchHistory)
                }
                ToolbarItem(placement:. topBarTrailing) {
                    Menu("정렬" , systemImage: "arrow.up.arrow.down") {
                        Picker("정렬", selection:$sortOrder) {
                            Text("이름")
                                .tag(SortDescriptor(\SearchHistory.word, order: .forward))
                            Text("날짜")
                                .tag(SortDescriptor(\SearchHistory.startDate, order:.reverse))
                        }
                        .pickerStyle(.inline)
                    }
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
        var filter: [SearchHistory] {
            if searchText.isEmpty {
                return searchHistories
            } else {
                return searchHistories.filter { $0.word.localizedStandardContains(searchText)}
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
    
    func addSearchHistory() {
        let searchHistory = SearchHistory()
        modelContext.insert(searchHistory)
        path = [searchHistory]
    }
    
}

#Preview {
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: SearchHistory.self, configurations: config)
        let example = SearchHistory(word: "AsianCup2023", startDate: .now)
        return SearchView()
            .modelContainer(container)
    } catch {
        fatalError("Failed to create model container")
    }
}


