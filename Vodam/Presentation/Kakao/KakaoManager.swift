//
//  KakaoManager.swift
//  Vodam
//
//  Created by 김민우 on 11/20/25.
//
import Foundation
import KakaoSDKAuth
import KakaoSDKCommon
import KakaoSDKUser


// MARK: Object
@MainActor @Observable
final class KakaoManager {
    // MARK: core
    private static let nativeKey = "64d7647b1174837fca072d9135ba98ea"
    init() {
        KakaoSDK.initSDK(appKey: Self.nativeKey)
    }
    
    
    // MARK: state
    private(set) var isKakaoAppExist: Bool? = nil
    
    
    // MARK: action
    func checkLoginCapability() {
        // proccess
        let kakaoLoginAvaiaiable = UserApi.isKakaoTalkLoginAvailable()
        
        // mutate
        self.isKakaoAppExist = kakaoLoginAvaiaiable
    }
    
    func loginWithKakao() async throws {
        // 카카오톡 실행 가능 여부 확인
        if (UserApi.isKakaoTalkLoginAvailable()) {
            UserApi.shared.loginWithKakaoTalk {(oauthToken, error) in
                if let error = error {
                    print(error)
                }
                else {
                    print("loginWithKakaoTalk() success.")

                    // 성공 시 동작 구현
                    _ = oauthToken
                }
            }
        }
    }
}
