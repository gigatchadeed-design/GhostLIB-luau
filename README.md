# Ghost Lib UI
**A high-performance, minimalist user interface library for Roblox.**

Ghost Lib UI is designed for developers who need a clean, dark-themed interface with smooth animations and a focus on performance. It utilizes TweenService for all transitions and provides a fully responsive layout.

---

## Technical Specifications
* **Core Engine:** Luau
* **Visual Style:** Anthracite Dark Mode / Rounded (UICorner)
* **Performance:** Optimized for low-end devices with efficient Z-Index management.
* **Navigation:** Draggable main frame and toggle system.

## Integration
To load the library into your project, use the following request:

```lua
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/gigatchadeed-design/GhostLIB-luau/refs/heads/main/GhostLibUi.lua)"))()
