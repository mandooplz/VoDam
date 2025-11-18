


import SwiftUI
import ComposableArchitecture


// MARK: App
@main
struct VodamApp: App {
    var body: some Scene {
        WindowGroup {
            VoDamView(
                store: Store(
                    initialState: MyHome.State(),
                    reducer: {
                        MyHome()
                    }
                )
            )
        }
    }
}
