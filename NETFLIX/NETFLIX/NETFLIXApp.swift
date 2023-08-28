//
//  NETFLIXApp.swift
//  NETFLIX
//
//  Created by MUNAVAR PM on 26/08/23.
//

import SwiftUI

@main
struct NETFLIXApp: App {
    @StateObject var viewModel = MovieViewModel()
    var body: some Scene {
        WindowGroup {
            TabBarView()
                .environmentObject(viewModel)
        }
    }
}
