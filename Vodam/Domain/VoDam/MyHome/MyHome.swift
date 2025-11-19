//
//  MyHome.swift
//  Vodam
//
//  Created by 김민우 on 11/19/25.
//
import ComposableArchitecture
import Foundation
import OSLog


// MARK: Object
@Reducer
struct MyHome {
    // MARK: core
    private nonisolated let logger = Logger(subsystem: "VoDam.MyHome", category: "Domain")
    
    
    // MARK: state
    @ObservableState
    struct State {
        @Presents var destination: Destination.State?
    }
    
    @Reducer
    enum Destination {
        case loginInfo(LoginInfo)
        case loginForm(LoginForm)
    }
    
    
    // MARK: action
    enum Action {
        case destination(PresentationAction<Destination.Action>)
        case showLoginInfo
    }
    
    var body: some Reducer<State, Action> {
        Reduce { state, action in
            switch action {
            case .showLoginInfo:
                state.destination = .loginInfo(.init())
                return .none
            case .destination(.presented(.loginInfo(.goToLogin))):
                state.destination = .loginForm(.init())
                return .none
            case .destination(.presented(.loginInfo(.closeInfo))):
                state.destination = nil
                return .none
            case .destination(.presented(.loginForm(.closeForm))):
                state.destination = nil
                return .none
            default:
                logger.info("MyHome의 어떤 액션이 실행되었습니다.")
                return .none
            }
        }.ifLet(\.$destination, action: \.destination)
    }
}




