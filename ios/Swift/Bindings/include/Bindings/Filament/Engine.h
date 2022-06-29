//
//  Engine.h
//
//  Created by Stef Tervelde on 29.06.22.
//

#ifndef Engine_h
#define Engine_h

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, Backend) {
    Default = 0,
    OpenGL = 1,
    Vulkan = 2,
    Metal = 3,
    Noop = 4,
};

/**
 * Engine is filament's main entry-point.
 * <p>
 * An Engine instance main function is to keep track of all resources created by the user and
 * manage the rendering thread as well as the hardware renderer.
 * <p>
 * To use filament, an Engine instance must be created first:
 *
 * <pre>
 * import Filament
 *
 * let engine = Engine.create();
 * </pre>
 * <p>
 * Engine essentially represents (or is associated to) a hardware context
 * (e.g. an OpenGL ES context).
 * <p>
 * Rendering typically happens in an operating system's window (which can be full screen), such
 * window is managed by a {@link Renderer}.
 *
 * <h1><u>Resource Tracking</u></h1>
 * <p>
 * Each <code>Engine</code> instance keeps track of all objects created by the user, such as vertex
 * and index buffers, lights, cameras, etc...
 * The user is expected to free those resources, however, leaked resources are freed when the
 * engine instance is destroyed and a warning is emitted in the console.
 *
 * <h1><u>Thread safety</u></h1>
 * <p>
 * An <code>Engine</code> instance is not thread-safe. The implementation makes no attempt to
 * synchronize calls to an <code>Engine</code> instance methods.
 * If multi-threading is needed, synchronization must be external.
 *
 * <h1><u>Multi-threading</u></h1>
 * <p>
 * When created, the <code>Engine</code> instance starts a render thread as well as multiple worker
 * threads, these threads have an elevated priority appropriate for rendering, based on the
 * platform's best practices. The number of worker threads depends on the platform and is
 * automatically chosen for best performance.
 * <p>
 * On platforms with asymmetric cores (e.g. ARM's Big.Little), <code>Engine</code> makes some
 * educated guesses as to which cores to use for the render thread and worker threads. For example,
 * it'll try to keep an OpenGL ES thread on a Big core.
 *
 * <h1><u>Swap Chains</u></h1>
 * <p>
 * A swap chain represents an Operating System's <b>native</b> renderable surface.
 * Typically it's a window or a view. Because a {@link SwapChain} is initialized from a native
 * object, it is given to filament as an <code>Object</code>, which must be of the proper type for
 * each platform filament is running on.
 * <p>
 *
 * @see SwapChain
 * @see Renderer
 */


@interface Engine : NSObject
/**
 * Creates an instance of Engine using the default Backend
 * This method is one of the few thread-safe methods.
 *
 * \returns A newly created <code>Engine</code>, or <code>null</code> if the GPU driver couldn't
 *         be initialized, for instance if it doesn't support the right version of OpenGL or
 *         OpenGL ES.
 *
 * \exception IllegalStateException can be thrown if there isn't enough memory to
 * allocate the command buffer.
 *
 */
+ (nonnull instancetype)create;

/**
 * Creates an instance of Engine using the specified {@link Backend}
 * <p>
 * This method is one of the few thread-safe methods.
 *
 * \param backend           driver backend to use
 *
 * \return A newly created <code>Engine</code>, or <code>null</code> if the GPU driver couldn't
 *         be initialized, for instance if it doesn't support the right version of OpenGL or
 *         OpenGL ES.
 *
 * \exception IllegalStateException can be thrown if there isn't enough memory to
 * allocate the command buffer.
 *
 */
+ (nonnull instancetype)create: (Backend)backend;

/**
 * Destroy the Engine instance and all associated resources.
 *
 * Engine.destroy() should be called last and after all other resources have been destroyed,
 * it ensures all filament resources are freed.
 *
 * Destroy performs the following tasks:
 * 1. Destroy all internal software and hardware resources.
 * 2. Free all user allocated resources that are not already destroyed and logs a warning.
 *    This indicates a "leak" in the user's code.
 * 3. Terminate the rendering engine's thread.
 *
 * \param engine Filament Engine to be destroyed.
 *               \p engine is cleared upon return.
 *
 * This method is thread-safe.
 */
+ (void)destroy: (nonnull Engine*)engine;

@property (nonatomic, readonly, nonnull) void* engine NS_SWIFT_UNAVAILABLE("Don't access the raw pointers");
- (nonnull id) init: (nonnull void*) engine NS_SWIFT_UNAVAILABLE("Create a new engine with Engine.create");

@end

#endif /* Engine_h */
