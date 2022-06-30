//
//  Scene.swift
//  swift-gltf-viewer
//
//  Created by Stef Tervelde on 30.06.22.
//


import SwiftUI
import MetalKit
import Filament
import SceneKit

class FilaSceneProps : ObservableObject{
    @Published var size = CGSize(width: 0, height: 0)
    
    let engine : Filament.Engine
    let renderer : Filament.Renderer
    var swapchain : Filament.SwapChain?
    
//    let assetLoader: glTFIO.AssetLoader
//    let materialProvider: glTFIO.MaterialProvider
//    let resourceLoader: glTFIO.ResourceLoader
    
    let scene: Filament.Scene
    let view: Filament.View
    
    let camera: Filament.Camera
    
    var link: CADisplayLink?
    var uiview: UIView?
    init(){
        engine = Filament.Engine.create()
        renderer = engine.createRenderer()
        
        scene = engine.createScene()
        view = engine.createView()
        
        view.viewport = Viewport(left: 0, bottom: 0, width: 256, height: 256)
        
        camera = engine.createCamera( Utils.EntityManager.get().create())
        
        view.scene = scene
        view.camera = camera
        
//        materialProvider = glTFIO.MaterialProvider(engine)
//
//        assetLoader = glTFIO.AssetLoader(engine, materialProvider)
//
//        let opt = glTFIO.ResourceLoader.Options()
//
//        resourceLoader = glTFIO.ResourceLoader(engine, opt)
        
        // Load Object
        
        // Load Lighting
        
    }
    func setClear(color: CIColor){
        let opt = Renderer.ClearOptions()
        opt.clearColor = CIColor.blue
        opt.clear = true
        opt.discard = true
        renderer.setClearOptions(opt)
    }
    func setupSwapchain(_ view: UIView){
        uiview = view
        if let layer = view.layer as? CAMetalLayer{
            layer.pixelFormat = MTLPixelFormat.bgra8Unorm
            swapchain = engine.createSwapChain(layer)
            
          
            
            link = CADisplayLink(target: self as Any, selector: #selector(renderloop));
            link?.add(to: RunLoop.current, forMode: .common)
        }
    }
    @objc func renderloop(){
        guard let swapchain = swapchain else {
            return
        }

        if(renderer.beginFrame(swapchain)){
            renderer.render(view);
            renderer.endFrame();
        }
    }
    func resize(_ newSize: CGSize){
        if let layer = uiview?.layer as? CAMetalLayer{
            let scale = UIScreen.main.nativeScale
            size = CGSize(width: newSize.width * scale, height: newSize.height * scale)
            layer.drawableSize = size
            
            view.viewport = Viewport(left: 0, bottom: 0, width: Int32(size.width), height: Int32(size.height))
            
            let origin = SCNNode()
            origin.position = SCNVector3(0, 0, -0.2)
            
            // TODO: Move to own entity
            camera.setLensProjection(50, size.width/size.height, 0.01, 10)
            camera.lookAt(origin.simdPosition, SCNNode().simdPosition, SCNNode().simdWorldUp)
        }
    }
    static func getFile(forResource resource: String, withExtension fileExt: String?) -> [UInt8]? {
        guard let fileUrl: URL = Bundle.main.url(forResource: resource, withExtension: fileExt) else {
            return nil
        }
        
        do {
            let rawData: Data = try Data(contentsOf: fileUrl)
            return [UInt8](rawData)
        } catch {
            return nil
        }
    }
}
struct FilaScene<Content: SwiftUI.View>: SwiftUI.View {
    let inside: () -> Content
    
    @StateObject var state = FilaSceneProps()
    
    @Environment(\.colorScheme) var colorScheme
    
    init(@ViewBuilder _ inside: @escaping () -> Content) {
        self.inside = inside
    }
    
    var body: some SwiftUI.View {
        inside()
            .overlay(GeometryReader{ reader in Spacer().onAppear{ state.resize(reader.size) }.onChange(of: reader.size){ state.resize($0) } }.ignoresSafeArea())
            .background(FilaSceneMetalLayer().ignoresSafeArea())
            .environmentObject(state)
            .task(id: colorScheme){ state.setClear(color: colorScheme == .light ? .white : .black) }
    }
}


struct FilaSceneMetalLayer : UIViewControllerRepresentable{
    @EnvironmentObject var state: FilaSceneProps
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
    func makeUIViewController(context: Context) -> some UIViewController {
        let controller = Controller()
        state.setupSwapchain(controller.view)
        return controller
    }
    class Controller: UIViewController{
        override func loadView() {
           view = View()
       }
    }
    class View: UIView{
        override class var layerClass: AnyClass{
            return CAMetalLayer.self;
        }
    }
}


