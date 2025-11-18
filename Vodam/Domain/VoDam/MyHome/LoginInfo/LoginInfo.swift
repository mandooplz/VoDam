//
//  LoginInfo.swift
//  Vodam
//
//  Created by 김민우 on 11/17/25.
//
import ComposableArchitecture


// MARK: Object
@Reducer
struct LoginInfo {
    // MARK: state
    @ObservableState
    struct State {
        let content: String = """
                       로그인하면 아래 기능을 사용할 수 있어요 👇

                       - 녹음 시간 / 횟수 제한 해제 (3회 -> 무제한)
                       - PDF / 파일 / YouTube
                       - 스크립트 및 요약 결과 Blur 제거 
                    """
    }
    
    
    // MARK: action
    enum Action {
        case goToLogin
        case closeInfo
    }
    
    var body: some Reducer<State, Action> {
        Reduce { state, action in
            return .none
        }
    }
}

