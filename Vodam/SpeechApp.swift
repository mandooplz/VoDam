import SwiftUI
import ComposableArchitecture

@main
struct VodamApp: App {
    var body: some Scene {
        WindowGroup {
//            ContentView()
            
            VoDamView(
                store: Store(
                    initialState: VoDam.State(),
                    reducer: {
                        VoDam()
                    }
                )
            )
            
//            AppView(
//                store: Store(
//                    initialState: AppFeature.State(),
//                    reducer: {
//                        AppFeature()
//                    }
//                )
//            )
        }
    }
}
