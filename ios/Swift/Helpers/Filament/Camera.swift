//
//  Camera.swift
//
//  Created by Stef Tervelde on 30.06.22.
//

import FilamentBindings

extension Camera{
    public var position: simd_double3{
        getPosition()
    }
    public var left: simd_double3{
        getLeftVector()
    }
    public var up: simd_double3{
        getUpVector()
    }
    public var forward: simd_double3{
        getForwardVector()
    }
    /**
     * Sets this camera's exposure directly. Calling this method will set the aperture
     * to 1.0, the shutter speed to 1.2 and the sensitivity will be computed to match
     * the requested exposure (for a desired exposure of 1.0, the sensitivity will be
     * set to 100 ISO).
     *
     * This method is useful when trying to match the lighting of other engines or tools.
     * Many engines/tools use unit-less light intensities, which can be matched by setting
     * the exposure manually. This can be typically achieved by setting the exposure to
     * 1.0.
     *
     * @see LightManager
     * @see #setExposure(float, float, float)
     */
    public func setExposure(_ exposure: Double){
        self.setExposure(1.0, 1.2, 100.0 * (1.0 / exposure))
    }
    public var aperture: Double{
        getAperture()
    }
    public var shutterSpeed: Double{
        getShutterSpeed()
    }
    public var focalLength: Double{
        getFocalLength()
    }
    public var focusDistance: Double{
        get{
            getFocusDistance()
        }
        set{
            setFocusDistance(newValue)
        }
    }
}
