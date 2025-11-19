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
final class KakaoManager: Sendable {
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
    
    private(set) var userInfo: UserInfo? = nil
    
    
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
        let authToken: OAuthToken? = await withCheckedContinuation { [weak self] continuation in
            UserApi.shared.loginWithKakaoTalk {(oauthToken, error) in
                guard error != nil else {
                    self?.logger.error("\(error)")
                    continuation.resume(returning: nil)
                    return
                }
                
                guard let oauthToken else {
                    self?.logger.error("OauthToken이 nil입니다.")
                    continuation.resume(returning: nil)
                    return
                }

                
                self?.logger.debug("카카오톡으로 로그인 성공했습니다.")
                continuation.resume(returning: oauthToken)
            }
        }
        
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
        let authToken: OAuthToken? = await withCheckedContinuation { continuation in
            UserApi.shared.loginWithKakaoAccount { [weak self] oauthToken, error in
                guard error != nil else {
                    self?.logger.error("\(error)")
                    continuation.resume(returning: nil)
                    return
                }
                
                guard let oauthToken else {
                    self?.logger.error("OauthToken이 nil입니다.")
                    continuation.resume(returning: nil)
                    return
                }
                    
                self?.logger.debug("카카오계정으로 로그인 성공했습니다.")
                continuation.resume(returning: oauthToken)
            }
        }
        
        // mutate
        self.oauthToken = authToken
    }
    
    func fetchUserData() async {
        // capture
        guard self.oauthToken != nil else {
            logger.error("현재 KakaoManager 객체의 oauthToken 상태가 nil입니다. 로그인을 먼저 시도하세요")
            return
        }
        
        // process
        let userInfo: UserInfo? = await withCheckedContinuation { [weak self] continuation in
            UserApi.shared.me { user, error in
                guard error != nil else {
                    self?.logger.error("\(error)")
                    continuation.resume(returning: nil)
                    return
                }
                
                guard let user = user else {
                    self?.logger.error("User가 nil입니다.")
                    continuation.resume(returning: nil)
                    return
                }
                
                let nickname = user.kakaoAccount?.profile?.nickname
                let imageURL = user.kakaoAccount?.profile?.profileImageUrl
                
                if nickname == nil {
                    self?.logger.error("카카오계정에서 가져온 User 정보에서 profile_nickname 값이 nil입니다.")
                }
                
                if imageURL == nil {
                    self?.logger.error("카카오계정에서 가져온 User 정보에서 profile_image_url 값이 nil입니다.")
                }
                
                self?.logger.debug("카카오에서 사용자 정보를 가져오는데 성공했습니다.")
                let userInfo = UserInfo(nickname: nickname, image: imageURL)
            }
        }
        
        
        // mutate
        self.userInfo = userInfo
    }
    
    
    // MARK: value
    nonisolated struct UserInfo: Sendable, Hashable {
        let nickname: String
        let image: URL?
        
        init(nickname: String?, image: URL?) {
            self.nickname = nickname ?? "익명의 사용자"
            self.image = image
        }
    }
}
