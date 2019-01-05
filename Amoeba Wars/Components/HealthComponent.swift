import SpriteKit
import GameplayKit

class HealthComponent : GKComponent {
    
    var maxHealth: Float
    var entityManager: EntityManager
    var delegate: GKEntity
    
    var currentHealth: Float {
        didSet {
            if currentHealth > maxHealth {
                currentHealth = maxHealth
            }
            else if currentHealth <= 0 {
                currentHealth = 0
                entityManager.remove(delegate)
            }
        }
    }
    
    init(health: Float, delegate: GKEntity, entityManager: EntityManager) {
        self.maxHealth = health
        self.currentHealth = health
        self.entityManager = entityManager
        self.delegate = delegate
        super.init()
    }
    
    func takeDamage(damage: Float) {
        currentHealth -= damage
    }
    
    override func update(deltaTime seconds: TimeInterval) {

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
