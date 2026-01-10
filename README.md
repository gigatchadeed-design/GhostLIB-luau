# Ghost Lib UI
**A high-performance, minimalist user interface library for Roblox.**

![Ghost Lib UI Preview](https://image.noelshack.com/fichiers/2026/02/6/1768082445-capture-d-cran-2026-01-10-230024.png)

Ghost Lib UI is designed for developers who need a clean, dark-themed interface with smooth animations and a focus on performance. It utilizes TweenService for all transitions and provides a fully responsive layout.

---

## Key Features
* **Modern Aesthetics:** Sleek Anthracite design with smooth rounded corners (UICorner).
* **Highly Responsive:** Elements adapt perfectly to different screen resolutions.
* **Lightweight Core:** Built with performance in mind, ensuring zero frame drops during UI interactions.
* **User Experience:** Includes built-in dragging systems and interactive hover effects.

## Technical Specifications
* **Core Engine:** Luau
* **Visual Style:** Anthracite Dark Mode / Rounded (UICorner)
* **Performance:** Optimized for low-end devices with efficient Z-Index management.
* **Navigation:** Draggable main frame and toggle system.

## Integration
To load the library into your project, use the following request:

[![Documentation](https://img.shields.io/badge/View-Documentation-blueviolet?style=for-the-badge)](https://gigatchadeed-design.github.io/GhostLIB-luau/)

```lua
local Library = loadstring(game:HttpGet("[https://raw.githubusercontent.com/gigatchadeed-design/GhostLIB-luau/refs/heads/main/GhostLibUi.lua](https://raw.githubusercontent.com/gigatchadeed-design/GhostLIB-luau/refs/heads/main/GhostLibUi.lua))"))()
