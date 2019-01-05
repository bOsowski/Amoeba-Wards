import SpriteKit
import GameplayKit

class TimedDeathComponent : GKComponent {
    
    var totalTimeInterval = TimeInterval(0)
    var entityManager: EntityManager
    var delegate: GKEntity
    var timeToKillSinceInit: Float
    
    
    init(delegate: GKEntity, entityManager: EntityManager, timeToKillSinceInit: Float) {
        self.entityManager = entityManager
        self.delegate = delegate
        self.timeToKillSinceInit = timeToKillSinceInit
        super.init()
    }
    
    override func update(deltaTime seconds: TimeInterval) {
        totalTimeInterval += seconds
        if totalTimeInterval > TimeInterval(timeToKillSinceInit) {
             entityManager.remove(delegate)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
