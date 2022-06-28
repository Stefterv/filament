//
//  Filament.m
//  Filament
//
//  Created by Stef Tervelde on 25/08/2021.
//
#import "Global.h"
#import <filament/Engine.h>
#import <filament/Scene.h>
#import <filament/MaterialInstance.h>
#import <utils/EntityManager.h>
#import <filament/RenderableManager.h>
#import <filament/LightManager.h>
#import <filament/IndirectLight.h>
#import <filament/Skybox.h>
#import <math/vec3.h>
#import <gltfio/FilamentAsset.h>
#import "Engine.h"
#import "FilamentAsset.h"
#import "Material.h"


@implementation Global

+ (void) setAssetMaterial: (Engine*) engine :(FilamentAsset*) asset :(MaterialInstance*) material{
    auto fEngine = (filament::Engine*)engine.ref;
    auto fAsset = (gltfio::FilamentAsset*)asset.ref;
    auto mat = (filament::MaterialInstance*)material.ref;
    auto manager = &(fEngine->getRenderableManager());
    auto ent = fAsset->getEntities()[0];
    auto inst = manager->getInstance(ent);
    manager->setMaterialInstanceAt(inst, 0, mat);
    
}

+ (void) setupLighting: (Engine*) engine :(Scene*) scene{
    auto _scene = (filament::Scene*)scene.ref;
    auto _engine = (filament::Engine*)engine.ref;
    
    
    auto light = utils::EntityManager::get().create();
    filament::LightManager::Builder(filament::LightManager::Type::DIRECTIONAL)
        .color(filament::Color::cct(6500.0f))
        .build(*_engine, light);
    
    _scene->addEntity(light);
}

+ (void) setupIBL: (Engine*) engine :(Scene*) scene : (const uint8_t*) iblBytes :(NSInteger) iblCount :(const uint8_t*) skyBytes :(NSInteger) skyCount {
    auto _engine = (filament::Engine*)engine.ref;
    auto _scene = (filament::Scene*)scene.ref;
    
//    auto iblBundle = new image::KtxBundle(iblBytes,iblCount);
//    filament::math::float3 harmonics[9];
//    iblBundle->getSphericalHarmonics(harmonics);
//    auto iblTexture = image::ktx::createTexture(_engine, iblBundle, false);
//    auto indirectLight = filament::IndirectLight::Builder()
//        .reflections(iblTexture)
//        .irradiance(3, harmonics)
//        .intensity(30000)
//        .build(*_engine);
//    _scene->setIndirectLight(indirectLight);
    
    auto sun = utils::EntityManager::get().create();
    filament::LightManager::Builder(filament::LightManager::Type::SUN)
        .castShadows(true)
        .direction({0.0, -1.0, 0.0})
        .build(*_engine, sun);
//    _scene->addEntity(sun)
}

@end
