# Adding a New Flow to JoJoPlayground

> Step-by-step checklist for adding a new multi-screen flow.
> Tell Claude Code: *"Create a new flow called [YourFlowName] following FLOW_TEMPLATE.md"*

---

## Prerequisites

- Have your Figma screens ready
- Know how many screens your flow will have

---

## Step 1: Register the Flow in ContentView

**File:** `ContentView.swift`

### If this is your FIRST flow:

Replace the default ContentView with the routing pattern:

```swift
import SwiftUI

// MARK: - App Flow

enum AppFlow {
    case yourNewFlow
}

struct ContentView: View {
    @State private var activeFlow: AppFlow?

    var body: some View {
        if let flow = activeFlow {
            switch flow {
            case .yourNewFlow:
                YourNewFlowFlow(onDismiss: { activeFlow = nil })
            }
        } else {
            // Landing screen — replace with your own entrance view
            VStack(spacing: 24) {
                Text("JoJoPlayground")
                    .font(.title)

                Button("Start Flow") {
                    activeFlow = .yourNewFlow
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}
```

### If you already have flows:

Add a new case to the existing `AppFlow` enum and switch:

```swift
enum AppFlow {
    case existingFlow
    case yourNewFlow        // ← add this
}

// In the switch:
case .yourNewFlow:
    YourNewFlowFlow(onDismiss: { activeFlow = nil })
```

---

## Step 2: Create the Flow Folder

Create this folder structure:

```
Features/
└── YourNewFlow/
    ├── YourNewFlowFlow.swift          # Flow coordinator
    ├── YourNewFlowViewModel.swift     # ViewModel + step enum
    └── Views/
        ├── FirstScreenView.swift
        ├── SecondScreenView.swift
        └── ThirdScreenView.swift
```

> **Note:** Xcode 16+ automatically detects new files inside the source folder — no need to manually add them to the project or target.

---

## Step 3: Define the Step Enum & ViewModel

**File:** `YourNewFlowViewModel.swift`

```swift
import SwiftUI

// MARK: - Flow Steps

enum YourNewFlowStep: Hashable {
    case secondScreen
    case thirdScreen
    // The first screen is the root of NavigationStack (not in this enum)
}

// MARK: - View Model

@Observable
class YourNewFlowViewModel {

    /// Navigation path for the flow
    var path: [YourNewFlowStep] = []

    // MARK: State Properties
    // Add your flow-specific state here
    // var someInput: String = ""
    // var selectedOption: SomeType? = nil

    // MARK: Computed Properties
    // var isNextEnabled: Bool { ... }

    // MARK: Actions

    func navigateToStep(_ step: YourNewFlowStep) {
        path.append(step)
    }

    func navigateBack() {
        if !path.isEmpty {
            path.removeLast()
        }
    }

    func resetFlow() {
        path = []
        // Reset all state properties here
    }
}
```

---

## Step 4: Create the Flow Coordinator

**File:** `YourNewFlowFlow.swift`

```swift
import SwiftUI

struct YourNewFlowFlow: View {
    @State private var viewModel = YourNewFlowViewModel()
    var onDismiss: () -> Void

    var body: some View {
        NavigationStack(path: $viewModel.path) {
            FirstScreenView(onDismiss: onDismiss)
                .navigationDestination(for: YourNewFlowStep.self) { step in
                    switch step {
                    case .secondScreen:
                        SecondScreenView()
                    case .thirdScreen:
                        ThirdScreenView(onDismiss: onDismiss)
                    }
                }
        }
        .environment(viewModel)
    }
}

#Preview {
    YourNewFlowFlow(onDismiss: {})
}
```

**Key points:**
- The first screen is the NavigationStack root (not a case in the step enum)
- Pass `onDismiss` to the first screen (for close/back) and the last screen (for final dismiss)
- Inject the ViewModel via `.environment(viewModel)`

---

## Step 5: Build Individual Screens

**File:** `Views/FirstScreenView.swift` (template for any screen)

```swift
import SwiftUI

struct FirstScreenView: View {
    @Environment(YourNewFlowViewModel.self) private var viewModel
    var onDismiss: () -> Void  // Only for screens that can dismiss the flow

    var body: some View {
        VStack(spacing: 0) {
            // -- Top Nav --
            // Add your navigation bar here

            // -- Content --
            // Add your screen content using DS tokens

            Spacer()

            // -- CTA --
            // Add your primary button here
        }
        .navigationBarHidden(true)
    }
}

#Preview {
    NavigationStack {
        FirstScreenView(onDismiss: {})
            .environment(YourNewFlowViewModel())
    }
}
```

**Common patterns:**
- Always hide system nav bar (`.navigationBarHidden(true)`)
- Use `DSSpacing` tokens for all padding/spacing
- Use `DSColors` tokens for all colors
- Use `DSTypography` tokens for all fonts
- Include `#Preview` at the bottom of every view

---

## Step 6: Add Flow-Specific Assets (if needed)

If your flow uses custom icons or images:

1. Export from Figma as PDF (vector) or PNG (raster)
2. Drag into `Assets.xcassets` in Xcode
3. Name them: `{FlowName}-{description}` (e.g., `OrderCard-confirmation`)
4. Reference in code by asset name

---

## Step 7: Add New Components (if needed)

If your flow needs a new reusable component:

1. Create `DesignSystem/Components/DS{ComponentName}.swift`
2. Use only `DSColors`, `DSTypography`, `DSSpacing` tokens
3. Include `#Preview` at the bottom
4. Add the component to `SPEC.md`

---

## Checklist

- [ ] ContentView routing updated (AppFlow enum + switch)
- [ ] Flow folder created (`Features/{FlowName}/`)
- [ ] Step enum defined (in ViewModel file)
- [ ] ViewModel created with `@Observable`
- [ ] Flow coordinator created with `NavigationStack`
- [ ] All screen views created
- [ ] `#Preview` blocks work for all new views
- [ ] Design tokens used (no hardcoded colors/fonts/spacing)
- [ ] `SPEC.md` updated with new flow details
