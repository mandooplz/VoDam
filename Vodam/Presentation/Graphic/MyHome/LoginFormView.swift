//
//  LoginFormView.swift
//  Vodam
//
//  Created by 김민우 on 11/17/25.
//
import ComposableArchitecture
import SwiftUI
import OSLog


// MARK: View
struct LoginFormView: View {
    // MARK: model
    private let logger = Logger(subsystem: "VoDam.LoginForm", category: "Presentation")
    let store: StoreOf<LoginForm>
    init(_ store: StoreOf<LoginForm>) {
        self.store = store
    }
    
    
    // MARK: body
    var body: some View {
        VStack(spacing: 24) {
            HStack {
                Spacer()
                Button {
                    store.send(.closeForm)
                } label: {
                    Image(systemName: "xmark")
                        .foregroundColor(.gray)
                        .frame(width: 28, height: 28)
                        .background(Color(.systemGray5))
                        .clipShape(Circle())
                }
                .padding(16)
            }
            
            Text("Vodam")
                .font(.title)
                .fontWeight(.bold)
                .padding(.top, 40)
            
            Spacer()
            
            VStack(spacing: 16) {
                Button {
                    logger.debug("Apple 로그인 구현 예정입니다.")
                } label: {
                    Text("Sign in with Apple")
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.black)
                        .foregroundColor(.white)
                        .cornerRadius(12)
                }
                
                Button {
                    logger.debug("Google 로그인 구현 예정입니다.")
                } label: {
                    Text("Sign in with Google")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 12)
                            .stroke(Color.gray.opacity(0.4), lineWidth: 1)
                        )
                }
                
                Button(action: loginWithKakao)
                {
                    Text("Sign in with KaKao")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.yellow)
                        .cornerRadius(12)
                }
            }
            .padding(.horizontal, 24)
            
            Spacer()
        }
        .navigationTitle("로그인")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    
    // MARK: flow
    private func loginWithKakao() {
        Task {
            let kakaoManager = KakaoManager.shared
            
            kakaoManager.checkLoginCapability()
            await kakaoManager.loginWithKakao()
            await kakaoManager.loginWithKakaoAccount()
            
            await kakaoManager.fetchUserData()
        }
    }
}


// MARK: Priview
#Preview {
    LoginFormView(
        Store(
            initialState: LoginForm.State(),
            reducer: {
                LoginForm()
            }
        )
    )
}
