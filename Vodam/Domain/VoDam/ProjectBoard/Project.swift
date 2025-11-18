//
//  Project.swift
//  Vodam
//
//  Created by 김민우 on 11/18/25.
//
import Foundation
import ComposableArchitecture


// MARK: Object
@Reducer
struct Project {
    // MARK: state
    @ObservableState
    struct State: Equatable, Identifiable {
        let id: UUID
        var title: String
    }
    
    
    // MARK: action
}
