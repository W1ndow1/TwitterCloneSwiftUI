//
//  UserViewModel.swift
//  TwitterCloneSwiftUI
//
//  Created by window1 on 12/15/23.
//

import Foundation
import Combine

class UserViewModel: ObservableObject {
    @Published var users: [User] = []
    @Published var todos: [Todo] = []
    var cancellables = Set<AnyCancellable>()
    
    init() {
        //getPosts()
        //getData()
        getPostsUserCombine()
        getPostTodoCombine()
    }
    
    func getPosts() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else { return }
        downloadData(fromURL: url) { returnData in
            if let data = returnData {
                guard let newPost = try? JSONDecoder().decode([User].self, from: data) else {
                    print("디코딩 에러")
                    return
                }
                DispatchQueue.main.async { [weak self] in
                    self?.users = newPost
                }
            } else {
                print("Not found Data")
            }
        }
    }
    
    func downloadData(fromURL url: URL, complectionHandler: @escaping (_ data: Data?) -> ()) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data,
                  error == nil,
                  let response = response as? HTTPURLResponse,
                  response.statusCode >= 200 && response.statusCode < 300 else {
                print("데이터 다운로드에 실패 했습니다.")
                return
            }
            complectionHandler(data)
        }
        .resume()
    }
    
    func getData() {
        //주소확인
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/todos") else { return }
        downloadData_TEST(url: url) { returnData in
            if let data = returnData {
                guard let decoding = try? JSONDecoder().decode([Todo].self, from: data) else { 
                    print("디코딩 에러")
                    return }
                DispatchQueue.main.async { [weak self] in
                    self?.todos = decoding
                }
            } else {
                print("Not found Data")
            }
        }
    }
    
    func downloadData_TEST(url: URL, complecationHandler: @escaping(_ data: Data?) -> ()){
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data,
                  error == nil,
                  let response = response as? HTTPURLResponse,
                  response.statusCode >= 200 && response.statusCode < 300 else {
                return
            }
            complecationHandler(data)
        }
        .resume()
    }
    
    func getPostsUserCombine() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else { return }
        URLSession.shared.dataTaskPublisher(for: url)
            .subscribe(on: DispatchQueue.global(qos: .background))
            .receive(on: DispatchQueue.main)
            .tryMap(responseHandling)
            .decode(type: [User].self, decoder: JSONDecoder())
            .sink(receiveCompletion: { print("Completion:\($0)")},
                  receiveValue: { [weak self] returnedValue in
                self?.users = returnedValue
            })
            .store(in: &cancellables)
    }
    
    func responseHandling(output: URLSession.DataTaskPublisher.Output) throws -> Data {
        guard
            let httpResponse = output.response as? HTTPURLResponse,
            httpResponse.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }
        return output.data
    }
    
    func getPostTodoCombine() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/todos") else { return }
        URLSession.shared.dataTaskPublisher(for: url)
            .subscribe(on: DispatchQueue.global(qos: .background))
            .receive(on: DispatchQueue.main)
            .tryMap(responseHandling)
            .decode(type: [Todo].self, decoder: JSONDecoder())
            .sink(receiveCompletion: {
                print("Completetion:\($0)")
            }, receiveValue: { returnValue in
                self.todos = returnValue
            })
            .store(in: &cancellables)
    }
    /*
     subscrible(어디에서 구독할것인가?) - receive(받으면 어디서 처리할것인가?) - tryMap(데이터 처리, 에러핸들링)
     decode(넘어온 정보 데이터 타입에 맞게 구분) - sink(연결)처리된 값을 받는게 완료됬을때, 그리고 어디로 보낼지 처리
     store(완료되었으므로 subscrible을 끝내는 부분)
     */
}
