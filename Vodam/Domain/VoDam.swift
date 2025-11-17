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
        @Presents var loginInfo: LoginInfo.State?
        @Presents var loginForm: LogInForm.State?
    }
    
    
    // MARK: action
    enum Action {
        case loginInfo(PresentationAction<LoginInfo.Action>)
        case loginForm(PresentationAction<LogInForm.Action>)
        
        case showLoginInfo
    }
    
    var body: some Reducer<State, Action> {
        Reduce { state, action in
            switch action {
            case .showLoginInfo:
                state.loginForm = .init()
                return .none
            default:
                return .none
            }
        }
    }
}



