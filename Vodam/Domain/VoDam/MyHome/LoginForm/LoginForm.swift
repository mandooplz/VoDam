//
//  LogInForm.swift
//  Vodam
//
//  Created by 김민우 on 11/17/25.
//
import Foundation
import ComposableArchitecture
import OSLog


// MARK: Object
@Reducer
struct LoginForm {
    // MARK: core
    private nonisolated let logger = Logger(subsystem: "VoDam.LoginForm", category: "Domain")
    
    // MARK: state
    @ObservableState
    struct State {
        var nickname: String? = nil
        var imageURL: URL? = nil
    }
    
    
    // MARK: action
    enum Action {
        case closeForm
        case setNickname(String?)
        case imageUrl(URL?)
    }
    
    var body: some Reducer<State, Action> {
        Reduce { state, action in
            switch action {
            case .closeForm:
                logger.info("closeForm 액션이 호출되었습니다.")
                return .none
            case .setNickname(let nickname):
                state.nickname = nickname
                return .none
            case .imageUrl(let url):
                state.imageURL = url
                return .none
            }
        }
    }
}
