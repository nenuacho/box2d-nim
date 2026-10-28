import wrapper

import private/compile
ensureCompiled()

export wrapper

# Inline functions / templates
import math, bitops

const
    b2FLTMin = 1.1754943508222875e-38'f32
    b2FLTEpsilon = 1.19209290e-7'f32


# Translated from box2d/include/box2d/math_functions.h
when not defined(b2MinInt):
    template b2MinInt*(a: cint, b: cint): cint =
        (if a < b: a else: b)


# Translated from box2d/include/box2d/math_functions.h
when not defined(b2MaxInt):
    template b2MaxInt*(a: cint, b: cint): cint =
        (if a > b: a else: b)


# Translated from box2d/include/box2d/math_functions.h
when not defined(b2AbsInt):
    template b2AbsInt*(a: cint): cint =
        (if a < 0: -a else: a)


# Translated from box2d/include/box2d/math_functions.h
when not defined(b2ClampInt):
    template b2ClampInt*(a: cint, lower: cint, upper: cint): cint =
        (if a < lower: lower else: (if a > upper: upper else: a))


# Translated from box2d/include/box2d/math_functions.h
when not defined(b2CeilingInt):
    template b2CeilingInt*(numerator: cint, denominator: cint): cint =
        ((numerator + denominator - 1) div denominator)


# Translated from box2d/include/box2d/math_functions.h
when not defined(b2MinFloat):
    template b2MinFloat*(a: cfloat, b: cfloat): cfloat =
        (if a < b: a else: b)


# Translated from box2d/include/box2d/math_functions.h
when not defined(b2MaxFloat):
    template b2MaxFloat*(a: cfloat, b: cfloat): cfloat =
        (if a > b: a else: b)


# Translated from box2d/include/box2d/math_functions.h
when not defined(b2AbsFloat):
    template b2AbsFloat*(a: cfloat): cfloat =
        (if a < 0.0f: -a else: a)


# Translated from box2d/include/box2d/math_functions.h
when not defined(b2ClampFloat):
    template b2ClampFloat*(a: cfloat, lower: cfloat, upper: cfloat): cfloat =
        (if a < lower: lower else: (if a > upper: upper else: a))


# Translated from box2d/include/box2d/math_functions.h
when not defined(b2Dot):
    template b2Dot*(a: b2Vec2, b: b2Vec2): cfloat =
        (a.x * b.x + a.y * b.y)


# Translated from box2d/include/box2d/math_functions.h
when not defined(b2Cross):
    template b2Cross*(a: b2Vec2, b: b2Vec2): cfloat =
        (a.x * b.y - a.y * b.x)


# Translated from box2d/include/box2d/math_functions.h
when not defined(b2CrossVS):
    template b2CrossVS*(v: b2Vec2, s: cfloat): b2Vec2 =
        b2Vec2(x: s * v.y, y: -s * v.x)


# Translated from box2d/include/box2d/math_functions.h
when not defined(b2CrossSV):
    template b2CrossSV*(s: cfloat, v: b2Vec2): b2Vec2 =
        b2Vec2(x: -s * v.y, y: s * v.x)


# Translated from box2d/include/box2d/math_functions.h
when not defined(b2LeftPerp):
    template b2LeftPerp*(v: b2Vec2): b2Vec2 =
        b2Vec2(x: -v.y, y: v.x)


# Translated from box2d/include/box2d/math_functions.h
when not defined(b2RightPerp):
    template b2RightPerp*(v: b2Vec2): b2Vec2 =
        b2Vec2(x: v.y, y: -v.x)


# Translated from box2d/include/box2d/math_functions.h
when not defined(b2Add):
    template b2Add*(a: b2Vec2, b: b2Vec2): b2Vec2 =
        b2Vec2(x: a.x + b.x, y: a.y + b.y)


# Translated from box2d/include/box2d/math_functions.h
when not defined(b2Sub):
    template b2Sub*(a: b2Vec2, b: b2Vec2): b2Vec2 =
        b2Vec2(x: a.x - b.x, y: a.y - b.y)


