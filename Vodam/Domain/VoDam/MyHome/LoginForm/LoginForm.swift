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
        
    }
    
    
    // MARK: action
    enum Action {
        case appleTapped
        case googleTapped
        case kakaoTapped
    }
    
    var body: some Reducer<State, Action> {
        Reduce { state, action in
            switch action {
            case .appleTapped:
                logger.info("appleTapped 액션이 호출되었습니다.")
                return .none
            case .googleTapped:
                logger.info("googleTapped 액션이 호출되었습니다.")
                return .none
            case .kakaoTapped:
                logger.info("kakaoTapped 액션이 호출되었습니다.")
                return .none
            }
        }
    }
}
