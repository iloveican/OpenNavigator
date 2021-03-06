//
//  GLWayHighway.m
//  OpenNavigator
//
//  Created by Anders Arnholm on 2013-07-25.
//
//

#import "GLWayHighway.h"

#import "OpenNavNode.h"
#import "OpenNavWay.h"
#import "GLNodes.h"

@implementation GLWayHighway

- (id) initWithWay: (OpenNavWay*)way usingNodes: (GLNodes*)nodes
{
   if (self = [super initWithWay:way usingNodes:nodes andColor:[NSColor colorWithCalibratedRed:1.0f green:1.0f blue:1.0f alpha:1.0f] andWidth:1.0 andPriority:12]) {
        NSString* waytype = [_navway tagValue:@"highway"];
       if ([waytype isEqualToString:@"secondary"]) {
           _color = [NSColor colorWithCalibratedRed:1.0f green:0.0f blue:0.0f alpha:1.0f];
           _width = 4.0;
       } else if ([waytype isEqualToString:@"tertiary"]) {
           _color = [NSColor colorWithCalibratedRed:0.8f green:0.1f blue:0.1f alpha:1.0f];
           _width = 3.0;
       } else if ([waytype isEqualToString:@"residential"]) {
           _color = [NSColor colorWithCalibratedRed:0.7f green:0.2f blue:0.2f alpha:1.0f];
           _width = 2.0;
       } else if ([waytype isEqualToString:@"living_street"]) {
           _color = [NSColor colorWithCalibratedRed:0.7f green:0.2f blue:0.2f alpha:1.0f];
           _width = 2.0;
       } else if ([waytype isEqualToString:@"unclassified"]) {
           _color = [NSColor colorWithCalibratedRed:0.9f green:0.1f blue:0.2f alpha:1.0f];
           _width = 1.0;
       } else if ([waytype isEqualToString:@"service"]) {
           _color = [NSColor colorWithCalibratedRed:0.9f green:0.1f blue:0.2f alpha:1.0f];
           _width = 1.0;
       } else if ([waytype isEqualToString:@"path"]) {
           _color = [NSColor colorWithCalibratedRed:0.8f green:0.1f blue:0.1f alpha:1.0f];
           _width = 1.0;
       } else if ([waytype isEqualToString:@"footway"]) {
           _color = [NSColor colorWithCalibratedRed:0.8f green:0.0f blue:0.8f alpha:1.0f];
           _width = 1.0;
       } else if ([waytype isEqualToString:@"cycleway"]) {
           _color = [NSColor colorWithCalibratedRed:0.8f green:0.3f blue:0.8f alpha:1.0f];
           _width = 1.0;
       } else if ([waytype isEqualToString:@"pedestrian"]) {
           _color = [NSColor colorWithCalibratedRed:0.8f green:0.0f blue:0.6f alpha:1.0f];
           _width = 1.0;
       } else if ([waytype isEqualToString:@"track"]) {
           _color = [NSColor colorWithCalibratedRed:0.5f green:0.5f blue:0.1f alpha:1.0f];
           _width = 1.0;
       } else {
           NSLog(@"Waytype: unknown %@", waytype);

       }

    }
    return self;
}


//- (void) setLineProperties
//{
//    NSString* waytype = [_navway tagValue:@"highway"];
//    if ([waytype isEqualToString:@"secondary"]) {
//        glColor4f(1.0f, 0.0f, 0.0f, 1.0f);
//        glLineWidth(4.0);
//    } else if ([waytype isEqualToString:@"tertiary"]) {
//        glColor4f(0.8f, 0.1f, 0.1f, 1.0f);
//        glLineWidth(3.0);
//        glLineStipple(1, 0xffff);
//    } else if ([waytype isEqualToString:@"residential"]) {
//        glColor4f(0.7f, 0.2f, 0.2f, 1.0f);
//        glLineWidth(2.0);
//        glLineStipple(3, 0x000f);
//    } else if ([waytype isEqualToString:@"living_street"]) {
//        glColor4f(0.7f, 0.2f, 0.2f, 1.0f);
//        glLineWidth(2.0);
//        glLineStipple(3, 0x000f);
//    } else if ([waytype isEqualToString:@"unclassified"]) {
//        glColor4f(0.9f, 0.5f, 0.3f, 1.0f);
//        glLineWidth(1.0);
//        glLineStipple(3, 0x000f);
//    } else if ([waytype isEqualToString:@"path"]) {
//        glColor4f(0.9f, 0.9f, 0.30f, 1.0f);
//        glLineWidth(1.0);
//        glLineStipple(3, 0x000f);
//    } else if ([waytype isEqualToString:@"footway"]) {
//        glColor4f(0.9f, 0.4f, 0.30f, 1.0f);
//        glLineWidth(1.0);
//        glLineStipple(3, 0x000f);
//    } else if ([waytype isEqualToString:@"cycleway"]) {
//        glColor4f(0.5f, 0.7f, 0.7f, 1.0f);
//        glLineWidth(1.0);
//        glLineStipple(3, 0x000f);
//    } else if ([waytype isEqualToString:@"pedestrian"]) {
//        glColor4f(0.9f, 0.4f, 0.30f, 1.0f);
//        glLineWidth(1.0);
//        glLineStipple(3, 0x000f);
//    } else if ([waytype isEqualToString:@"service"]) {
//        glColor4f(0.9f, 0.4f, 0.30f, 1.0f);
//        glLineWidth(1.0);
//        glLineStipple(3, 0x000f);
//    } else if ([waytype isEqualToString:@"track"]) {
//        glColor4f(0.9f, 0.4f, 0.30f, 1.0f);
//        glLineWidth(1.0);
//        glLineStipple(3, 0x000f);
//    } else {
//        NSLog(@"Waytype: other %@", waytype);
//
//        glColor4f(1.0f, 0.0f, 0.0f, 1.0f);
//        glLineWidth(6.0);
//        glLineStipple(1, 0x00ff);
//    }
//}
@end