# Translated from box2d/include/box2d/math_functions.h
when not defined(b2Neg):
    template b2Neg*(a: b2Vec2): b2Vec2 =
        b2Vec2(x: -a.x, y: -a.y)


# Translated from box2d/include/box2d/math_functions.h
when not defined(b2Lerp):
    template b2Lerp*(a: b2Vec2, b: b2Vec2, t: cfloat): b2Vec2 =
        b2Vec2(x: (1.0f - t) * a.x + t * b.x, y: (1.0f - t) * a.y + t * b.y)


# Translated from box2d/include/box2d/math_functions.h
when not defined(b2Mul):
    template b2Mul*(a: b2Vec2, b: b2Vec2): b2Vec2 =
        b2Vec2(x: a.x * b.x, y: a.y * b.y)


# Translated from box2d/include/box2d/math_functions.h
when not defined(b2MulSV):
    template b2MulSV*(s: cfloat, v: b2Vec2): b2Vec2 =
        b2Vec2(x: s * v.x, y: s * v.y)


# Translated from box2d/include/box2d/math_functions.h
when not defined(b2MulAdd):
    template b2MulAdd*(a: b2Vec2, s: cfloat, b: b2Vec2): b2Vec2 =
        b2Vec2(x: a.x + s * b.x, y: a.y + s * b.y)


# Translated from box2d/include/box2d/math_functions.h
when not defined(b2MulSub):
    template b2MulSub*(a: b2Vec2, s: cfloat, b: b2Vec2): b2Vec2 =
        b2Vec2(x: a.x - s * b.x, y: a.y - s * b.y)


# Translated from box2d/include/box2d/math_functions.h
when not defined(b2Abs):
    template b2Abs*(a: b2Vec2): b2Vec2 =
        b2Vec2(x: a.x.abs, y: a.y.abs)


# Translated from box2d/include/box2d/math_functions.h
when not defined(b2Min):
    template b2Min*(a: b2Vec2, b: b2Vec2): b2Vec2 =
        b2Vec2(x: min(a.x, b.x), y: min(a.y, b.y))


# Translated from box2d/include/box2d/math_functions.h
when not defined(b2Max):
    template b2Max*(a: b2Vec2, b: b2Vec2): b2Vec2 =
        b2Vec2(x: max(a.x, b.x), y: max(a.y, b.y))


# Translated from box2d/include/box2d/math_functions.h
when not defined(b2Clamp):
    template b2Clamp*(v: b2Vec2, a: b2Vec2, b: b2Vec2): b2Vec2 =
        b2Vec2(x: v.x.clamp(a.x, b.x), y: v.y.clamp(a.y, b.y))


# Translated from box2d/include/box2d/math_functions.h
when not defined(b2Length):
    template b2Length*(v: b2Vec2): cfloat =
        sqrt(v.x * v.x + v.y * v.y)


# Translated from box2d/include/box2d/math_functions.h
when not defined(b2Distance):
    proc b2Distance*(a: b2Vec2, b: b2Vec2): cfloat {.inline.} =
        let dx = b.x - a.x
        let dy = b.y - a.y
        sqrt(dx * dx + dy * dy)


# Translated from box2d/include/box2d/math_functions.h
when not defined(b2Normalize):
    proc b2Normalize*(a: b2Vec2): b2Vec2 {.inline.} =
        let lengthSquared = a.x * a.x + a.y * a.y
        if lengthSquared > 1000.0f * b2FLTMin:
            let s = 1.0f / sqrt(lengthSquared)
            b2Vec2(x: s * a.x, y: s * a.y)
        else:
            b2Vec2(x: 0.0f, y: 0.0f)


# Translated from box2d/include/box2d/math_functions.h
when not defined(b2IsNormalized):
    proc b2IsNormalized*(a: b2Vec2): bool {.inline.} =
        let aa = b2Dot(a, a)
        b2AbsFloat(1.0f - aa) < 100.0f * b2FLTEpsilon


