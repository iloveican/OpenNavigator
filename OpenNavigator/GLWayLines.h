//
//  GLWayLines.h
//  OpenNavigator
//
//  Created by Anders Arnholm on 2013-07-25.
//
//

#import "GLWay.h"

@interface GLWayLines : GLWay
{
@protected
    NSDictionary* _nodes;
    NSMutableDictionary* _indexes;
    GLushort* _wayIndices;
    GLushort* _wayShortIndices;
    GLdouble* _wayNodes;
    size_t _bufferSize;
    NSUInteger _count;
    GLfloat _width;
    NSColor* _color;
}
@property NSColor* color;
@property GLfloat width;

- (id) initWithWay:(OpenNavWay *)way usingNodes:(GLNodes *)nodes andColor: (NSColor*)color andWidth:(GLfloat)width;

- (void) setLineProperties;
- (void) renderLine;

@end