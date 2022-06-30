//
//  LightManager.h
//  swift-gltf-viewer
//
//  Created by Stef Tervelde on 30.06.22.
//
#import <Foundation/Foundation.h>
#import "../Utils/Entity.h"

#ifndef LightManager_h
#define LightManager_h


@interface LightManager : NSObject

/**
 * LightManager allows you to create a light source in the scene, such as a sun or street lights.
 * <p>
 * At least one light must be added to a scene in order to see anything
 * (unless the {@link Material.Shading#UNLIT} is used).
 * </p>
 *
 * <h1><u>Creation and destruction</u></h1>
 * <p>
 * A Light component is created using the {@link LightManager.Builder} and destroyed by calling
 * {@link LightManager#destroy}.
 * </p>
 * <pre>
 *  Engine engine = Engine.create();
 *  int sun = EntityManager.get().create();
 *
 *  LightManager.Builder(Type.SUN)
 *              .castShadows(true)
 *              .build(engine, sun);
 *
 *  engine.getLightManager().destroy(sun);
 * </pre>
 *
 * <h1><u>Light types</u></h1>
 *
 * Lights come in three flavors:
 * <ul>
 * <li>directional lights</li>
 * <li>point lights</li>
 * <li>spot lights</li>
 * </ul>
 *
 *
 * <h2><u>Directional lights</u></h2>
 * <p>
 * Directional lights have a direction, but don't have a position. All light rays are
 * parallel and come from infinitely far away and from everywhere. Typically a directional light
 * is used to simulate the sun.
 * </p>
 * <p>
 * Directional lights and spot lights are able to cast shadows.
 * </p>
 * <p>
 * To create a directional light use {@link Type#DIRECTIONAL} or {@link Type#SUN}, both are similar,
 * but the later also draws a sun's disk in the sky and its reflection on glossy objects.
 * </p>
 * <p>
 * <b>warning:</b> Currently, only a single directional light is supported. If several directional lights
 * are added to the scene, the dominant one will be used.
 * </p>
 *
 * <h2><u>Point lights</u></h2>
 *
 * Unlike directional lights, point lights have a position but emit light in all directions.
 * The intensity of the light diminishes with the inverse square of the distance to the light.
 * {@link Builder#falloff} controls the distance beyond which the light has no more influence.
 * <p>
 * A scene can have multiple point lights.
 * </p>
 *
 * <h2><u>Spot lights</u></h2>
 * <p>
 * Spot lights are similar to point lights but the light they emit is limited to a cone defined by
 * {@link Builder#spotLightCone} and the light's direction.
 * </p>
 * <p>
 * A spot light is therefore defined by a position, a direction and inner and outer cones. The
 * spot light's influence is limited to inside the outer cone. The inner cone defines the light's
 * falloff attenuation.
 * </p>
 * A physically correct spot light is a little difficult to use because changing the outer angle
 * of the cone changes the illumination levels, as the same amount of light is spread over a
 * changing volume. The coupling of illumination and the outer cone means that an artist cannot
 * tweak the influence cone of a spot light without also changing the perceived illumination.
 * It therefore makes sense to provide artists with a parameter to disable this coupling. This
 * is the difference between {@link Type#FOCUSED_SPOT} (physically correct) and {@link Type#SPOT}
 * (decoupled).
 * </p>
 *
 * <h1><u>Performance considerations</u></h1>
 * <p>
 * Generally, adding lights to the scene hurts performance, however filament is designed to be
 * able to handle hundreds of lights in a scene under certain conditions. Here are some tips
 * to keep good performance.
 * </p>
 * <ul>
 * <li> Prefer spot lights to point lights and use the smallest outer cone angle possible.</li>
 * <li> Use the smallest possible falloff distance for point and spot lights.
 *    Performance is very sensitive to overlapping lights. The falloff distance essentially
 *    defines a sphere of influence for the light, so try to position point and spot lights
 *    such that they don't overlap too much.</li>
 *    On the other hand, a scene can contain hundreds of non overlapping lights without
 *    incurring a significant overhead.
 * </ul>
 */
@property (nonatomic, readonly, nonnull) void* manager  NS_SWIFT_UNAVAILABLE("Don't access the raw pointers");
- (nonnull id) init: (nonnull void*) manager NS_SWIFT_UNAVAILABLE("Create a new renderer with engine.createRenderer");
- (nonnull id) init NS_UNAVAILABLE;

/**
 * Returns the number of components in the LightManager, note that components are not
 * guaranteed to be active. Use the {@link EntityManager#isAlive} before use if needed.
 *
 * @return number of component in the LightManager
 */
- (int) getComponentCount;
/**
 * Returns whether a particular Entity is associated with a component of this LightManager
 * @param entity An Entity.
 * @return true if this Entity has a component associated with this manager.
 */
- (bool) hasComponent: (Entity) entity;

/**
 * Gets an Instance representing the Light component associated with the given Entity.
 * @param entity An Entity.
 * @return An Instance object, which represents the Light component associated with the Entity entity.
 *         The instance is 0 if the component doesn't exist.
 * @see #hasComponent
 */
- (EntityInstance) getInstance: (Entity) entity;

/**
 * Destroys this component from the given entity
 * @param entity An Entity.
 */
- (void) destroy: (Entity) entity;

typedef NS_ENUM(NSInteger, Type) {
    Sun = 0,
    Directional = 1,
    POINT = 2,
    FocusedSpot = 3,
    Spot = 4
};
- (Type) getType: (EntityInstance) instance;
- (bool) isDirectional: (EntityInstance) instance;
- (bool) isPointLight: (EntityInstance) instance;
- (bool) isSpotLight: (EntityInstance) instance;
/**
 * Enables or disables a light channel.
 * Light channel 0 is enabled by default.
 *
 * @param i        Instance of the component obtained from getInstance().
 * @param channel  Light channel to set
 * @param enable   true to enable, false to disable
 *
 * @see Builder#lightChannel
 */
- (void) setLightChannel: (EntityInstance) instance :(int) channel :(bool) enable;
/**
 * Returns whether a light channel is enabled on a specified renderable.
 * @param i        Instance of the component obtained from getInstance().
 * @param channel  Light channel to query
 * @return         true if the light channel is enabled, false otherwise
 */
- (bool) getLightChannel: (EntityInstance) instance :(int) channel;



@end





#endif /* LightManager_h */