# Translated from box2d/include/box2d/math_functions.h
when not defined(b2GetLengthAndNormalize):
    proc b2GetLengthAndNormalize*(length: ptr cfloat, a: b2Vec2): b2Vec2 {.inline.} =
        let lengthSquared = a.x * a.x + a.y * a.y
        if lengthSquared > 1000.0f * b2FLTMin:
            length[] = sqrt(lengthSquared)
            let s = 1.0f / length[]
            b2Vec2(x: s * a.x, y: s * a.y)
        else:
            length[] = 0.0f
            b2Vec2(x: 0.0f, y: 0.0f)


# Translated from box2d/include/box2d/math_functions.h
when not defined(b2LengthSquared):
    template b2LengthSquared*(v: b2Vec2): cfloat =
        (v.x * v.x + v.y * v.y)


# Translated from box2d/include/box2d/math_functions.h
when not defined(b2DistanceSquared):
    proc b2DistanceSquared*(a: b2Vec2, b: b2Vec2): cfloat {.inline.} =
        let dx = b.x - a.x
        let dy = b.y - a.y
        dx * dx + dy * dy


# Translated from box2d/include/box2d/math_functions.h
when not defined(b2MakeRot):
    proc b2MakeRot*(radians: cfloat): b2Rot {.inline.} =
        let cs = b2ComputeCosSin(radians)
        b2Rot(c: cs.cosine, s: cs.sine)


# Translated from box2d/include/box2d/math_functions.h
when not defined(b2MakeRotFromUnitVector):
    proc b2MakeRotFromUnitVector*(unitVector: b2Vec2): b2Rot {.inline.} =
        b2Rot(c: unitVector.x, s: unitVector.y)


# Translated from box2d/include/box2d/math_functions.h
when not defined(b2NormalizeRot):
    proc b2NormalizeRot*(q: b2Rot): b2Rot {.inline.} =
        let mag = sqrt(q.s * q.s + q.c * q.c)
        let invMag = if mag > 0.0f: 1.0f / mag else: 0.0f
        b2Rot(c: q.c * invMag, s: q.s * invMag)


# Translated from box2d/include/box2d/math_functions.h
when not defined(b2IntegrateRotation):
    proc b2IntegrateRotation*(q1: b2Rot, deltaAngle: cfloat): b2Rot {.inline.} =
        let q2 = b2Rot(c: q1.c - deltaAngle * q1.s, s: q1.s + deltaAngle * q1.c)
        let mag = sqrt(q2.s * q2.s + q2.c * q2.c)
        let invMag = if mag > 0.0f: 1.0f / mag else: 0.0f
        b2Rot(c: q2.c * invMag, s: q2.s * invMag)


# Translated from box2d/include/box2d/math_functions.h
when not defined(b2IsNormalizedRot):
    proc b2IsNormalizedRot*(q: b2Rot): bool {.inline.} =
        let qq = q.s * q.s + q.c * q.c
        1.0f - 0.0006f < qq and qq < 1.0f + 0.0006f


# Translated from box2d/include/box2d/math_functions.h
when not defined(b2InvertRot):
    template b2InvertRot*(a: b2Rot): b2Rot =
        b2Rot(c: a.c, s: -a.s)


# Translated from box2d/include/box2d/math_functions.h
when not defined(b2NLerp):
    proc b2NLerp*(q1: b2Rot, q2: b2Rot, t: cfloat): b2Rot {.inline.} =
        let omt = 1.0f - t
        let q = b2Rot(
            c: omt * q1.c + t * q2.c,
            s: omt * q1.s + t * q2.s)
        b2NormalizeRot(q)


# Translated from box2d/include/box2d/math_functions.h
when not defined(b2ComputeAngularVelocity):
    template b2ComputeAngularVelocity*(q1: b2Rot, q2: b2Rot, inv_h: cfloat): cfloat =
        (inv_h * (q2.s * q1.c - q2.c * q1.s))


