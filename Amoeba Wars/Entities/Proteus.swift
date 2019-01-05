import SpriteKit
import GameplayKit

class Proteus: Amoeba {
    
    init(team: Team, entityManager: EntityManager) {
        super.init(team: team, entityManager: entityManager, maxSpeed: 50, maxAcceleration: 1, imageName: team.rawValue=="Left" ? ImageName.ProteusLeft : ImageName.ProteusRight)
        addComponent(HealthComponent(health: 7, delegate: self, entityManager: entityManager))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
