# Compatibility layer

This fork now includes a small runtime compatibility layer for adjacent FNF engines:

| Source format | Current support |
| --- | --- |
| Codename Engine | Song charts in `songs/<song>/charts/<difficulty>.json` (including case-insensitive difficulty filenames such as `HARD.json` and unsuffixed Psych `Normal` requests mapping to Codename `normal.json`), song metadata in `songs/<song>/meta.json`, nested audio in `songs/<song>/song/`, character XML in `data/characters/*.xml`, icon folders in `images/icons/<name>/icon.png`, stage XML in `data/stages/*.xml` including `bf`/`gf` actor tags, freeplay lists in `data/config/freeplaySonglist.txt` / `data/freeplaySonglist.txt`, Codename week XML from `data/weeks/weeks.txt`, metadata-driven freeplay difficulties, global scripts in `data/scripts/`, stage scripts in `data/stages/`, note/event scripts in `data/notes/` and `data/events/`, and song scripts in `songs/<song>/scripts/` |
| V-Slice / base game | Runtime loading for `songs/<song>/<song>-chart.json` + `songs/<song>/<song>-metadata.json` through the existing V-Slice converter |
| YoshiCrafter Engine | Legacy chart folders in `data/<song>/`, `data/freeplaySonglist.json`, basic `song_conf.hx` stage lookup, and folder characters using `characters/<name>/Character.hx` when they follow the documented `addByPrefix` / `addOffset` pattern |
| YoshiCrafter Engine (VsBamber-style JSON variants) | Freeplay lists in `data/freeplaySonglist.json`, legacy Psych charts in `data/<song>/*.json`, folder characters in `characters/<name>/Character.json`, and stage JSON with `sprites` arrays |
| Vs. Dave & Bambi Volume 1 assets | Treated as an asset vocabulary for now; its preload character metadata is useful reference data, but no Dave Engine runtime emulation is attempted yet |

## Important limits

- Codename `.hx` scripts are now discovered from their native folders, and a small additive API bridge is present for common safe names such as `cpuStrums`, `camGame`, `camHUD`, `defaultCamZoom`, `Options`, `lerp`, `importScript`, and a few bar/character helpers. Converted Codename custom events also keep their full parameter arrays for event scripts instead of being flattened to only two Psych values. A minimal three-line `strumLines` façade exists for simple scripts that only need dad / boyfriend / girlfriend character access, but full Codename API parity is **not** complete yet: script-heavy menus, custom states, multikey systems, and richer `strumLines` behavior still need deeper bridge work.
- YoshiCrafter Engine exposes its own scripting/runtime APIs, so true support still stops at declarative or pattern-detectable data; arbitrary foreign HScript is not guaranteed to run unchanged inside Psych.
- YoshiCrafter stage `.hx`, modchart `.hx`, and cutscene `.hx` files are still not executed. `song_conf.hx` is only read for simple `case "song": stage = "name";` mappings.
- Folder-character support currently resolves spritesheets through `characters/<name>/spritesheet.*` and icons through `characters/<name>/icon.*`; stage scripts beside YoshiCrafter-style stage JSON are still not executed.

## 3D support

The upstream repositories checked so far do not expose an obvious portable 3D asset format such as `.obj`, `.fbx`, `.dae`, `.gltf`, or `.glb`. No dedicated 3D compatibility path has been added yet because there is no concrete source format to preserve.