# Translated from box2d/include/box2d/math_functions.h
when not defined(b2Rot_GetAngle):
    template b2Rot_GetAngle*(q: b2Rot): cfloat =
        b2Atan2(q.s, q.c)


# Translated from box2d/include/box2d/math_functions.h
when not defined(b2Rot_GetXAxis):
    template b2Rot_GetXAxis*(q: b2Rot): b2Vec2 =
        b2Vec2(x: q.c, y: q.s)


# Translated from box2d/include/box2d/math_functions.h
when not defined(b2Rot_GetYAxis):
    template b2Rot_GetYAxis*(q: b2Rot): b2Vec2 =
        b2Vec2(x: -q.s, y: q.c)


# Translated from box2d/include/box2d/math_functions.h
when not defined(b2MulRot):
    template b2MulRot*(q: b2Rot, r: b2Rot): b2Rot =
        b2Rot(c: q.c * r.c - q.s * r.s, s: q.s * r.c + q.c * r.s)


# Translated from box2d/include/box2d/math_functions.h
when not defined(b2InvMulRot):
    template b2InvMulRot*(q: b2Rot, r: b2Rot): b2Rot =
        b2Rot(c: q.c * r.c + q.s * r.s, s: q.c * r.s - q.s * r.c)


# Translated from box2d/include/box2d/math_functions.h
when not defined(b2RelativeAngle):
    proc b2RelativeAngle*(a: b2Rot, b: b2Rot): cfloat {.inline.} =
        let s = a.c * b.s - a.s * b.c
        let c = a.c * b.c + a.s * b.s
        b2Atan2(s, c)


# Translated from box2d/include/box2d/math_functions.h
when not defined(b2UnwindAngle):
    proc b2UnwindAngle*(radians: cfloat): cfloat {.inline.} =
        let x = b2ClampFloat(radians, -1.0e6f, 1.0e6f)
        let twoPi = cdouble(2.0f * B2_PI)
        let roundToNearest = 6755399441055744.0
        let a = cdouble(x)
        let k = (a / twoPi + roundToNearest) - roundToNearest
        cfloat(a - k * twoPi)


# Translated from box2d/include/box2d/math_functions.h
when not defined(b2RotateVector):
    template b2RotateVector*(q: b2Rot, v: b2Vec2): b2Vec2 =
        b2Vec2(x: q.c * v.x - q.s * v.y, y: q.s * v.x + q.c * v.y)


# Translated from box2d/include/box2d/math_functions.h
when not defined(b2InvRotateVector):
    template b2InvRotateVector*(q: b2Rot, v: b2Vec2): b2Vec2 =
        b2Vec2(x: q.c * v.x + q.s * v.y, y: -q.s * v.x + q.c * v.y)


# Translated from box2d/include/box2d/math_functions.h
when not defined(b2TransformPoint):
    proc b2TransformPoint*(t: b2Transform, p: b2Vec2): b2Vec2 {.inline.} =
        let x = (t.q.c * p.x - t.q.s * p.y) + t.p.x
        let y = (t.q.s * p.x + t.q.c * p.y) + t.p.y
        b2Vec2(x: x, y: y)


# Translated from box2d/include/box2d/math_functions.h
when not defined(b2InvTransformPoint):
    proc b2InvTransformPoint*(t: b2Transform, p: b2Vec2): b2Vec2 {.inline.} =
        let vx = p.x - t.p.x
        let vy = p.y - t.p.y
        b2Vec2(
            x: t.q.c * vx + t.q.s * vy,
            y: -t.q.s * vx + t.q.c * vy
        )


# Translated from box2d/include/box2d/math_functions.h
when not defined(b2MulTransforms):
    proc b2MulTransforms*(A: b2Transform, B: b2Transform): b2Transform {.inline.} =
        let q = b2MulRot(A.q, B.q)
        let p = b2Add(b2RotateVector(A.q, B.p), A.p)
        b2Transform(q: q, p: p)


