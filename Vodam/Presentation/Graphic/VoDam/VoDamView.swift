//
//  VoDamView.swift
//  Vodam
//
//  Created by 김민우 on 11/17/25.
//
import SwiftUI
import ComposableArchitecture


// MARK: view
struct VoDamView: View {
    // MARK: model
    @Bindable var store: StoreOf<MyHome>
    
    
    // MARK: body
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                
                Text("여기에 메인 UI 들어갈 예정")
                    .font(.title3)
                    .foregroundStyle(.secondary)
                
                Spacer()
            }
            .navigationTitle("새 프로젝트 생성")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        store.send(.showLoginInfo)
                    } label: {
                        Image(systemName: "person.circle")
                            .imageScale(.large)
                    }
                }
            }
            
            // navigationDestination
            .navigationDestination(
                item: $store.scope(
                    state: \.destination?.loginForm,
                action: \.destination.loginForm),
                destination: { store in
                       LoginFormView(store: store)
                   })
            
            
            // sheet
            .sheet(item: $store.scope(
                state: \.destination?.loginInfo,
                action: \.destination.loginInfo)) { store in
                LoginInfoView(store: store)
                    .presentationDetents([.fraction(0.4)])
                    .presentationDragIndicator(.visible)
            }
        }
    }
}



#Preview {
    VoDamView(
        store: Store(initialState: MyHome.State()) {
            MyHome()
        }
    )
}
