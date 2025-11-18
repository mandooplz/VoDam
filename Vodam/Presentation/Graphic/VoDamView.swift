//
//  VoDamView.swift
//  Vodam
//
//  Created by 김민우 on 11/19/25.
//
import SwiftUI
import ComposableArchitecture


// MARK: View
struct VoDamView: View {
    // MARK: model
    @State var store: StoreOf<VoDam>
    init(_ store: StoreOf<VoDam>) {
        self.store = store
    }
    
    
    // MARK: body
    var body: some View {
        TabView {
            Text("MyHomeView입니다.")
                .tabItem {
                    Label("홈", systemImage: "house")
                }
                
            
            Text("ProjectBoardView입니다.")
                .tabItem {
                    Label("프로젝트", systemImage: "folder")
                }
            
            Text("ChatBoardView입니다.")
                .tabItem {
                    Label("채팅", systemImage: "bubble.left.and.bubble.right")
                }
        }
    }
}

#Preview {
    VoDamView(
        Store(
            initialState: VoDam.State(), reducer: {
                VoDam()
            })
    )
}
