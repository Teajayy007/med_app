import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:med_event_app/core/constants/themes.dart';
import 'package:med_event_app/feature/event/ui/views/event_view.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode? themeMode = ThemeMode.light;

  @override
  Widget build(BuildContext context) {
    return PlatformProvider(
        settings: PlatformSettingsData(
          iosUsesMaterialWidgets: true,
          iosUseZeroPaddingForAppbarPlatformIcon: true,
        ),
        builder: (context) {
          return PlatformTheme(
            themeMode: themeMode,
            materialLightTheme: AppTheme.light,
            materialDarkTheme: AppTheme.dark,
            cupertinoLightTheme: AppTheme.cupertinoLightTheme,
            cupertinoDarkTheme: AppTheme.cupertinoDarkTheme,
            matchCupertinoSystemChromeBrightness: true,
            onThemeModeChanged: (themeMode) {
              this.themeMode = themeMode;
            },
            builder: (context) => const PlatformApp(
              title: 'Med Event App',
              debugShowCheckedModeBanner: false,
              home: EventView(),
            ),
          );
        });
  }
}
