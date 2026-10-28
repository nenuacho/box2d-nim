## This generates bindings for Box2D source files

import os, macros
import futhark
import paths, process


const outputPath = libraryRoot / "private" / "internal.nim"


importc:
    path box2dRoot / "src"
    sysPath box2dRoot / "include"
    outputPath outputPath
    renameCallback wrapperRenameCallback
    "aabb.h"
    "bitset.h"
    "table.h"


processWrapperFile(outputPath)
fixStaticConsts(outputPath)
