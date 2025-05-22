# EMPaywallManager

<p align="right">
    <a href="#english">🇬🇧 English</a> •
    <a href="#türkçe">🇹🇷 Türkçe</a>
</p>

---

## <a name="english"></a>🇬🇧 English

# EMPaywallManager

**EMPaywallManager** is a modular, protocol-based Swift package that lets you easily integrate beautiful, customizable paywalls into your SwiftUI apps.

- MVVM architecture
- Multiple built-in designs
- Protocol-oriented and testable
- SwiftUI-first and reactive

---

## Features

- 4 built-in paywall designs: `classic`, `modern`, `minimalist`, `bold`
- Clean and extendable architecture
- Dual integration options:
  - `SimplePaywallModel`: plug & play
  - `PaywallModel`: full control
- SwiftUI-native and Combine-compatible
- Built-in support for feature descriptions, buttons, backgrounds, and dismiss actions

---

## Installation

### Swift Package Manager

1. In **Xcode**, go to  
   `File > Add Packages...`

2. Enter the repo URL:

   ```
   https://github.com/merteyup/EMPaywallManager.git
   ```

3. Select the version (`from: 1.0.0`) and finish setup.

---

## Quick Start

### Minimal Setup (using `SimplePaywallModel`)

```swift
import EMPaywallManager
import SwiftUI

@main
struct YourApplication: App {
    
    init() {
        PaywallABManager.shared.configure(variants: [.bold, .classic])
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
```

```swift
import EMPaywallManager

EMPaywallView(
    feature: Feature(id: "pro", title: "Pro Access", price: "$4.99"),
    variant: .bold,
    onSubscribe: { feature in
        // Handle subscription
    },
    onRestore: {
        // Handle restore
    },
    onDismiss: {
        // Handle dismissal
    }
)
```

### Full Customization (using `PaywallModel`)

```swift
let model = PaywallModel(
    title: "Upgrade to Pro",
    subtitle: "Unlock everything",
    features: [
        Feature(id: "pro", title: "Pro Access", price: "$4.99", descriptions: [
            "Unlimited access",
            "No ads"
        ])
    ],
    featureIcon: "star.fill",
    primaryButton: PaywallButtonModel(
        title: "Subscribe Now",
        backgroundColor: .blue,
        foregroundColor: .white
    ),
    secondaryButton: PaywallButtonModel(
        title: "Restore Purchase"
    ),
    dismissButton: DismissButtonModel(
        iconName: "xmark"
    )
)

EMPaywallView(
    model: model,
    variant: .modern,
    onSubscribe: { feature in
        // Handle subscription
    },
    onRestore: {
        // Handle restore
    },
    onDismiss: {
        // Handle dismissal
    }
)
```

---


### Advanced Customization Example

```swift
let model = PaywallModel(
    mainIcon: PaywallIcon(systemName: "crown.fill", color: .yellow),
    title: "Upgrade to Pro",
    subtitle: "Unlock everything and more",
    features: [
        Feature(
            id: "pro_monthly",
            title: "Pro Monthly",
            price: "$4.99/month",
            descriptions: [
                "Full access to premium features",
                "Ad-free experience",
                "Early feature access"
            ]
        ),
        Feature(
            id: "pro_yearly",
            title: "Pro Yearly",
            price: "$49.99/year",
            descriptions: [
                "Save 20% annually",
                "Priority support",
                "Exclusive content"
            ]
        ),
        Feature(
            id: "lifetime",
            title: "Lifetime Access",
            price: "$99.99",
            descriptions: [
                "One-time payment",
                "Lifetime updates",
                "All future content included"
            ]
        )
    ],
    featureIcon: PaywallIcon(systemName: "checkmark.seal.fill", color: .green),
    dismissButton: DismissButtonModel(iconName: "xmark.circle.fill"),
    paywallButton: PaywallButtonModel(
        title: "Subscribe Now",
        backgroundColor: .blue,
        foregroundColor: .white,
        cornerRadius: 12
    ),
    legalTextArea: LegalTextArea(
        text: "By subscribing, you agree to our Terms and Privacy Policy.",
        links: [
            .init(text: "Terms", url: URL(string: "https://example.com/terms")!),
            .init(text: "Privacy Policy", url: URL(string: "https://example.com/privacy")!)
        ]
    )
)

EMPaywallView(
    model: model,
    variant: .modern,
    onSubscribe: { feature in
        // Handle subscription
    },
    onRestore: {
        // Handle restore
    },
    onDismiss: {
        // Handle dismissal
    }
)
```


