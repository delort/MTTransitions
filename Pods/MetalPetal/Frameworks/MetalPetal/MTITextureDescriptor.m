//
//  MTITextureDescriptor.m
//  Pods
//
//  Created by YuAo on 29/06/2017.
//
//

#import "MTITextureDescriptor.h"

@interface MTITextureDescriptor ()

@property (nonatomic,copy) MTLTextureDescriptor *metalTextureDescriptor;

@property (nonatomic,readonly) NSUInteger hashValue;

@end

@implementation MTITextureDescriptor

- (instancetype)initWithPixelFormat:(MTLPixelFormat)pixelFormat width:(NSUInteger)width height:(NSUInteger)height mipmapped:(BOOL)mipmapped usage:(MTLTextureUsage)usage {
    if (self = [super init]) {
        MTLTextureDescriptor *textureDescriptor = [MTLTextureDescriptor texture2DDescriptorWithPixelFormat:pixelFormat width:width height:height mipmapped:mipmapped];
        textureDescriptor.usage = usage;
        _metalTextureDescriptor = textureDescriptor;
        _hashValue = [textureDescriptor hash];
    }
    return self;
}

- (instancetype)initWithPixelFormat:(MTLPixelFormat)pixelFormat width:(NSUInteger)width height:(NSUInteger)height mipmapped:(BOOL)mipmapped usage:(MTLTextureUsage)usage resourceOptions:(MTLResourceOptions)resourceOptions {
    if (self = [super init]) {
        MTLTextureDescriptor *textureDescriptor = [MTLTextureDescriptor texture2DDescriptorWithPixelFormat:pixelFormat width:width height:height mipmapped:mipmapped];
        textureDescriptor.usage = usage;
        textureDescriptor.resourceOptions = resourceOptions;
        _metalTextureDescriptor = textureDescriptor;
        _hashValue = [textureDescriptor hash];
    }
    return self;
}

- (instancetype)initWithMTLTextureDescriptor:(MTLTextureDescriptor *)textureDescriptor {
    if (self = [super init]) {
        _metalTextureDescriptor = [textureDescriptor copy];
        _hashValue = [textureDescriptor hash];
    }
    return self;
}

+ (instancetype)texture2DDescriptorWithPixelFormat:(MTLPixelFormat)pixelFormat width:(NSUInteger)width height:(NSUInteger)height usage:(MTLTextureUsage)usage {
    return [[MTITextureDescriptor alloc] initWithPixelFormat:pixelFormat width:width height:height mipmapped:NO usage:usage];
}

+ (instancetype)texture2DDescriptorWithPixelFormat:(MTLPixelFormat)pixelFormat width:(NSUInteger)width height:(NSUInteger)height mipmapped:(BOOL)mipmapped usage:(MTLTextureUsage)usage resourceOptions:(MTLResourceOptions)resourceOptions {
    return [[MTITextureDescriptor alloc] initWithPixelFormat:pixelFormat width:width height:height mipmapped:mipmapped usage:usage resourceOptions:resourceOptions];
}

- (id)copyWithZone:(NSZone *)zone {
    return self;
}

- (MTLTextureDescriptor *)newMTLTextureDescriptor {
    return [_metalTextureDescriptor copy];
}

- (BOOL)isEqual:(id)object {
    if (self == object) {
        return YES;
    }
    if ([object isKindOfClass:[MTITextureDescriptor class]]) {
        return [_metalTextureDescriptor isEqual:((MTITextureDescriptor *)object) -> _metalTextureDescriptor];
    }
    return NO;
}

- (NSUInteger)hash {
    return _hashValue;
}

- (MTLTextureType)textureType {
    return _metalTextureDescriptor.textureType;
}

- (MTLPixelFormat)pixelFormat {
    return _metalTextureDescriptor.pixelFormat;
}

- (NSUInteger)width {
    return _metalTextureDescriptor.width;
}

- (NSUInteger)height {
    return _metalTextureDescriptor.height;
}

- (NSUInteger)depth {
    return _metalTextureDescriptor.depth;
}

@end

@implementation MTLTextureDescriptor (MTITextureDescriptor)

- (MTITextureDescriptor *)newMTITextureDescriptor {
    return [[MTITextureDescriptor alloc] initWithMTLTextureDescriptor:self];
}

@end
