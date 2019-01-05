import SpriteKit
import GameplayKit

class Amoeba: GKEntity {
    
    init(team: Team, entityManager: EntityManager, maxSpeed: Float, maxAcceleration: Float, imageName: String) {
        super.init()
        let texture = SKTexture(imageNamed: imageName)
        let spriteComponent = SpriteComponent(texture: texture)
        addComponent(spriteComponent)
        addComponent(TeamComponent(team: team))
        addComponent(MoveComponent(maxSpeed: maxSpeed, maxAcceleration: maxAcceleration, radius: Float(texture.size().width * 0.3), entityManager: entityManager))
        addComponent(CollisionComponent(entityManager: entityManager))
        addComponent(LaserComponent(delegate: self, entityManager: entityManager))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
