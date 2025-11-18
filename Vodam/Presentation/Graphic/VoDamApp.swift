


import SwiftUI
import ComposableArchitecture


// MARK: App
@main
struct VodamApp: App {
    var body: some Scene {
        WindowGroup {
            VoDamView(
                store: Store(
                    initialState: VoDam.State(),
                    reducer: {
                        VoDam()
                    }
                )
            )
        }
    }
}
