import SwiftUI
import ComposableArchitecture

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
