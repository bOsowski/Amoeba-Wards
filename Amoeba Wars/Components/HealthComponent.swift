import SpriteKit
import GameplayKit

class HealthComponent : GKComponent {
    
    var maxHealth: Int
    var entityManager: EntityManager
    var delegate: GKEntity
    
    var currentHealth: Int {
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
    
    init(health: Int, delegate: GKEntity, entityManager: EntityManager) {
        self.maxHealth = health
        self.currentHealth = health
        self.entityManager = entityManager
        self.delegate = delegate
        super.init()
    }
    
    func takeDamage(damage: Int) {
        currentHealth -= damage
    }
    
    override func update(deltaTime seconds: TimeInterval) {

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
