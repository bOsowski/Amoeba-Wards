import Foundation
import SpriteKit
import GameplayKit

class CollisionComponent: GKComponent {
    
    let entityManager: EntityManager
    
    init(entityManager: EntityManager) {
        self.entityManager = entityManager
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func update(deltaTime seconds: TimeInterval) {
        super.update(deltaTime: seconds)
        
        for entity in entityManager.entities{
            for otherEntity in entityManager.entities {
                if(entity != otherEntity && entity.component(ofType: TeamComponent.self)?.team != otherEntity.component(ofType: TeamComponent.self)?.team){
                    if (entity.component(ofType: SpriteComponent.self)!.node.calculateAccumulatedFrame().intersects(otherEntity.component(ofType: SpriteComponent.self)!.node.calculateAccumulatedFrame())) {
                        if(entity.component(ofType: HealthComponent.self) != nil && otherEntity.component(ofType: HealthComponent.self) != nil){
                            let damageToDealToEntity = otherEntity.component(ofType: HealthComponent.self)!.currentHealth
                            let damageToDealToOtherEntity = entity.component(ofType: HealthComponent.self)!.currentHealth
                            entity.component(ofType: HealthComponent.self)?.takeDamage(damage: damageToDealToEntity)
                            otherEntity.component(ofType: HealthComponent.self)?.takeDamage(damage: damageToDealToOtherEntity)
                        }
                    }
                }
            }
        }
    }
    
}