# Translated from box2d/include/box2d/math_functions.h
when not defined(b2InvMulTransforms):
    proc b2InvMulTransforms*(A: b2Transform, B: b2Transform): b2Transform {.inline.} =
        let q = b2InvMulRot(A.q, B.q)
        let p = b2InvRotateVector(A.q, b2Sub(B.p, A.p))
        b2Transform(q: q, p: p)


# Translated from box2d/include/box2d/math_functions.h
when not defined(b2ToPos):
    template b2ToPos*(v: b2Vec2): b2Pos =
        b2Pos(x: v.x, y: v.y)


# Translated from box2d/include/box2d/math_functions.h
when not defined(b2ToVec2):
    template b2ToVec2*(p: b2Pos): b2Vec2 =
        b2Vec2(x: p.x, y: p.y)


# Translated from box2d/include/box2d/math_functions.h
when not defined(b2RoundDownFloat):
    template b2RoundDownFloat*(x: cdouble): cfloat =
        cfloat(x)


# Translated from box2d/include/box2d/math_functions.h
when not defined(b2RoundUpFloat):
    template b2RoundUpFloat*(x: cdouble): cfloat =
        cfloat(x)


# Translated from box2d/include/box2d/math_functions.h
when not defined(b2SubPos):
    template b2SubPos*(a: b2Pos, b: b2Pos): b2Vec2 =
        b2Vec2(x: cfloat(a.x - b.x), y: cfloat(a.y - b.y))


# Translated from box2d/include/box2d/math_functions.h
when not defined(b2OffsetPos):
    template b2OffsetPos*(p: b2Pos, d: b2Vec2): b2Pos =
        b2Pos(x: p.x + d.x, y: p.y + d.y)


# Translated from box2d/include/box2d/math_functions.h
when not defined(b2LerpPos):
    template b2LerpPos*(a: b2Pos, b: b2Pos, t: cfloat): b2Pos =
        b2Pos(
            x: (1.0f - t) * a.x + t * b.x,
            y: (1.0f - t) * a.y + t * b.y
        )


# Translated from box2d/include/box2d/math_functions.h
when not defined(b2TransformWorldPoint):
    proc b2TransformWorldPoint*(t: b2WorldTransform, p: b2Vec2): b2Pos {.inline.} =
        let rx = t.q.c * p.x - t.q.s * p.y
        let ry = t.q.s * p.x + t.q.c * p.y
        b2Pos(x: t.p.x + rx, y: t.p.y + ry)


# Translated from box2d/include/box2d/math_functions.h
when not defined(b2InvTransformWorldPoint):
    proc b2InvTransformWorldPoint*(t: b2WorldTransform, p: b2Pos): b2Vec2 {.inline.} =
        let vx = cfloat(p.x - t.p.x)
        let vy = cfloat(p.y - t.p.y)
        b2Vec2(
            x: t.q.c * vx + t.q.s * vy,
            y: -t.q.s * vx + t.q.c * vy
        )


# Translated from box2d/include/box2d/math_functions.h
when not defined(b2InvMulWorldTransforms):
    proc b2InvMulWorldTransforms*(A: b2WorldTransform, B: b2WorldTransform): b2Transform {.inline.} =
        let q = b2InvMulRot(A.q, B.q)
        let d = b2Vec2(x: cfloat(B.p.x - A.p.x), y: cfloat(B.p.y - A.p.y))
        let p = b2InvRotateVector(A.q, d)
        b2Transform(q: q, p: p)


# Translated from box2d/include/box2d/math_functions.h
when not defined(b2MulWorldTransforms):
    proc b2MulWorldTransforms*(A: b2WorldTransform, B: b2Transform): b2WorldTransform {.inline.} =
        let q = b2MulRot(A.q, B.q)
        let p = b2OffsetPos(A.p, b2RotateVector(A.q, B.p))
        b2WorldTransform(q: q, p: p)


# Translated from box2d/include/box2d/math_functions.h
when not defined(b2ToRelativeTransform):
    proc b2ToRelativeTransform*(t: b2WorldTransform, base: b2Pos): b2Transform {.inline.} =
        b2Transform(
            q: t.q,
            p: b2Vec2(x: cfloat(t.p.x - base.x), y: cfloat(t.p.y - base.y))
        )


