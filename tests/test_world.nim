import box2d

var worldDef = b2DefaultWorldDef()
worldDef.gravity = b2Vec2(x: 0.0f, y: -10.0f)
let worldId = b2CreateWorld(worldDef.addr)

var groundBodyDef = b2DefaultBodyDef()
groundBodyDef.position = b2ToPos(b2Vec2(x: 0.0f, y: -10.0f))
let groundId = b2CreateBody(worldId, groundBodyDef.addr)

let groundBox = b2MakeBox(50.0f, 10.0f)
var groundShapeDef = b2DefaultShapeDef()
discard b2CreatePolygonShape(groundId, groundShapeDef.addr, groundBox.addr)

var bodyDef = b2DefaultBodyDef()
bodyDef.bodyType = b2_dynamicBody
bodyDef.position = b2ToPos(b2Vec2(x: 0.0f, y: 4.0f))
let bodyId = b2CreateBody(worldId, bodyDef.addr)

let dynamicBox = b2MakeSquare(1.0f)
var shapeDef = b2DefaultShapeDef()
shapeDef.density = 1.0f
shapeDef.material.friction = 0.3f
discard b2CreatePolygonShape(bodyId, shapeDef.addr, dynamicBox.addr)

for _ in 0 ..< 60:
    b2World_Step(worldId, 1.0f / 60.0f, 4)

let position = b2Body_GetPosition(bodyId)
doAssert position.y < 4.0f

# Inline math functions
doAssert b2Length(b2Vec2(x: 3.0f, y: 4.0f)) == 5.0f
doAssert b2Dot(b2Vec2(x: 1.0f, y: 2.0f), b2Vec2(x: 3.0f, y: 4.0f)) == 11.0f
doAssert b2IsNormalized(b2Normalize(b2Vec2(x: 3.0f, y: 4.0f)))
doAssert b2IsNormalizedRot(b2MakeRot(0.5f))
doAssert b2_nullWorldId.index1 == 0
doAssert b2Pos_zero.x == 0.0f

b2DestroyBody(bodyId)
b2DestroyBody(groundId)
b2DestroyWorld(worldId)

echo "ok"
