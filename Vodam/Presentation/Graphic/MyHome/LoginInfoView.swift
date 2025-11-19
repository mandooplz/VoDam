//
//  LoginInfoView.swift
//  Vodam
//
//  Created by 김민우 on 11/17/25.
//
import Foundation
import ComposableArchitecture
import SwiftUI


// MARK: View
struct LoginInfoView: View {
    // MARK: model
    let store: StoreOf<LoginInfo>
    
    
    // MARK: body
    var body: some View {
        VStack(spacing: 0) {
            // 오른쪽 상단 X 버튼
            HStack {
                Spacer()
                Button {
                    store.send(.closeInfo)
                } label: {
                    Image(systemName: "xmark")
                        .foregroundColor(.gray)
                        .frame(width: 28, height: 28)
                        .background(Color(.systemGray5))
                        .clipShape(Circle())
                }
                .padding(16)
            }
            
            Spacer()
            
            VStack(spacing: 16) {
                Text(store.content)
                    .font(.subheadline)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 24)

                Button {
                    store.send(.goToLogin)
                } label: {
                    Text("로그인 하러 가기")
                        .foregroundStyle(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.purple)
                        .cornerRadius(14)
                }
                .padding(.horizontal, 24)
            }
            Spacer()
        }
        .padding(.bottom, 24)
    }
}