## Available Variants

```swift
public enum PaywallType: String, CaseIterable {
    case classic
    case modern
    case minimalist
    case bold
}
```

> Coming Soon: `imageHeavy`, `animationDriven`, `testimonialBased`, `gradientStyle`, `splitLayout`, `fullScreen`

---

## Architecture

Each paywall variant follows an MVVM architecture. This ensures:

- Clean separation of concerns
- Testability via dependency injection
- State management via `@StateObject`

You can also create your own custom variant by conforming to `PaywallViewProtocol`.

```swift
public protocol PaywallViewProtocol: View {
    var viewModel: any PaywallViewModelProtocol { get }
}
```

---

## Customization

Want to build your own design? Create a view conforming to `PaywallViewProtocol`:

```swift
struct MyCustomPaywallView: PaywallViewProtocol {
    @StateObject var viewModel: MyCustomViewModel

    var body: some View {
        VStack {
            Text(viewModel.model.title)
            // your custom UI...
        }
    }
}
```

---

## Testing

- MVVM-based structure for logic separation
- Testable ViewModels
- Supports dependency injection
- Use `@testable import EMPaywallManager` in your test targets

## Requirements

- iOS 15.0+
- Swift 5.7+
- Xcode 14+
- SwiftUI

---

## License

MIT License  
Made for you. Use freely. Contribute kindly.

---

## Author