# Translated from box2d/include/box2d/math_functions.h
when not defined(b2MakeWorldTransform):
    proc b2MakeWorldTransform*(t: b2Transform): b2WorldTransform {.inline.} =
        b2WorldTransform(p: b2ToPos(t.p), q: t.q)


# Translated from box2d/include/box2d/math_functions.h
when not defined(b2MulMV):
    template b2MulMV*(A: b2Mat22, v: b2Vec2): b2Vec2 =
        b2Vec2(
            x: A.cx.x * v.x + A.cy.x * v.y,
            y: A.cx.y * v.x + A.cy.y * v.y
        )


# Translated from box2d/include/box2d/math_functions.h
when not defined(b2GetInverse22):
    proc b2GetInverse22*(A: b2Mat22): b2Mat22 {.inline.} =
        let
            a = A.cx.x
            b = A.cy.x
            c = A.cx.y
            d = A.cy.y

        var det = a * d - b * c

        if det != 0.0f:
            det = 1.0f / det

        b2Mat22(
            cx: b2Vec2(x: det * d, y: -det * c),
            cy: b2Vec2(x: -det * b, y: det * a)
        )


# Translated from box2d/include/box2d/math_functions.h
when not defined(b2Solve22):
    proc b2Solve22*(A: b2Mat22, b: b2Vec2): b2Vec2 {.inline.} =
        let
            a11 = A.cx.x
            a12 = A.cy.x
            a21 = A.cx.y
            a22 = A.cy.y

        var det = a11 * a22 - a12 * a21

        if det != 0.0f:
            det = 1.0f / det

        b2Vec2(x: det * (a22 * b.x - a12 * b.y), y: det * (a11 * b.y - a21 * b.x))


# Translated from box2d/include/box2d/math_functions.h
when not defined(b2AABB_Contains):
    proc b2AABB_Contains*(a: b2AABB, b: b2AABB): bool {.inline.} =
        var s = true
        s = s and a.lowerBound.x <= b.lowerBound.x
        s = s and a.lowerBound.y <= b.lowerBound.y
        s = s and b.upperBound.x <= a.upperBound.x
        s = s and b.upperBound.y <= a.upperBound.y
        s


# Translated from box2d/include/box2d/math_functions.h
when not defined(b2AABB_Center):
    template b2AABB_Center*(a: b2AABB): b2Vec2 =
        b2Vec2(
            x: 0.5f * (a.lowerBound.x + a.upperBound.x),
            y: 0.5f * (a.lowerBound.y + a.upperBound.y)
        )


# Translated from box2d/include/box2d/math_functions.h
when not defined(b2AABB_Extents):
    template b2AABB_Extents*(a: b2AABB): b2Vec2 =
        b2Vec2(
            x: 0.5f * (a.upperBound.x - a.lowerBound.x),
            y: 0.5f * (a.upperBound.y - a.lowerBound.y)
        )


# Translated from box2d/include/box2d/math_functions.h
when not defined(b2AABB_Union):
    template b2AABB_Union*(a: b2AABB, b: b2AABB): b2AABB =
        b2AABB(
            lowerBound: b2Vec2(
                x: min(a.lowerBound.x, b.lowerBound.x),
                y: min(a.lowerBound.y, b.lowerBound.y)
            ),
            upperBound: b2Vec2(
                x: max(a.upperBound.x, b.upperBound.x),
                y: max(a.upperBound.y, b.upperBound.y)
            )
        )


# Translated from box2d/include/box2d/math_functions.h
when not defined(b2AABB_Overlaps):
    proc b2AABB_Overlaps*(a: b2AABB, b: b2AABB): bool {.inline.} =
        not (
            b.lowerBound.x > a.upperBound.x or
            b.lowerBound.y > a.upperBound.y or
            a.lowerBound.x > b.upperBound.x or
            a.lowerBound.y > b.upperBound.y
        )


