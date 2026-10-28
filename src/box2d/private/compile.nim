## This links and compiles the box2d source files.

import os, macros, strutils

const box2dRoot = block:
    var root = ""
    var dir = currentSourcePath.parentDir
    while dir.len > 0:
        if dirExists(dir / "box2d-3.2.0"):
            root = dir / "box2d-3.2.0"
            break
        let parent = dir.parentDir
        if parent == dir:
            break
        dir = parent
    root


{.passC: "-I " & (box2dRoot / "include")}
{.passC: "-I " & (box2dRoot / "src")}


when defined(emscripten):
  {.passC: "-D NDEBUG"}

# Box2D 3.2.0 AVX2 wide solver misbehaves when built unoptimized with GCC.
# Keep debug builds on the scalar/SIMD-width-4 path; release builds use AVX2.
when not defined(release) and not defined(box2dSimd):
  {.passC: "-DBOX2D_DISABLE_SIMD"}

when defined(vcc): #for MSVC
  {.passC: "/std:c17".}
  when defined(release) or defined(box2dSimd):
    {.passC: "/arch:AVX2".}
else:
  {.passC: "-std=c17".}
  {.passC: "-ffp-contract=off".}


macro compileCFiles(sourceDir: static[string]): untyped =
  ## List {.compile: "<C>".} for every C source file in sourceDir.
  result = newStmtList()

  for file in walkDir(sourceDir):
    let filePath = file.path

    if not filePath.endsWith(".c"):
      continue

    var pragma = newNimNode(nnkPragma)
    pragma.add newColonExpr(newIdentNode("compile"), newStrLitNode(file.path))

    result.add pragma

  result = quote do:
    block: `result`


compileCFiles(box2dRoot / "src")

template ensureCompiled*() =
  ## a noop to prevent unused import warnings
  ## in files that depend on this compilation step.
  discard
