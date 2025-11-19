


import SwiftUI
import ComposableArchitecture
import KakaoSDKAuth


// MARK: App
@main
struct VodamApp: App {
    var body: some Scene {
        WindowGroup {
            VoDamView(
                Store(
                    initialState: VoDam.State(),
                    reducer: {
                        VoDam()
                    }
                )
            )
            .onOpenURL { url in
                if (AuthApi.isKakaoTalkLoginUrl(url)) {
                    AuthController.handleOpenUrl(url: url)
                }
            }
        }
    }
}
