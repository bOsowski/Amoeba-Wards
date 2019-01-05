import SpriteKit
import GameplayKit

class Fowleri: Amoeba {
    
    init(team: Team, entityManager: EntityManager) {
        super.init(team: team, entityManager: entityManager, maxSpeed: 50, maxAcceleration: 1, imageName: team.rawValue=="Left" ? ImageName.FowleriLeft : ImageName.FowleriRight)
        addComponent(HealthComponent(health: 2, delegate: self, entityManager: entityManager))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
