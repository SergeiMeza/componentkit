/*
 *  Copyright (c) 2014-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the BSD-style license found in the
 *  LICENSE file in the root directory of this source tree. An additional grant
 *  of patent rights can be found in the PATENTS file in the same directory.
 *
 */

#import "CKRenderLayoutWithChildrenComponent.h"

#import "CKBuildComponent.h"
#import "CKRenderHelpers.h"
#import "CKRenderTreeNode.h"
#import "CKRenderTreeNodeWithChildren.h"
#import "CKComponentInternal.h"

@implementation CKRenderLayoutWithChildrenComponent

- (std::vector<CKComponent *>)renderChildren:(id)state
{
  return {};
}

- (void)buildComponentTree:(id<CKTreeNodeWithChildrenProtocol>)parent
            previousParent:(id<CKTreeNodeWithChildrenProtocol>)previousParent
                    params:(const CKBuildComponentTreeParams &)params
                    config:(const CKBuildComponentConfig &)config
            hasDirtyParent:(BOOL)hasDirtyParent
{
  CKRender::buildComponentTreeWithMultiChild(self, parent, previousParent, params, config, hasDirtyParent);
}

#pragma mark - CKRenderComponentProtocol

+ (id)initialStateWithComponent:(id<CKRenderComponentProtocol>)component
{
  return [self initialState];
}

+ (id)initialState
{
  return [CKTreeNodeEmptyState emptyState];
}

- (BOOL)isEqualToComponent:(id<CKRenderComponentProtocol>)component
{
  return NO;
}

- (void)didReuseComponent:(id<CKRenderComponentProtocol>)component {}

@end
