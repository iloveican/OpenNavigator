//
//  GLWayOutlineArea.m
//  OpenNavigator
//
//  Created by Anders Arnholm on 2013-07-26.
//
//

#import "GLWayOutlineArea.h"

#import "GLWay.h"

#import "OpenNavNode.h"
#import "OpenNavWay.h"
#import "GLNodes.h"


@interface GLWayOutlineArea (hidden)
-(void) finalize;
@end

@implementation GLWayOutlineArea
@synthesize color = _color;
@synthesize width = _width;


- (id) initWithWay: (OpenNavWay*)way usingNodes: (GLNodes*)nodes andColor:(NSColor *)color andWidth:(GLfloat)width
{
    if (self = [super initWithWay:way usingNodes:nodes]) {
        _color = color;
        _width = width;
        _bufferSize = [[way nodes] count] * sizeof(GLushort) * 2;
        _wayIndices = malloc(_bufferSize);
        _wayShortIndices = malloc(_bufferSize);
        _wayNodes = malloc([[way nodes] count] * sizeof(GLdouble) * 3);
        int cnt = 0;
        GLushort prevIndex = 0;
        GLushort currentIndex = 0;
        GLdouble* nodeVertices = [nodes nodeVertices];
        _count = [[way nodes] count];
        for (NSNumber* node in [way nodes]) {
            currentIndex = [nodes indexOfNodeWithId:node];
            if (cnt > 0) {
                _wayIndices[(cnt-1)*2 + 0] = prevIndex;
                _wayIndices[(cnt-1)*2 + 1] = currentIndex;
            }
            _wayNodes[cnt * 3 + 0] = nodeVertices[currentIndex*3+0];
            _wayNodes[cnt * 3 + 1] = nodeVertices[currentIndex*3+1];
            _wayNodes[cnt * 3 + 2] = nodeVertices[currentIndex*3+2];

            _wayShortIndices[cnt*2 + 0] = cnt;
            _wayShortIndices[cnt*2 + 1] = cnt+1 % _count;


            prevIndex = currentIndex;
            ++cnt;
        }
    }
    return self;
}


- (void)render
{
    [self setLineProperties];
    [self renderLine];
}

- (void)renderLine
{
    glEnableClientState(GL_VERTEX_ARRAY);

    GLdouble* tmp_nodes = _wayNodes;
    GLuint nodeVerticesVBO;
    glGenBuffers(1, &nodeVerticesVBO);
    glBindBuffer(GL_ELEMENT_ARRAY_BUFFER, nodeVerticesVBO);
    glBufferData(GL_ELEMENT_ARRAY_BUFFER, _count * 3 * sizeof(GLdouble), tmp_nodes, GL_STATIC_DRAW);


    glBindBuffer(GL_ARRAY_BUFFER, nodeVerticesVBO);
    glVertexPointer(3, GL_DOUBLE, 3 * sizeof(GLdouble), 0);

    GLuint way1IndicesVBO;
    GLushort* tmp_indices = _wayShortIndices;
    glGenBuffers(1, &way1IndicesVBO);
    glBindBuffer(GL_ELEMENT_ARRAY_BUFFER, way1IndicesVBO);
    glBufferData(GL_ELEMENT_ARRAY_BUFFER, (_count) * 2 * sizeof(GLushort), tmp_indices, GL_STATIC_DRAW);

    glBindBuffer(GL_ELEMENT_ARRAY_BUFFER, way1IndicesVBO);
    glDrawElements(GL_LINES, 2*(_count), GL_UNSIGNED_SHORT, 0);
    glDisableClientState(GL_VERTEX_ARRAY);
    glDeleteBuffers(1, &way1IndicesVBO);
    glDeleteBuffers(1, &nodeVerticesVBO);


}
- (void) setLineProperties
{
    glColor4f([_color redComponent], [_color greenComponent], [_color blueComponent ], [_color alphaComponent]);
    glLineWidth(_width);
}

-(void) finalize
{
    // Free stuff
    free(_wayIndices);
    free(_wayShortIndices);
    free(_wayNodes);
}

@end
