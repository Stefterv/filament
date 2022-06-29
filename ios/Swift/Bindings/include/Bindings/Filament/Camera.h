//
//  Camera.h
//
//  Created by Stef Tervelde on 29.06.22.
//
#import <Foundation/Foundation.h>

#ifndef Camera_h
#define Camera_h

/**
 * Camera represents the eye through which the scene is viewed.
 * <p>
 * A Camera has a position and orientation and controls the projection and exposure parameters.
 *
 * <h1><u>Creation and destruction</u></h1>
 *
 * In Filament, Camera is a component that must be associated with an entity. To do so,
 * use {@link Engine#createCamera(int)}. A Camera component is destroyed using
 * {@link Engine#destroyCameraComponent(int Entity)} ()}.
 *
 * <pre>
 *  Camera myCamera = engine.createCamera(myCameraEntity);
 *  myCamera.setProjection(45, 16.0/9.0, 0.1, 1.0);
 *  myCamera.lookAt(0, 1.60, 1,
 *                  0, 0, 0,
 *                  0, 1, 0);
 *  engine.destroyCameraComponent(myCameraEntity);
 * </pre>
 *
 *
 * <h1><u>Coordinate system</u></h1>
 *
 * The camera coordinate system defines the <b>view space</b>. The camera points towards its -z axis
 * and is oriented such that its top side is in the direction of +y, and its right side in the
 * direction of +x.
 * <p>
 * Since the <b>near</b> and <b>far</b> planes are defined by the distance from the camera,
 * their respective coordinates are -distance<sub>near</sub> and -distance<sub>far</sub>.
 *
 * <h1><u>Clipping planes</u></h1>
 *
 * The camera defines six <b>clipping planes</b> which together create a <b>clipping volume</b>. The
 * geometry outside this volume is clipped.
 * <p>
 * The clipping volume can either be a box or a frustum depending on which projection is used,
 * respectively {@link Projection#ORTHO ORTHO} or {@link Projection#PERSPECTIVE PERSPECTIVE}.
 * The six planes are specified either directly or indirectly using  {@link #setProjection} or
 * {@link #setLensProjection}.
 * <p>
 * The six planes are:
 * <ul>
 * <li> left    </li>
 * <li> right   </li>
 * <li> bottom  </li>
 * <li> top     </li>
 * <li> near    </li>
 * <li> far     </li>
 * </ul>
 * <p>
 *
 * To increase the depth-buffer precision, the <b>far</b> clipping plane is always assumed to be at
 * infinity for rendering. That is, it is not used to clip geometry during rendering.
 * However, it is used during the culling phase (objects entirely behind the <b>far</b>
 * plane are culled).
 *
 * <h1><u>Choosing the <b>near</b> plane distance</u></h1>
 *
 * The <b>near</b> plane distance greatly affects the depth-buffer resolution.
 * <p>
 *
 * Example: Precision at 1m, 10m, 100m and 1Km for various near distances assuming a 32-bit float
 * depth-buffer
 *
 * <center>
 * <table border="1">
 *     <tr>
 *         <th> near (m) </th><th> 1 m </th><th> 10 m </th><th> 100 m</th><th> 1 Km </th>
 *     </tr>
 *     <tr>
 *         <td>0.001</td><td>7.2e-5</td><td>0.0043</td><td>0.4624</td><td>48.58</td>
 *     </tr>
 *     <tr>
 *         <td>0.01</td><td>6.9e-6</td><td>0.0001</td><td>0.0430</td><td>4.62</td>
 *     </tr>
 *     <tr>
 *         <td>0.1</td><td>3.6e-7</td><td>7.0e-5</td><td>0.0072</td><td>0.43</td>
 *     </tr>
 *     <tr>
 *         <td>1.0</td><td>0</td><td>3.8e-6</td><td>0.0007</td><td>0.07</td>
 *     </tr>
 * </table>
 * </center>
 * <p>
 *
 * As can be seen in the table above, the depth-buffer precision drops rapidly with the
 * distance to the camera.
 * <p>
 * Make sure to pick the highest <b>near</b> plane distance possible.
 *
 *
 * <h1><u>Exposure</u></h1>
 *
 * The Camera is also used to set the scene's exposure, just like with a real camera. The lights
 * intensity and the Camera exposure interact to produce the final scene's brightness.
 *
 * @see View
 */

@interface Camera : NSObject

@property (nonatomic, readonly, nonnull) void* camera NS_SWIFT_UNAVAILABLE("Don't access the raw pointers");
- (nonnull id) init: (nonnull void*) camera NS_SWIFT_UNAVAILABLE("Create a new renderer with engine.createRenderer");
- (nonnull id) init NS_UNAVAILABLE;

@end

#endif /* Camera_h */
