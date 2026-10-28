import box2d

let v = b2Vec2(x: 3.0f, y: 4.0f)

doAssert b2MinInt(2, 3) == 2
doAssert b2MaxInt(2, 3) == 3
doAssert b2AbsInt(-2) == 2
doAssert b2ClampInt(5, 0, 3) == 3
doAssert b2CeilingInt(5, 2) == 3
doAssert b2MinFloat(2.0f, 3.0f) == 2.0f
doAssert b2MaxFloat(2.0f, 3.0f) == 3.0f
doAssert b2AbsFloat(-2.0f) == 2.0f
doAssert b2ClampFloat(5.0f, 0.0f, 3.0f) == 3.0f

doAssert b2Length(v) == 5.0f
doAssert b2LengthSquared(v) == 25.0f
doAssert b2Distance(b2Vec2_zero, v) == 5.0f
doAssert b2DistanceSquared(b2Vec2_zero, v) == 25.0f
doAssert b2Dot(b2Vec2(x: 1.0f, y: 2.0f), v) == 11.0f
doAssert b2Cross(b2Vec2(x: 1.0f, y: 0.0f), b2Vec2(x: 0.0f, y: 1.0f)) == 1.0f
doAssert b2IsNormalized(b2Normalize(v))

var length: cfloat
let unit = b2GetLengthAndNormalize(length.addr, v)
doAssert length == 5.0f
doAssert b2IsNormalized(unit)

let q = b2MakeRot(0.25f)
doAssert b2IsNormalizedRot(q)
doAssert b2IsNormalizedRot(b2MakeRotFromUnitVector(b2Rot_GetXAxis(q)))
doAssert b2IsNormalizedRot(b2InvertRot(q))
doAssert b2IsNormalizedRot(b2NLerp(q, b2Rot_identity, 0.5f))
doAssert b2Rot_GetAngle(b2Rot_identity) == 0.0f
doAssert b2AbsFloat(b2Rot_GetAngle(q) - 0.25f) < 0.01f

let t = b2Transform(p: b2Vec2(x: 2.0f, y: 3.0f), q: b2Rot_identity)
doAssert b2TransformPoint(t, b2Vec2(x: 1.0f, y: 1.0f)) == b2Vec2(x: 3.0f, y: 4.0f)
doAssert b2InvTransformPoint(t, b2Vec2(x: 3.0f, y: 4.0f)) == b2Vec2(x: 1.0f, y: 1.0f)

let pos = b2ToPos(v)
doAssert b2ToVec2(pos) == v
doAssert b2SubPos(pos, b2Pos_zero) == v
doAssert b2OffsetPos(b2Pos_zero, v) == pos
doAssert b2LerpPos(b2Pos_zero, pos, 0.5f) == b2Vec2(x: 1.5f, y: 2.0f)
doAssert b2RoundDownFloat(1.5) == 1.5f
doAssert b2RoundUpFloat(1.5) == 1.5f

let wt = b2MakeWorldTransform(t)
doAssert b2InvTransformWorldPoint(wt, b2TransformWorldPoint(wt, v)) == v
doAssert b2MulWorldTransforms(wt, b2Transform_identity) == wt

let m = b2Mat22(cx: b2Vec2(x: 1.0f, y: 0.0f), cy: b2Vec2(x: 0.0f, y: 1.0f))
doAssert b2MulMV(m, v) == v
doAssert b2Solve22(m, v) == v
doAssert b2MulMV(b2GetInverse22(m), v) == v

let a = b2AABB(lowerBound: b2Vec2_zero, upperBound: v)
doAssert b2AABB_Contains(a, a)
doAssert b2AABB_Overlaps(a, a)
doAssert b2AABB_Center(a) == b2Vec2(x: 1.5f, y: 2.0f)
doAssert b2AABB_Extents(a) == b2Vec2(x: 1.5f, y: 2.0f)
doAssert b2AABB_Union(a, a) == a
doAssert b2Perimeter(a) == 14.0f

var aabb = b2AABB(lowerBound: b2Vec2_zero, upperBound: b2Vec2_zero)
doAssert b2EnlargeAABB(aabb.addr, a)
doAssert aabb == a

var points = [b2Vec2(x: -1.0f, y: -1.0f), b2Vec2(x: 2.0f, y: 3.0f)]
doAssert b2MakeAABB(points[0].addr, points.len.cint, 1.0f) ==
    b2AABB(
        lowerBound: b2Vec2(x: -2.0f, y: -2.0f),
        upperBound: b2Vec2(x: 3.0f, y: 4.0f)
    )

doAssert b2PlaneSeparation(b2Plane(normal: b2Vec2(x: 1.0f, y: 0.0f), offset: 1.0f), v) == 2.0f
doAssert b2SpringDamper(0.0f, 0.0f, 1.0f, 0.0f, 0.1f) == 0.0f
doAssert b2IsPowerOf2(16)
doAssert b2BoundingPowerOf2(17) == 5
doAssert b2RoundUpPowerOf2(17) == 32

echo "ok"

# ID round-trips
let worldId = b2WorldId(index1: 7, generation: 3)
doAssert b2LoadWorldId(b2StoreWorldId(worldId)) == worldId

let bodyId = b2BodyId(index1: 11, world0: 2, generation: 9)
doAssert b2LoadBodyId(b2StoreBodyId(bodyId)) == bodyId

let shapeId = b2ShapeId(index1: 12, world0: 3, generation: 10)
doAssert b2LoadShapeId(b2StoreShapeId(shapeId)) == shapeId

let chainId = b2ChainId(index1: 13, world0: 4, generation: 11)
doAssert b2LoadChainId(b2StoreChainId(chainId)) == chainId

let jointId = b2JointId(index1: 14, world0: 5, generation: 12)
doAssert b2LoadJointId(b2StoreJointId(jointId)) == jointId

let contactId = b2ContactId(index1: 15, world0: 6, padding: 0, generation: 13)
var contactValues: array[3, uint32]
b2StoreContactId(contactId, contactValues[0].addr)
doAssert b2LoadContactId(contactValues[0].addr) == contactId
