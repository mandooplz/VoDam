//
//  KakaoManager.swift
//  Vodam
//
//  Created by 김민우 on 11/20/25.
//
import Foundation
import KakaoSDKAuth
import KakaoSDKCommon


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
    func checkKakaoAppExist() async throws {
        
    }
    func loginWithKakao() async throws {
        
    }
}
