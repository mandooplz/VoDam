


import SwiftUI
import ComposableArchitecture


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
        }
    }
}
