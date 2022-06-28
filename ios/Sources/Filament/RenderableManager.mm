//
//  RenderableManager.m
//  RenderableManager
//
//  Created by Stef Tervelde on 21/09/2021.
//

#import "RenderableManager.h"
#import <filament/RenderableManager.h>
#import <filament/VertexBuffer.h>
#import <filament/IndexBuffer.h>
#import <geometry/SurfaceOrientation.h>
#import <utils/Entity.h>
#import <vector>

#import <math/half.h>
using namespace filament::math;

@implementation RenderableManager

+ (RenderableManagerBuilder*) Builder:(int)count{
    return [[RenderableManagerBuilder alloc] initWithRef:new filament::RenderableManager::Builder(count)];
}


@end

@implementation RenderableManagerBuilder{
    filament::RenderableManager::Builder* ref;
}

- (instancetype) geometry: (Engine*) engine :(int) index :(PrimitiveType) type :(ARPlaneGeometry*) plane{
    const auto deleter = [](void* buffer, size_t size, void* user) {
       delete (uint8_t*) buffer;
    };
    
    auto indexCount = plane.triangleCount * 3;

    auto verts = new float4[plane.vertexCount];
    auto indices = new uint16_t[indexCount];
    std::copy((float4*)plane.vertices,(float4*)plane.vertices + plane.vertexCount, verts);
    std::copy(plane.triangleIndices, plane.triangleIndices + indexCount, indices);
    
    auto planeVertices = filament::VertexBuffer::Builder()
            .vertexCount((uint32_t) plane.vertexCount)
            .bufferCount(2)
    // The position buffer only has x y and z coordinates, but has the same padding as a float4.
        .attribute(filament::VertexAttribute::POSITION, 0, filament::VertexBuffer::AttributeType::FLOAT3, 0, sizeof(float4))
        .attribute(filament::VertexAttribute::TANGENTS, 1, filament::VertexBuffer::AttributeType::FLOAT4, 0, sizeof(quatf))
        .build(*(filament::Engine*)engine.ref);
    auto planeIndices = filament::IndexBuffer::Builder()
        .indexCount((uint32_t) indexCount)
        .bufferType(filament::IndexBuffer::IndexType::USHORT)
        .build(*(filament::Engine*)engine.ref);
    
    quatf* quats = new quatf[plane.vertexCount];
    static float3 normals[1] = { float3(0, 1, 0) };
    auto helper = filament::geometry::SurfaceOrientation::Builder()
            .vertexCount(1)
            .normals(normals)
            .build();
    helper->getQuats(quats, 1);
    delete helper;
    for (int i = 1; i < plane.vertexCount; i++) {
        quats[i] = quats[0];
    }
    
    filament::VertexBuffer::BufferDescriptor positionBuffer(verts, plane.vertexCount * sizeof(float4), deleter);
    filament::VertexBuffer::BufferDescriptor tangentbuffer(quats, plane.vertexCount * sizeof(quatf), deleter);
    filament::IndexBuffer::BufferDescriptor indexBuffer(indices, indexCount * sizeof(uint16_t), deleter);
    planeVertices->setBufferAt(*(filament::Engine*)engine.ref, 0, std::move(positionBuffer));
    planeVertices->setBufferAt(*(filament::Engine*)engine.ref, 1, std::move(tangentbuffer));
    planeIndices->setBuffer(*(filament::Engine*)engine.ref, std::move(indexBuffer));
    
    self->ref->geometry(index, filament::RenderableManager::PrimitiveType::TRIANGLES, planeVertices, planeIndices, 0, indexCount);
    
    return self;
}

- (instancetype) geometry:(Engine*)engine :(int)index :(PrimitiveType)type :(const Vertex*)vertices :(NSInteger) vertexCount :(const NSInteger*)indices :(NSInteger) indexCount{

    const auto deleter = [](void* buffer, size_t size, void* user) {
       delete (uint8_t*) buffer;
    };
    
    // create a new buffer on the heap
    auto verts = new Vertex[vertexCount];
    std::copy(vertices, vertices + vertexCount, verts);
 
    auto vertexBuffer = filament::VertexBuffer::Builder()
        .vertexCount(3)
        .bufferCount(1)
        .attribute(filament::VertexAttribute::POSITION, 0, filament::VertexBuffer::AttributeType::FLOAT4, offsetof(Vertex, x), sizeof(Vertex))
        .attribute(filament::VertexAttribute::UV0, 0, filament::VertexBuffer::AttributeType::FLOAT2, offsetof(Vertex, u), sizeof(Vertex))
        .build(*(filament::Engine*)engine.ref);
    ;
    
    vertexBuffer->setBufferAt(*(filament::Engine*)engine.ref, 0, filament::VertexBuffer::BufferDescriptor(verts, vertexCount * sizeof(Vertex), deleter));
    
    // create a new buffer on the heap
    auto inds = new uint16_t[indexCount];
    std::copy(indices, indices + indexCount, inds);
    
    
    auto indexBuffer = filament::IndexBuffer::Builder()
        .indexCount(3)
        .bufferType(filament::IndexBuffer::IndexType::USHORT)
        .build(*(filament::Engine*)engine.ref);
    
    indexBuffer->setBuffer(*(filament::Engine*)engine.ref,  filament::IndexBuffer::BufferDescriptor(inds, indexCount * sizeof(uint16_t), deleter));
    
    self->ref->geometry(index, filament::RenderableManager::PrimitiveType::TRIANGLES, vertexBuffer, indexBuffer);
    
    return self;
}

- (instancetype) materials:(int)index :(MaterialInstance *)material{
    self->ref->material(index, (filament::MaterialInstance*)material.ref);
    return self;
}

- (instancetype) receiveShadows:(bool)enabled{
    self->ref->receiveShadows(enabled);
    return self;
}

- (instancetype) castShadows:(bool)enabled{
    self->ref->castShadows(enabled);
    return self;
}

- (instancetype) culling:(bool)enabled{
    self->ref->culling(enabled);
    return self;
}

- (void) build:(Engine *)engine :(Entity *)entity{
    self->ref->build(*(filament::Engine*)engine.ref, utils::Entity::import(entity.ref));
}

- (id) initWithRef: (void*) ref{
    self = [super initWithRef:ref];
    self->ref = (filament::RenderableManager::Builder*)ref;
    return self;
}

@end
