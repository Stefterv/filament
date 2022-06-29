//
//  GltfViewer.swift
//  swift-gltf-viewer
//
//  Created by Stef Tervelde on 29.06.22.
//

import SwiftUI
import Filament

@main
struct GltfViewer: App{
    var body: some Scene{
        WindowGroup{
            Text("Test")
                .onAppear{
                    Engine.create()
                }
        }
    }
}
