//
//  ChatAppApp.swift
//  ChatApp
//
//  Created by Arno van Zyl on 2022/11/01.
//

import SwiftUI
import Firebase

@main
struct ChatAppApp: App {
    @State var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State var timeRemaining: Int = 3
    @State var isLoading: Bool = true
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            if self.isLoading {
                SplashScreenView().onReceive(timer) {_ in
                    if ( timeRemaining > 0 )
                    {
                        timeRemaining -= 1
                    }
                    if (timeRemaining <= 0)
                    {
                        timer.upstream.connect().cancel()
                        isLoading = false
                    }
                }
            }
            else {
                ChatMainView()
            }
        }
    }
}
