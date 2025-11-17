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
        @Presents var loginForm: LoginForm.State?
    }
    
    
    // MARK: action
    enum Action {
        case loginInfo(PresentationAction<LoginInfo.Action>)
        case loginForm(PresentationAction<LoginForm.Action>)
        
        case showLoginInfo
    }
    
    var body: some Reducer<State, Action> {
        Reduce { state, action in
            switch action {
            case .showLoginInfo:
                state.loginInfo = .init()
                return .none
            case .loginInfo(.presented(.goToLogin)):
                state.loginForm = .init()
                state.loginInfo = nil
                return .none
            case .loginInfo(.presented(.closeInfo)):
                state.loginInfo = nil
                return .none
            default:
                return .none
            }
        }.ifLet(\.$loginInfo, action: \.loginInfo) {
            LoginInfo()
        }.ifLet(\.$loginForm, action: \.loginForm) {
            LoginForm()
        }
    }
}