# Translated from box2d/include/box2d/math_functions.h
when not defined(b2MakeAABB):
    proc b2MakeAABB*(points: ptr b2Vec2, count: cint, radius: cfloat): b2AABB {.inline.} =
        let p = cast[ptr UncheckedArray[b2Vec2]](points)
        var a = b2AABB(lowerBound: p[0], upperBound: p[0])
        for i in 1 ..< count.int:
            a.lowerBound = b2Min(a.lowerBound, p[i])
            a.upperBound = b2Max(a.upperBound, p[i])

        let r = b2Vec2(x: radius, y: radius)
        a.lowerBound = b2Sub(a.lowerBound, r)
        a.upperBound = b2Add(a.upperBound, r)
        a


# Translated from box2d/include/box2d/math_functions.h
when not defined(b2PlaneSeparation):
    template b2PlaneSeparation*(plane: b2Plane, point: b2Vec2): cfloat =
        (b2Dot(plane.normal, point) - plane.offset)


# Translated from box2d/include/box2d/math_functions.h
when not defined(b2SpringDamper):
    proc b2SpringDamper*(
        hertz: cfloat,
        dampingRatio: cfloat,
        position: cfloat,
        velocity: cfloat,
        timeStep: cfloat
    ): cfloat {.inline.} =
        let omega = 2.0f * B2_PI * hertz
        let omegaH = omega * timeStep
        (velocity - omega * omegaH * position) /
            (1.0f + 2.0f * dampingRatio * omegaH + omegaH * omegaH)


# Translated from box2d/src/aabb.h
when not defined(b2Perimeter):
    proc b2Perimeter*(a: b2AABB): cfloat {.inline.} =
        let wx = a.upperBound.x - a.lowerBound.x
        let wy = a.upperBound.y - a.lowerBound.y
        2.0f * (wx + wy)


# Translated from box2d/src/aabb.h
when not defined(b2EnlargeAABB):
    proc b2EnlargeAABB*(a: ptr b2AABB, b: b2AABB): bool {.inline.} =
        var changed = false

        if b.lowerBound.x < a.lowerBound.x:
            a.lowerBound.x = b.lowerBound.x
            changed = true

        if b.lowerBound.y < a.lowerBound.y:
            a.lowerBound.y = b.lowerBound.y
            changed = true

        if a.upperBound.x < b.upperBound.x:
            a.upperBound.x = b.upperBound.x
            changed = true

        if a.upperBound.y < b.upperBound.y:
            a.upperBound.y = b.upperBound.y
            changed = true

        changed


# Translated from box2d/src/aabb.h
when not defined(b2OffsetAABB):
    proc b2OffsetAABB*(box: b2AABB, origin: b2Pos): b2AABB {.inline.} =
        b2AABB(
            lowerBound: b2Vec2(
                x: b2RoundDownFloat(cdouble(origin.x) + cdouble(box.lowerBound.x)),
                y: b2RoundDownFloat(cdouble(origin.y) + cdouble(box.lowerBound.y))
            ),
            upperBound: b2Vec2(
                x: b2RoundUpFloat(cdouble(origin.x) + cdouble(box.upperBound.x)),
                y: b2RoundUpFloat(cdouble(origin.y) + cdouble(box.upperBound.y))
            )
        )


# Translated from box2d/src/platform.h
when not defined(b2IsPowerOf2):
    template b2IsPowerOf2*(x: cint): bool =
        (x.bitand(x - 1) == 0)


# Translated from box2d/src/platform.h
when not defined(b2BoundingPowerOf2):
    proc b2BoundingPowerOf2*(x: cint): cint {.inline.} =
        if x <= 1:
            1
        else:
            (32 - countLeadingZeroBits(x - 1)).int32


# Translated from box2d/src/platform.h
when not defined(b2RoundUpPowerOf2):
    proc b2RoundUpPowerOf2*(x: cint): cint {.inline.} =
        if x <= 1:
            1
        else:
            (1 shl (32 - countLeadingZeroBits(x - 1))).int32


