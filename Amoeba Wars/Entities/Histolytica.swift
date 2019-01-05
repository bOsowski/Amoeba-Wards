import SpriteKit
import GameplayKit

class Histolytica: Amoeba {
    
    init(team: Team, entityManager: EntityManager) {
        super.init(team: team, entityManager: entityManager, maxSpeed: 150, maxAcceleration: 5, imageName: team.rawValue=="Left" ? ImageName.HistolyticaLeft : ImageName.HistolyticaRight)
        addComponent(HealthComponent(health: 1, delegate: self, entityManager: entityManager))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
