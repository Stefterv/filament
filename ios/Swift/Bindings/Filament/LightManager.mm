//
//  LightManager.mm
//  swift-gltf-viewer
//
//  Created by Stef Tervelde on 30.06.22.
//
#import "Bindings/Filament/LightManager.h"
#import <filament/LightManager.h>
#import "../Math.h"

@implementation LightManager{
    filament::LightManager* nativeManager;
}

- (id) init:(void *)manager{
    self->_manager = manager;
    self->nativeManager = (filament::LightManager*)manager;
    return self;
}

- (size_t)getComponentCount{
    return nativeManager->getComponentCount();
}
- (bool)hasComponent:(Entity)entity{
    return nativeManager->hasComponent(utils::Entity::import(entity));
}
- (EntityInstance)getInstance:(Entity)entity{
    nativeManager->getInstance(utils::Entity::import(entity));
}
- (void)destroy:(Entity)entity{
    nativeManager->destroy(utils::Entity::import(entity));
}
- (Type)getType:(EntityInstance)instance{
    return (Type)nativeManager->getType(instance);
}
- (bool)isDirectional:(EntityInstance)instance{
    return nativeManager->isDirectional(instance);
}
- (bool)isPointLight:(EntityInstance)instance{
    return nativeManager->isPointLight(instance);
}
- (bool)isSpotLight:(EntityInstance)instance{
    return nativeManager->isSpotLight(instance);
}
- (void)setLightChannel:(EntityInstance)instance :(int)channel :(bool)enable{
    nativeManager->setLightChannel(instance, channel, enable);
}
- (bool)getLightChannel:(EntityInstance)instance :(int)channel{
    return nativeManager->getLightChannel(instance, channel);
}
- (void)setPosition:(EntityInstance)instance :(simd_double3)position{
    nativeManager->setPosition(instance, FLOAT3_FROM_SIMD(position));
}
- (simd_double3)getPosition:(EntityInstance)instance{
    return SIMD_DOUBLE3_FROM_FLOAT3(nativeManager->getPosition(instance));
}
- (void)setDirection:(EntityInstance)instance :(simd_double3)direction{
    nativeManager->setDirection(instance, FLOAT3_FROM_SIMD(direction));
}
- (simd_double3)getDirection:(EntityInstance)instance{
    return SIMD_DOUBLE3_FROM_FLOAT3(nativeManager->getDirection(instance));
}
- (void)setColor:(EntityInstance)instance :(simd_double3)linear{
    nativeManager->setColor(instance, FLOAT3_FROM_SIMD(linear));
}
- (simd_double3)getColor:(EntityInstance)instance{
    return SIMD_DOUBLE3_FROM_FLOAT3(nativeManager->getColor(instance));
}
- (void)setIntensity:(EntityInstance)instance :(double)intensity{
    nativeManager->setIntensity(instance, intensity);
}
- (void)setIntensityCandela:(EntityInstance)instance :(double)intensity{
    nativeManager->setIntensityCandela(instance, intensity);
}
- (double)getIntensity:(EntityInstance)instance{
    return nativeManager->getIntensity(instance);
}
- (void)setFalloff:(EntityInstance)instance :(double)falloff{
    nativeManager->setFalloff(instance, falloff);
}
- (double)getFalloff:(EntityInstance)instance{
    return nativeManager->getFalloff(instance);
}
- (void)setSpotLightCone:(EntityInstance)instance :(double)inner :(double)outer{
    nativeManager->setSpotLightCone(instance, inner, outer);
}




@end
