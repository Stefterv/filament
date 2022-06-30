//
//  Math.h
//  swift-gltf-viewer
//
//  Created by Stef Tervelde on 30.06.22.
//

#ifndef Math_h
#define Math_h

#import <math/mat4.h>
#import <simd/simd.h>

#define FILAMENT_MAT4_FROM_SIMD(m) (filament::math::mat4 \
        (m.columns[0][0], m.columns[0][1], m.columns[0][2], m.columns[0][3], \
         m.columns[1][0], m.columns[1][1], m.columns[1][2], m.columns[1][3], \
         m.columns[2][0], m.columns[2][1], m.columns[2][2], m.columns[2][3], \
         m.columns[3][0], m.columns[3][1], m.columns[3][2], m.columns[3][3]))

#endif /* Math_h */
