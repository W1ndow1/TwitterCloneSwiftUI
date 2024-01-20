//
//  NotificationView.swift
//  TwitterCloneSwiftUI
//
//  Created by window1 on 2023/10/26.
//

import SwiftUI
import Combine

struct NotificationView: View {
    @ObservedObject var viewModel = UserViewModel()
    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.users, id: \.id) { user in
                    VStack(alignment: .leading, spacing: 10) {
                        Text(user.title)
                            .font(Font.title.bold())
                        Text(user.body)
                            .foregroundColor(Color(UIColor.systemGray2))
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                }
            }
            .refreshable {
                viewModel.getPostsUserCombine()
                print("Refresh List")
            }
            .navigationTitle("@escape로 가져와보기")
        }
    }
    
    func customDateFormat(_ currentDate: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let formattedDate = dateFormatter.string(from: currentDate)
        return formattedDate
    }
    
    
}

#Preview {
    NotificationView()
}
