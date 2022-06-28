//
//  Material.m
//  Material
//
//  Created by Stef Tervelde on 25/08/2021.
//

#import "Material.h"
#import "MaterialInstance.h"
#import <filament/Material.h>
#import <filament/Engine.h>
#import <vector>

@implementation Material{
    filament::Material* ref;
}

- (MaterialInstance* _Nonnull)createInstance{
    return [[MaterialInstance alloc] initWithRef:self->ref->createInstance()];
}

- (id) initWithRef: (void*) ref{
    self = [super initWithRef:ref];
    self->ref = (filament::Material*)ref;
    return self;
}

@end


@implementation MaterialBuilder{
    filament::Material::Builder* ref;
    std::vector<uint8_t> buffer;
}

- (MaterialBuilder*) package: (NSArray*) bytes{
    std::vector<uint8_t> buffer(0);
    for (NSNumber* byte in bytes) {
        buffer.push_back([byte unsignedCharValue]);
    }
//    self->ref->package(buffer.data(), buffer.size());
    
    self->buffer = buffer;
//    buffer.clear();
//    buffer.shrink_to_fit();
    return self;
}
- (Material*) build: (Engine*) engine{
    self->ref->package(self->buffer.data(), self->buffer.size());
    auto mat = self->ref->build(*(filament::Engine*)engine.ref);
    return [[Material alloc] initWithRef:mat];
}

- (id) init{
    self = [super init];
    self = [self initWithRef:new filament::Material::Builder()];
    return self;
}

- (id) initWithRef: (void*) ref{
    self = [super initWithRef:ref];
    self->ref = (filament::Material::Builder*)ref;
    return self;
}


@end
