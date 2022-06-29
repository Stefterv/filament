//
//  Renderer.h
//
//  Created by Stef Tervelde on 29.06.22.
//

#import <Foundation/Foundation.h>

#ifndef Renderer_h
#define Renderer_h

/**
 * A <code>Renderer</code> instance represents an operating system's window.
 *
 * <p>
 * Typically, applications create a <code>Renderer</code> per window. The <code>Renderer</code> generates
 * drawing commands for the render thread and manages frame latency.
 * <br>
 * A Renderer generates drawing commands from a View, itself containing a Scene description.
 * </p>
 *
 * <h1>Creation and Destruction</h1>
 *
 * <p>A <code>Renderer</code> is created using {@link Engine#createRenderer} and destroyed
 * using {@link Engine#destroyRenderer}.</p>
 *
 * @see Engine
 * @see View
 */
@interface Renderer: NSObject

@property (nonatomic, readonly, nonnull) void* renderer NS_SWIFT_UNAVAILABLE("Don't access the raw pointers");
- (nonnull id) init: (nonnull void*) renderer NS_SWIFT_UNAVAILABLE("Create a new renderer with engine.createRenderer");
- (nonnull id) init NS_UNAVAILABLE;

@end

#endif /* Renderer_h */
