//
//  View.h
//  View
//
//  Created by Stef Tervelde on 23/08/2021.
//

#import "Scene.h"
#import "Camera.h"
#import "FSObject.h"

#ifndef View_h
#define View_h


typedef struct
{
    float x;
    float y;
    float width;
    float height;
} Viewport;

NS_SWIFT_NAME(Filament.View)
@interface View : FSObject

- (void) setScene: (Scene*) scene;
- (void) setCamera: (Camera*) camera;
- (void) setViewport: (Viewport) viewport;

@end


#endif /* View_h */
