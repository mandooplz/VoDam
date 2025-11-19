//
//  VoDam.swift
//  Vodam
//
//  Created by 김민우 on 11/17/25.
//
import ComposableArchitecture
import Foundation


// MARK: Object
@Reducer
struct VoDam {
    // MARK: state
    @ObservableState
    struct State {
        var myHome = MyHome.State()
        var projectBoard = ProjectBoard.State()
        var chatBoard = ChatBoard.State()
        
        var isLoggedIn: Bool = false
    }
    
    
    // MARK: action
    enum Action {
        case myHome(MyHome.Action)
        case projectBoard(ProjectBoard.Action)
        case chatBoard(ChatBoard.Action)
    }
    
    var body: some Reducer<State, Action> {
        // 자식 리듀서 연결
        Scope(state: \.myHome, action: \.myHome) {
            MyHome()
        }
        Scope(state: \.projectBoard, action: \.projectBoard) {
            ProjectBoard()
        }
        Scope(state: \.chatBoard, action: \.chatBoard) {
            ChatBoard()
        }
        
        Reduce { state, action in
            switch action {
            case .myHome:
                return .none
            case .projectBoard:
                return .none
            case .chatBoard:
                return .none
            }
        }
    }
}



