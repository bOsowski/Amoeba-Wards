import SpriteKit
import GameplayKit

class LaserComponent : GKComponent {
    
    var lastFireInterval = TimeInterval(0)
    var entityManager: EntityManager
    var delegate: GKEntity

    
    init(delegate: GKEntity, entityManager: EntityManager) {
        self.entityManager = entityManager
        self.delegate = delegate
        super.init()
    }
    
    override func update(deltaTime seconds: TimeInterval) {
        lastFireInterval += seconds
        if lastFireInterval > TimeInterval(1) {
            for entity in entityManager.entities{
                if(entity.component(ofType: TeamComponent.self)?.team != delegate.component(ofType: TeamComponent.self)?.team && entity.component(ofType: HealthComponent.self) != nil){
                    var laserImage = delegate.component(ofType: TeamComponent.self)?.team.rawValue == "Left" ? ImageName.LaserLeft : ImageName.LaserRight
                    var laser = Laser(team: delegate.component(ofType: TeamComponent.self)!.team, entityManager: entityManager, position: delegate.component(ofType: SpriteComponent.self)!.node.position, damage: (delegate.component(ofType: HealthComponent.self)?.maxHealth)!/2, imageName: laserImage, target: entity.component(ofType: SpriteComponent.self)!)
                    entityManager.add(laser)
                    lastFireInterval = TimeInterval(0)
                    return
                }
            }
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