**Eyüp Mert**  
[GitHub](https://github.com/eyupmert) | [LinkedIn](https://linkedin.com/in/eyupmert)

---

## <a name="türkçe"></a>🇹🇷 Türkçe

# EMPaywallManager

**EMPaywallManager**, SwiftUI uygulamalarınıza kolayca entegre edebileceğiniz, özelleştirilebilir ve şık abonelik ekranları sunan modüler, protokol tabanlı bir Swift paketidir.

- MVVM mimarisi
- Hazır tasarım varyantları
- Protokol odaklı ve test edilebilir yapı
- SwiftUI öncelikli ve Combine uyumlu

---

## Özellikler

- 4 yerleşik tasarım: `classic`, `modern`, `minimalist`, `bold`
- Temiz ve genişletilebilir yapı
- İki entegrasyon tipi:
  - `SimplePaywallModel`: Hızlı kullanım
  - `PaywallModel`: Tam kontrol
- SwiftUI-native yapı
- Açıklamalar, butonlar, arka planlar ve yasal metin alanı desteği

---

## Kurulum

### Swift Package Manager

1. **Xcode** menüsünden  
   `File > Add Packages...` seçin

2. Repo URL’sini girin:

   ```
   https://github.com/merteyup/EMPaywallManager.git
   ```

3. Versiyonu seçin (`from: 1.0.0`) ve işlemi tamamlayın.

---

## Hızlı Başlangıç

### Basit Kurulum (`SimplePaywallModel`)

```swift
import EMPaywallManager
import SwiftUI

@main
struct YourApplication: App {
    
    init() {
        PaywallABManager.shared.configure(variants: [.bold, .classic])
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
```

```swift
import EMPaywallManager

EMPaywallView(
    feature: Feature(id: "pro", title: "Pro Erişim", price: "$4.99"),
    variant: .bold,
    onSubscribe: { feature in
        // Abonelik işlemi
    },
    onRestore: {
        // Satın alma geri yükleme
    },
    onDismiss: {
        // Ekranı kapatma
    }
)
```

### Gelişmiş Özelleştirme (`PaywallModel`)

```swift
let model = PaywallModel(
    mainIcon: PaywallIcon(systemName: "crown.fill", color: .yellow),
    title: "Pro’ya Yükseltin",
    subtitle: "Her şeye ve fazlasına erişin",
    features: [
        Feature(
            id: "pro_monthly",
            title: "Aylık Pro",
            price: "$4.99/ay",
            descriptions: [
                "Tüm premium özelliklere erişim",
                "Reklamsız kullanım",
                "Öncelikli destek"
            ]
        ),
        Feature(
            id: "pro_yearly",
            title: "Yıllık Pro",
            price: "$49.99/yıl",
            descriptions: [
                "Yıllık %20 tasarruf",
                "Öncelikli müşteri hizmeti",
                "Beta özelliklere erken erişim"
            ]
        ),
        Feature(
            id: "lifetime",
            title: "Ömür Boyu Erişim",
            price: "$99.99",
            descriptions: [
                "Tek seferlik ödeme",
                "Sonsuz erişim",
                "Ücretsiz güncellemeler"
            ]
        )
    ],
    featureIcon: PaywallIcon(systemName: "checkmark.seal.fill", color: .green),
    dismissButton: DismissButtonModel(iconName: "xmark.circle.fill"),
    paywallButton: PaywallButtonModel(
        title: "Şimdi Abone Ol",
        backgroundColor: .blue,
        foregroundColor: .white,
        cornerRadius: 12
    ),
    legalTextArea: LegalTextArea(
        text: "Abone olarak, Hizmet Şartları ve Gizlilik Politikası'nı kabul etmiş olursunuz.",
        links: [
            .init(text: "Şartlar", url: URL(string: "https://example.com/terms")!),
            .init(text: "Gizlilik", url: URL(string: "https://example.com/privacy")!)
        ]
    )
)

EMPaywallView(
    model: model,
    variant: .modern,
    onSubscribe: { feature in
        // Abonelik işlemi
    },
    onRestore: {
        // Geri yükleme
    },
    onDismiss: {
        // Ekranı kapatma
    }
)
```

---

## Kullanılabilir Varyantlar

```swift
public enum PaywallType: String, CaseIterable {
    case classic
    case modern
    case minimalist
    case bold
}
```

> Yakında: `imageHeavy`, `animationDriven`, `testimonialBased`, `gradientStyle`, `splitLayout`, `fullScreen`

---

## Mimarisi

Her paywall tasarımı MVVM mimarisi ile yapılandırılmıştır:

- Katmanlı yapı
- Test edilebilir ViewModel’ler
- `@StateObject` ile state yönetimi

Ayrıca kendi tasarımınızı oluşturmak için `PaywallViewProtocol` protokolünü kullanabilirsiniz.

---

## Özelleştirme

```swift
struct MyCustomPaywallView: PaywallViewProtocol {
    @StateObject var viewModel: MyCustomViewModel

    var body: some View {
        VStack {
            Text(viewModel.model.title)
            // Özel tasarımınız burada...
        }
    }
}
```

---

## Test Desteği

- MVVM ile mantıksal ayrım
- Test edilebilir ViewModel’ler
- Bağımlılık enjeksiyonu destekli
- `@testable import EMPaywallManager` ile test yazabilirsiniz

---

## Gereksinimler

- iOS 15.0+
- Swift 5.7+
- Xcode 14+
- SwiftUI

---

## Lisans

MIT Lisansı  
Senin için yazıldı. Rahat rahat kullan. Bence katkıda da bulun.

---

## Geliştirici

**Eyüp Mert**  
[GitHub](https://github.com/eyupmert) | [LinkedIn](https://linkedin.com/in/eyupmert)

---
