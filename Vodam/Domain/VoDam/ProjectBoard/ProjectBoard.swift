//
//  ProjectBoard.swift
//  Vodam
//
//  Created by 김민우 on 11/18/25.
//
import Foundation
import ComposableArchitecture
import OSLog


// MARK: Object
@Reducer
struct ProjectBoard {
    // MARK: core
    nonisolated let logger = Logger(subsystem: "VoDam.ProjectBoard", category: "Domain")
    
    // MARK: state
    @ObservableState
    struct State {
        var projects: IdentifiedArrayOf<Project.State> = []
    }
    
    
    // MARK: action
    enum Action {
        // 자식(Project)에서 발생하는 액션을 감지하기 위해 IdentifiedActionOf 사용
        case project(IdentifiedActionOf<Project>)
    }
    
    var body: some Reducer<State, Action> {
        Reduce { state, action in
            switch action {
            case .project:
                // 자식(개별 프로젝트)에서 일어나는 액션 처리 (필요 시)
                return .none
            }
        }
        // 3. 부모(ProjectBoard)와 자식(Project) 리듀서 연결
        .forEach(\.projects, action: \.project) {
            Project()
        }
    }
}
