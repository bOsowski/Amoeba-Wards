import SpriteKit
import GameplayKit

class Laser: GKEntity {
    
    init(team: Team, entityManager: EntityManager, position: CGPoint, damage: Float, imageName: String, target: SpriteComponent) {
        super.init()
        let texture = SKTexture(imageNamed: imageName)
        let spriteComponent = SpriteComponent(texture: texture)
        addComponent(spriteComponent)
        addComponent(TeamComponent(team: team))
        let healthComponent = HealthComponent(health: damage, delegate: self, entityManager: entityManager)
        addComponent(healthComponent)
        addComponent(CollisionComponent(entityManager: entityManager))
        addComponent(TimedDeathComponent(delegate: self, entityManager: entityManager, timeToKillSinceInit: 5))
        spriteComponent.node.position = position
        spriteComponent.node.physicsBody = SKPhysicsBody()
        spriteComponent.node.physicsBody!.affectedByGravity = false
        spriteComponent.node.physicsBody!.velocity = CGVector(dx: target.node.position.x - position.x, dy: target.node.position.y - position.y)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
