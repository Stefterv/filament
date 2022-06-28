//
//  Renderer.h
//  Renderer
//
//  Created by Stef Tervelde on 19/08/2021.
//
#import "FSObject.h"
#import "View.h"
#import "SwapChain.h"

#ifndef Renderer_h
#define Renderer_h




/**
 * A Renderer instance represents an operating system's window.
 *
 * Typically, applications create a Renderer per window. The Renderer generates drawing commands
 * for the render thread and manages frame latency.
 *
 * A Renderer generates drawing commands from a View, itself containing a Scene description.
 *
 * Creation and Destruction
 * ========================
 *
 * A Renderer is created using Engine.createRenderer() and destroyed using
 * Engine.destroy(const Renderer*).
 *
 * ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 * #import <filament/Renderer.h>
 * #import <filament/Engine.h>
 * using namespace filament;
 *
 * Engine* engine = Engine::create();
 *
 * Renderer* renderer = engine->createRenderer();
 * engine->destroy(&renderer);
 * ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 *
 * @see Engine, View
 */
NS_SWIFT_NAME(Filament.Renderer)
@interface Renderer : FSObject

- (void) setClearOptions: (float) r :(float) g :(float) b :(float) a :(bool) clear :(bool) discard;
- (bool) beginFrame: (SwapChain*) swapchain;
- (void) endFrame;
- (void) render: (View*) view;

@end

#endif /* Renderer_h */

