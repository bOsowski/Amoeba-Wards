import SpriteKit
import GameplayKit

class AIComponent : GKComponent {
    
    var lastSpawnInterval = TimeInterval(0)
    var waitTime = TimeInterval(0)
    let entityManager: EntityManager
    var coins: Int?
    
    enum Amoeba : UInt32 {
        case Proteus
        case Fowleri
        case Histolytica
        
        //todo: add more sophisticated probablility
        
        static func randomAmoeba() -> Amoeba {
            let rand = arc4random_uniform(3)
            return Amoeba(rawValue: rand)!
        }
    }
    
    init(entityManager: EntityManager) {
        self.entityManager = entityManager
        self.coins = 0
        super.init()
    }
    
    override func update(deltaTime seconds: TimeInterval) {
        super.update(deltaTime: seconds)
        coins = entityManager.base(for: .teamRight)?.component(ofType: BaseComponent.self)?.coins
        let spawnInterval = TimeInterval(0.75)
        if CACurrentMediaTime() - lastSpawnInterval > spawnInterval {
            lastSpawnInterval = CACurrentMediaTime()
            switch Amoeba.randomAmoeba() {
            case .Proteus:
                entityManager.spawnProteus(team: .teamRight)
            case .Fowleri:
                entityManager.spawnFowleri(team: .teamRight)
            case .Histolytica:
                entityManager.spawnHistolytica(team: .teamRight)
            }
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
