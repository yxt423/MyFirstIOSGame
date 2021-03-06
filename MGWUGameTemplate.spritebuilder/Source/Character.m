//
//  Character.m
//  MGWUGameTemplate
//
//  Created by Xintong Yu on 2/20/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

#import "Character.h"
#import "GameManager.h"

@implementation Character {
    GameManager* _gameManager;
}

- (void)didLoadFromCCB {
    self.physicsBody.collisionType = @"character";
    _gameManager = [GameManager getGameManager];
}

- (void)jump {
    self.physicsBody.velocity = ccp(0.f, 0.f);
    [self.physicsBody applyImpulse:ccp(0.f, 300.f)];
}

- (void)jumpHigh {
    self.physicsBody.velocity = ccp(0.f, 0.f);
    [self.physicsBody applyImpulse:ccp(0.f, 450.f)];
}

- (void)moveLeft {
    [self.physicsBody applyImpulse:ccp(-150.f, 0.f)];
}

- (void)moveRight {
    [self.physicsBody applyImpulse:ccp(150.f, 0.f)];
}

- (void)stop {
    self.physicsBody.velocity = ccp(0.f, 0.f);
}

- (void)bubbleUp {
    self.physicsBody.velocity = ccp(0.f, 0.f);
    [self.physicsBody applyImpulse:ccp(0.f, 1000.f)];
}

- (void)tapGestureCharacterMove: (CGPoint)point {
    // if tap on left side of character, or very left of the screen, jump left.
    if (point.x < 40) {
        [self moveLeft];
    } else if (_gameManager.screenWidthInPoints - point.x < 40 ) {
        [self moveRight];
    } else if (point.x < self.positionInPoints.x) {
        [self moveLeft];
    } else {
        [self moveRight];
    }
}

@end