# Translated from box2d/include/box2d/id.h
when not defined(b2StoreWorldId):
    proc b2StoreWorldId*(id: b2WorldId): uint32 {.inline.} =
        (uint32(id.index1) shl 16) or uint32(id.generation)


# Translated from box2d/include/box2d/id.h
when not defined(b2LoadWorldId):
    proc b2LoadWorldId*(x: uint32): b2WorldId {.inline.} =
        b2WorldId(index1: uint16(x shr 16), generation: uint16(x and 0xFFFF))


# Translated from box2d/include/box2d/id.h
when not defined(b2StoreBodyId):
    proc b2StoreBodyId*(id: b2BodyId): uint64 {.inline.} =
        (uint64(cast[uint32](id.index1)) shl 32) or
            (uint64(id.world0) shl 16) or uint64(id.generation)


# Translated from box2d/include/box2d/id.h
when not defined(b2LoadBodyId):
    proc b2LoadBodyId*(x: uint64): b2BodyId {.inline.} =
        b2BodyId(
            index1: cast[int32](uint32(x shr 32)),
            world0: uint16((x shr 16) and 0xFFFF),
            generation: uint16(x and 0xFFFF)
        )


# Translated from box2d/include/box2d/id.h
when not defined(b2StoreShapeId):
    proc b2StoreShapeId*(id: b2ShapeId): uint64 {.inline.} =
        (uint64(cast[uint32](id.index1)) shl 32) or
            (uint64(id.world0) shl 16) or uint64(id.generation)


# Translated from box2d/include/box2d/id.h
when not defined(b2LoadShapeId):
    proc b2LoadShapeId*(x: uint64): b2ShapeId {.inline.} =
        b2ShapeId(
            index1: cast[int32](uint32(x shr 32)),
            world0: uint16((x shr 16) and 0xFFFF),
            generation: uint16(x and 0xFFFF)
        )


# Translated from box2d/include/box2d/id.h
when not defined(b2StoreChainId):
    proc b2StoreChainId*(id: b2ChainId): uint64 {.inline.} =
        (uint64(cast[uint32](id.index1)) shl 32) or
            (uint64(id.world0) shl 16) or uint64(id.generation)


# Translated from box2d/include/box2d/id.h
when not defined(b2LoadChainId):
    proc b2LoadChainId*(x: uint64): b2ChainId {.inline.} =
        b2ChainId(
            index1: cast[int32](uint32(x shr 32)),
            world0: uint16((x shr 16) and 0xFFFF),
            generation: uint16(x and 0xFFFF)
        )


# Translated from box2d/include/box2d/id.h
when not defined(b2StoreJointId):
    proc b2StoreJointId*(id: b2JointId): uint64 {.inline.} =
        (uint64(cast[uint32](id.index1)) shl 32) or
            (uint64(id.world0) shl 16) or uint64(id.generation)


# Translated from box2d/include/box2d/id.h
when not defined(b2LoadJointId):
    proc b2LoadJointId*(x: uint64): b2JointId {.inline.} =
        b2JointId(
            index1: cast[int32](uint32(x shr 32)),
            world0: uint16((x shr 16) and 0xFFFF),
            generation: uint16(x and 0xFFFF)
        )


# Translated from box2d/include/box2d/id.h
when not defined(b2StoreContactId):
    proc b2StoreContactId*(id: b2ContactId, values: ptr uint32) {.inline.} =
        let v = cast[ptr UncheckedArray[uint32]](values)
        v[0] = uint32(id.index1)
        v[1] = uint32(id.world0)
        v[2] = id.generation


# Translated from box2d/include/box2d/id.h
when not defined(b2LoadContactId):
    proc b2LoadContactId*(values: ptr uint32): b2ContactId {.inline.} =
        let v = cast[ptr UncheckedArray[uint32]](values)
        b2ContactId(
            index1: cast[int32](v[0]),
            world0: cast[uint16](v[1]),
            padding: 0,
            generation: v[2]
        )
