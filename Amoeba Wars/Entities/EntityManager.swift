import SpriteKit
import GameplayKit

class EntityManager {
    
    lazy var componentSystems: [GKComponentSystem] = {
        let baseSystem = GKComponentSystem(componentClass: BaseComponent.self)
        return [baseSystem]
    } ()
    
    // 1
    var entities = Set<GKEntity>()
    var toRemove = Set<GKEntity>()
    let scene: SKScene
    
    
    // 2
    init(scene: SKScene) {
        self.scene = scene
    }
    
    // 3
    func add(_ entity: GKEntity) {
        entities.insert(entity)
        
        if let spriteNode = entity.component(ofType: SpriteComponent.self)?.node {
            scene.addChild(spriteNode)
        }
        
        for componentSystem in componentSystems {
            componentSystem.addComponent(foundIn: entity)
        }
    }
    
    // 4
    func remove(_ entity: GKEntity) {
        if let spriteNode = entity.component(ofType: SpriteComponent.self)?.node {
            spriteNode.removeFromParent()
        }
        
        entities.remove(entity)
        toRemove.insert(entity)
    }
}
