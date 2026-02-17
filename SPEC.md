# JoJoPlayground — Specification

> Design system reference, architecture, and conventions for the JoJoPlayground starter pack.

---

## 1. Overview

JoJoPlayground is a SwiftUI iOS starter pack for prototyping user flows using your own design system. It comes with the architecture, conventions, and token structure pre-configured — add your design system tokens, fonts, and components to start building flows.

---

## 2. Terminology

Figma-friendly terms used throughout this project. Code equivalents shown in parentheses.

| Term | Definition | Code Equivalent |
|------|-----------|----------------|
| **Flow** | A multi-screen user journey | Folder under `Features/` with `NavigationStack` |
| **Screen / Frame** | A full-screen UI. "Screen" for the app, "frame" in Figma. Interchangeable. | SwiftUI `View` struct, maps to a Step enum case |
| **Page** | A tab in a Figma file containing multiple frames. Not an app concept. | N/A — Figma-only |
| **Component** | A reusable UI piece | Struct in `DesignSystem/Components/` with DS naming |
| **Overlay** | UI on top of a screen: modal, sheet, dialog | `.sheet()`, `.fullScreenCover()`, `.overlay()` |
| **Token** | A named design value: color, font, or spacing | `DSColors`, `DSTypography`, `DSSpacing` |
| **Asset** | An icon, image, or illustration | File in `Assets.xcassets/` |

**Hierarchy:** Flow > Screen (+ Overlays), built with Components, styled with Tokens, using Assets.

---

## 3. Architecture

### Pattern: MVVM + Flow Coordinators

```
┌─────────────────────────────────────────────┐
│ ContentView                                 │
│   @State var activeFlow: AppFlow?           │
│   ├── nil → landing view                    │
│   └── .myFlow → MyFlowFlow                 │
└─────────────────────────────────────────────┘
         │
         ▼
┌─────────────────────────────────────────────┐
│ {FlowName}Flow (Flow Coordinator)           │
│   @State var viewModel                      │
│   NavigationStack(path: $viewModel.path)    │
│     .navigationDestination(for: Step.self)  │
│     .environment(viewModel)                 │
└─────────────────────────────────────────────┘
         │
         ▼
┌─────────────────────────────────────────────┐
│ {FlowName}ViewModel (@Observable)           │
│   var path: [Step]                          │
│   // flow state, computed properties        │
│   // navigation actions                     │
└─────────────────────────────────────────────┘
         │
         ▼
┌─────────────────────────────────────────────┐
│ Screen Views                                │
│   @Environment(ViewModel.self) var viewModel│
│   Uses DS tokens and components             │
└─────────────────────────────────────────────┘
```

- **Navigation:** `NavigationStack` with enum-based type-safe routing (iOS 16+)
- **State:** `@Observable` classes (iOS 17+), injected via `.environment(viewModel)`
- **Root routing:** `ContentView` uses `@State private var activeFlow: AppFlow?` — no nested NavigationStacks
- Each flow owns its own `NavigationStack`
- Flows receive `onDismiss: () -> Void` to return to root

---

## 4. Project Structure

```
JoJoPlayground/
├── JoJoPlayground.xcodeproj/
├── JoJoPlayground/
│   ├── JoJoPlaygroundApp.swift       # @main entry point
│   ├── ContentView.swift             # Root routing
│   ├── Info.plist                    # Font registration, display name
│   │
│   ├── Fonts/                        # Your custom font files (TTF/OTF)
│   │
│   ├── DesignSystem/
│   │   ├── Tokens/
│   │   │   ├── DSColors.swift        # Color tokens
│   │   │   ├── DSTypography.swift    # Typography tokens
│   │   │   └── DSSpacing.swift       # Spacing tokens
│   │   └── Components/              # DS-prefixed reusable components
│   │
│   ├── Assets.xcassets/              # Icons, images, illustrations
│   │
│   └── Features/
│       └── {FlowName}/
│           ├── {FlowName}Flow.swift
│           ├── {FlowName}ViewModel.swift
│           └── Views/
│               ├── FirstScreenView.swift
│               └── ...
│
├── .cursor/rules/jojoplayground.mdc  # Cursor AI rules
├── FLOW_TEMPLATE.md                  # How to add a new flow
├── SPEC.md                           # This file
└── README.md                         # Getting started guide
```

---

## 5. Design System Tokens

### 5.1 Colors (DSColors)

| Token | Value | Usage |
|-------|-------|-------|
| *Add your color tokens here* | | |

### 5.2 Typography (DSTypography)

| Token | Font | Size | Line Height | Usage |
|-------|------|------|-------------|-------|
| *Add your typography tokens here* | | | | |

### 5.3 Spacing (DSSpacing)

| Token | Value | Usage |
|-------|-------|-------|
| *Add your spacing tokens here* | | |

---

## 6. Conventions

### Figma Conventions

*These are recommended best practices. They optimize the Figma-to-code workflow but are not strict requirements.*

#### Page Structure

Organize each Figma file into **3 pages**, ordered bottom-up from primitives to composition:

