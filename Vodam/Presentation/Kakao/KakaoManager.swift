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
import OSLog


// MARK: Object
@MainActor @Observable
final class KakaoManager {
    // MARK: core
    private static let nativeKey = "64d7647b1174837fca072d9135ba98ea"
    static let shared = KakaoManager()
    init() {
        KakaoSDK.initSDK(appKey: Self.nativeKey)
    }
    
    
    // MARK: state
    nonisolated let logger = Logger(subsystem: "VoDam.KakaoManager", category: "Presentation")
    
    private(set) var loginAvailable: Bool? = nil
    private(set) var oauthToken: OAuthToken? = nil
    
    private(set) var profileNickName: String? = nil
    private(set) var profileImage: URL? = nil
    
    
    // MARK: action
    func checkLoginCapability() {
        // proccess
        let kakaoLoginAvaiaiable = UserApi.isKakaoTalkLoginAvailable()
        
        // mutate
        self.loginAvailable = kakaoLoginAvaiaiable
    }
    
    func loginWithKakao() async {
        // capture
        guard loginAvailable != nil else {
            logger.error("checkLoginCapability를 실행하지 않고 loginWithKakao를 시도했습니다.")
            return
        }
        guard loginAvailable == true else {
            logger.error("외부 문제로 인해 KakaoLogin이 불가한 상태입니다.")
            return
        }
        
        // process
        let authToken: OAuthToken? = nil
        
        // mutate
        self.oauthToken = authToken
    }
    
    func loginWithKakaoAccount() async {
        // capture
        guard loginAvailable != nil else {
            logger.error("checkLoginCapability를 실행하지 않고 loginWithKakao를 시도했습니다.")
            return
        }
        guard loginAvailable == true else {
            logger.error("외부 문제로 인해 KakaoLogin이 불가한 상태입니다.")
            return
        }
        
        // process
        let authToken: OAuthToken? = nil
        
        // mutate
        self.oauthToken = authToken
    }
    
    func fetchUserDatas() async {
        // capture
        guard let token = self.oauthToken else {
            logger.error("현재 oauthToken이 nil입니다. 로그인을 먼저 시도하세요")
            return
        }
        
        // process
        
        
        // mutate
    }
}
