# SPMSettingsInDependenciesTester

**Issue**: Swift Package sets Swift/C settings 

```swift
.target(
    name: "SPMSettingsInDependenciesTester",
    dependencies: [.product(name: "SPMSettingsTester-Dynamic", package: "SPMSettingsTester")],
    cSettings: [
        .define("SQLITE_HAS_CODEC", to: "1"),
    ]
),
```

but it does not have any effect

```swift
import SPMSettingsTesterObjCBlank

struct SPMSettingsInDependenciesTester {
    public static func sqliteHasCodec() -> Bool {
        return TesterUndefObj.sqliteHasCodec() // will return false
    }
}
```

in code of package dependency :(

```objective-c
@implementation TesterUndefObj
+ (BOOL)sqliteHasCodec {
    #ifdef SQLITE_HAS_CODEC
        NSLog(@"has CODEC :)");
        return YES;
    #else
        NSLog(@"no CODEC :(");
        return NO;
    #endif
}
@end
```

This can be verified by running the tests