| Page | Contents | Why |
|------|----------|-----|
| **DS Components** | Reusable design system components (`DS.Button`, `DS.Input`, etc.) with all states/variants | Built first — maps to `DesignSystem/Components/` |
| **Custom Components - {FlowName}** | Flow-specific components not in the global design system | Built second — reusable within the flow |
| **Flow - {FlowName}** | All screens in navigation order, showing the complete user journey | Built last — assembles components into screens |

#### Component Naming

Figma DS components use **dot-slash hierarchy** for grouping:

| Figma Name | Code File | Mapping Rule |
|------------|-----------|--------------|
| `DS.Button / Standard` | `DSButton.swift` | Category becomes filename; variant (`Standard`) becomes a parameter or enum case |
| `DS.Input/DS.TextField` | `DSTextField.swift` | Deepest component name becomes the filename |

- The `DS.` prefix and slashes are for Figma organization — the code filename is always `DS{LeafName}.swift`
- Variants after ` / ` (e.g., `Standard`, `Destructive`) map to component parameters, not separate files

#### Layer Naming

Name layers that represent meaningful UI concepts. Skip generic layout wrappers.

| Layer Type | Name It? | Example |
|------------|----------|---------|
| Component instances | Yes | `DS.Button / Standard` |
| Screen frames (top-level) | Yes | `FirstScreenView - Default` |
| Images, icons, illustrations | Yes | `MyFlow-confirmation` (see Asset Naming below) |
| Semantic sections | Yes | `HeaderSection`, `CTASection` |
| Generic layout wrappers | No | `Frame 12`, `Group 3` — leave default |
| Decorative shapes | No | Rectangles, divider lines — leave default |
| Text layers | No | The visible text content is what matters |

#### Asset Naming

Name image/icon layers in Figma to match the **final asset name** before exporting:

```
Figma layer: "MyFlow-confirmation"
       ↓ export as PDF
Finder file: MyFlow-confirmation.pdf
       ↓ drag into Xcode
Assets.xcassets: MyFlow-confirmation
       ↓ reference in code
SwiftUI: Image("MyFlow-confirmation")
```

Convention: `{FlowName}-{description}` (e.g., `OrderCard-confirmation`, `Onboarding-welcome`)

#### State Variants

Append a state suffix to screen frames and component variants:

- ` - Default` — resting/initial state
- ` - Active` — focused or in-progress state
- ` - Disabled` — non-interactive state
- ` - Error` — validation error state
- ` - Filled` — completed/populated state

Example: `FirstScreenView - Default`, `FirstScreenView - Filled`, `DS.Button / Standard - Disabled`

### File Naming

- Views: `{ScreenName}View.swift`
- ViewModels: `{FlowName}ViewModel.swift`
- Flow coordinators: `{FlowName}Flow.swift`
- Design components: `DS{ComponentName}.swift`
- Design tokens: `DS{Category}.swift`

### Code Style

- Every file starts with a header comment (purpose, flow context)
- Use `// MARK: -` to organize sections
- Include `#Preview` at the bottom of every view file
- Step enums live in the ViewModel file

### Navigation

- Each flow owns its own `NavigationStack(path:)` bound to `viewModel.path`
- Use `.navigationDestination(for: {Step}.self)` for routing
- Always hide system nav bar (`.navigationBarHidden(true)`)
- Pass `onDismiss: () -> Void` closures for flow exit

### State Management

- ViewModels are `@Observable` classes
- Views access ViewModel via `@Environment(ViewModel.self) private var viewModel`
- Views should be as stateless as possible
- Use computed properties for derived state

### SwiftUI Patterns

- Use `VStack(spacing: DSSpacing.none)` as root layout — control spacing explicitly
- Background colors on the outermost container
- Use `Spacer()` for flexible layout, not arbitrary padding
- **ALWAYS** use `DSColors` for colors — never hardcode hex values
- **ALWAYS** use `DSTypography` for fonts — never use `.font(.title)` or `.font(.system(...))`
- **ALWAYS** use `DSSpacing` for padding/spacing — never hardcode numeric values

---

## 7. Asset Management

### Adding Icons

1. Export from Figma as **PDF** (vector)
2. Drag into `Assets.xcassets` in Xcode
3. Reference by asset name in code

### Adding Images

1. Export from Figma as **PDF** (vector) or **PNG** (raster)
2. Drag into `Assets.xcassets` in Xcode
3. Naming convention: `{FlowName}-{description}` (e.g., `OrderCard-confirmation`)

### Adding Components

1. Create in `DesignSystem/Components/` with `DS` prefix
2. Use only token values from `DSColors`, `DSTypography`, `DSSpacing`
3. Include a `#Preview` block at the bottom showing **all states/variants**
4. Add the component to this spec

### Component Testing

Two complementary approaches:

- **`#Preview` blocks** (per-component): Each `DS{Name}.swift` file has a `#Preview` at the bottom showing all states. Use Xcode's canvas for fast iteration — no app launch needed.
- **Component Catalog** (all-at-once): Create a `ComponentCatalogView.swift` in `DesignSystem/` that shows every component in a scrollable view. Run the app to see all components together in a real device context.

---

## 8. How to Add a New Flow

See **FLOW_TEMPLATE.md** for the complete step-by-step checklist with code templates.
