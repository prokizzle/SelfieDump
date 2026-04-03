# CLAUDE.md - AI Assistant Guide for SelfieDump

## Project Overview

**SelfieDump** is a Swift/SwiftUI iOS application that displays a random grid of 9 images from the user's selfie photo library. The project is open-source under the GPL v3 license.

- **Language:** Swift 5.0
- **Framework:** SwiftUI
- **Platform:** iOS 15.5+
- **Bundle ID:** `com.prokizzle.SelfieDump`
- **Author:** Nick Prokesch (created August 3, 2022)

## Repository Structure

```
SelfieDump/
├── SelfieDump/                    # Main application source code
│   ├── SelfieDumpApp.swift        # App entry point (@main)
│   ├── ContentView.swift          # Main UI view
│   ├── Persistence.swift          # CoreData persistence layer
│   ├── SelfieDump.xcdatamodeld/   # CoreData data model
│   ├── Assets.xcassets/           # App assets (icons, colors)
│   └── Preview Content/           # SwiftUI preview assets
├── SelfieDumpTests/               # Unit tests (XCTest)
│   └── SelfieDumpTests.swift
├── SelfieDumpUITests/             # UI tests (XCUITest)
│   ├── SelfieDumpUITests.swift
│   └── SelfieDumpUITestsLaunchTests.swift
├── SelfieDump.xcodeproj/          # Xcode project configuration
├── LICENSE                        # GPL v3 license
├── README.md                      # Project description
└── CLAUDE.md                      # This file
```

## Key Source Files

| File | Purpose |
|------|---------|
| `SelfieDump/SelfieDumpApp.swift` | App entry point; initializes SwiftUI scene and CoreData persistence |
| `SelfieDump/ContentView.swift` | Main UI view with item list; handles CRUD operations |
| `SelfieDump/Persistence.swift` | CoreData persistence controller with CloudKit sync support |

## Architecture & Technologies

### SwiftUI App Structure
- Uses `@main` attribute for app entry point
- Single `WindowGroup` scene
- Environment object injection for CoreData context

### Data Layer
- **CoreData** with `NSPersistentCloudKitContainer` for cloud sync
- Single `Item` entity with `timestamp` attribute
- Preview controller with in-memory store for SwiftUI previews

### Current Data Model
```swift
Entity: Item
- timestamp: Date (optional)
- CloudKit synchronized
```

## Development Workflows

### Building the Project
This is an Xcode-native project with no external dependencies or custom build scripts.

```bash
# Build from command line
xcodebuild -project SelfieDump.xcodeproj -scheme SelfieDump -sdk iphonesimulator build

# Run tests
xcodebuild -project SelfieDump.xcodeproj -scheme SelfieDump -sdk iphonesimulator test
```

Or simply open `SelfieDump.xcodeproj` in Xcode and use:
- **Cmd+B** to build
- **Cmd+R** to run on simulator
- **Cmd+U** to run tests

### Testing
- **Unit Tests:** `SelfieDumpTests/SelfieDumpTests.swift` - XCTest framework
- **UI Tests:** `SelfieDumpUITests/` - XCUIApplication-based tests

Note: Current tests are template stubs awaiting implementation.

## Code Conventions

### Swift Style
- Standard Apple Swift conventions
- File headers with author and creation date
- Private functions for view-specific logic
- Use of `@Environment` and `@FetchRequest` property wrappers for SwiftUI

### SwiftUI Patterns
- Views are structs conforming to `View` protocol
- Preview providers at bottom of view files
- Animation wrappers for state changes (`withAnimation`)

### CoreData Patterns
- Singleton `PersistenceController.shared` for production
- Static `preview` instance with in-memory store for SwiftUI previews
- Error handling with `fatalError()` in development (replace for production)

### File Organization
- One primary type per file
- File names match primary type names
- Related code grouped in same directory

## Dependencies

**None** - This project uses only Apple-provided frameworks:
- SwiftUI
- CoreData
- CloudKit (via NSPersistentCloudKitContainer)
- XCTest (for testing)

No CocoaPods, Swift Package Manager, or Carthage dependencies.

## Project Status & Roadmap

This project is in **early development**. The core features described in the README (random selfie grid display) are not yet implemented. Current codebase is primarily Xcode template code.

### Planned Features (based on README)
- [ ] Photo library access and permissions
- [ ] Selfie detection/filtering
- [ ] Random image selection
- [ ] 3x3 grid display layout
- [ ] Image refresh functionality

## AI Assistant Guidelines

### When Making Changes

1. **Read before editing** - Always read existing files before proposing modifications
2. **Follow existing patterns** - Match the current SwiftUI and CoreData conventions
3. **Keep it simple** - Avoid over-engineering; the current codebase is minimal
4. **Test compatibility** - Ensure changes work with iOS 15.5+
5. **No external dependencies** - Maintain the pure Apple frameworks approach unless explicitly requested

### Common Tasks

**Adding a new View:**
```swift
// NewView.swift
import SwiftUI

struct NewView: View {
    var body: some View {
        // View content
    }
}

struct NewView_Previews: PreviewProvider {
    static var previews: some View {
        NewView()
    }
}
```

**Adding a CoreData entity:**
1. Edit `SelfieDump.xcdatamodeld` to add entity
2. Regenerate managed object subclass or use automatic code generation
3. Update `Persistence.swift` if needed for preview data

**Accessing the managed object context:**
```swift
@Environment(\.managedObjectContext) private var viewContext
```

### Files to Avoid Modifying
- `SelfieDump.xcodeproj/project.pbxproj` - Let Xcode manage this
- `Assets.xcassets/Contents.json` - Auto-managed by Xcode
- `LICENSE` - GPL v3, do not modify

### Important Considerations
- The app requires photo library permissions (not yet implemented)
- CloudKit sync is enabled in CoreData - changes sync across user devices
- Error handling currently uses `fatalError()` - should be replaced with proper error handling for production

## License

This project is licensed under the **GNU General Public License v3.0** (GPL-3.0).

All contributions must be compatible with this license.
