/*
 * flutter_platform_widgets
 * Copyright (c) 2018 Lance Johnstone. All rights reserved.
 * See LICENSE for distribution and usage details.
 */

import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/cupertino.dart' show CupertinoApp, CupertinoThemeData;
import 'package:flutter/material.dart'
    show
        MaterialApp,
        ScaffoldMessengerState,
        Theme,
        ThemeData,
        ThemeMode,
        kThemeAnimationDuration;

import 'platform.dart';
import 'platform_theme.dart';
import 'widget_base.dart';

abstract class _BaseData {
  _BaseData({
    this.widgetKey,
    this.navigatorKey,
    this.home,
    this.routes,
    this.initialRoute,
    this.onGenerateRoute,
    this.onUnknownRoute,
    this.navigatorObservers,
    this.builder,
    this.title,
    this.onGenerateTitle,
    this.color,
    this.locale,
    this.localizationsDelegates,
    this.localeListResolutionCallback,
    this.localeResolutionCallback,
    this.supportedLocales,
    this.showPerformanceOverlay,
    this.checkerboardRasterCacheImages,
    this.checkerboardOffscreenLayers,
    this.showSemanticsDebugger,
    this.debugShowCheckedModeBanner,
    this.shortcuts,
    this.actions,
    this.onGenerateInitialRoutes,
    //ignore: unused_element_parameter
    this.highContrastDarkTheme,
    //ignore: unused_element_parameter
    this.highContrastTheme,
    this.restorationScopeId,
    this.scrollBehavior,
    this.onNavigationNotification,
  });

  final Key? widgetKey;
  final GlobalKey<NavigatorState>? navigatorKey;
  final Widget? home;
  final Map<String, WidgetBuilder>? routes;
  final String? initialRoute;
  final RouteFactory? onGenerateRoute;
  final RouteFactory? onUnknownRoute;
  final List<NavigatorObserver>? navigatorObservers;
  final TransitionBuilder? builder;
  final String? title;
  final GenerateAppTitle? onGenerateTitle;
  final Color? color;
  final Locale? locale;
  final Iterable<LocalizationsDelegate<dynamic>>? localizationsDelegates;
  final LocaleListResolutionCallback? localeListResolutionCallback;
  final LocaleResolutionCallback? localeResolutionCallback;
  final Iterable<Locale>? supportedLocales;
  final bool? showPerformanceOverlay;
  final bool? checkerboardRasterCacheImages;
  final bool? checkerboardOffscreenLayers;
  final bool? showSemanticsDebugger;
  final bool? debugShowCheckedModeBanner;
  final Map<LogicalKeySet, Intent>? shortcuts;
  final Map<Type, Action<Intent>>? actions;
  final InitialRouteListFactory? onGenerateInitialRoutes;
  final ThemeData? highContrastDarkTheme;
  final ThemeData? highContrastTheme;
  final String? restorationScopeId;
  final ScrollBehavior? scrollBehavior;
  final NotificationListenerCallback<NavigationNotification>?
      onNavigationNotification;
}

abstract class _BaseRouterData {
  _BaseRouterData({
    this.widgetKey,
    this.builder,
    this.title,
    this.onGenerateTitle,
    this.color,
    this.locale,
    this.localizationsDelegates,
    this.localeListResolutionCallback,
    this.localeResolutionCallback,
    this.supportedLocales,
    this.showPerformanceOverlay,
    this.checkerboardRasterCacheImages,
    this.checkerboardOffscreenLayers,
    this.showSemanticsDebugger,
    this.debugShowCheckedModeBanner,
    this.shortcuts,
    this.actions,
    this.onGenerateInitialRoutes,
    this.highContrastDarkTheme,
    this.highContrastTheme,
    this.routeInformationProvider,
    this.routeInformationParser,
    this.routerDelegate,
    this.routerConfig,
    this.backButtonDispatcher,
    this.restorationScopeId,
    this.scrollBehavior,
    this.onNavigationNotification,
  });

  final Key? widgetKey;
  final TransitionBuilder? builder;
  final String? title;
  final GenerateAppTitle? onGenerateTitle;
  final Color? color;
  final Locale? locale;
  final Iterable<LocalizationsDelegate<dynamic>>? localizationsDelegates;
  final LocaleListResolutionCallback? localeListResolutionCallback;
  final LocaleResolutionCallback? localeResolutionCallback;
  final Iterable<Locale>? supportedLocales;
  final bool? showPerformanceOverlay;
  final bool? checkerboardRasterCacheImages;
  final bool? checkerboardOffscreenLayers;
  final bool? showSemanticsDebugger;
  final bool? debugShowCheckedModeBanner;
  final Map<LogicalKeySet, Intent>? shortcuts;
  final Map<Type, Action<Intent>>? actions;
  final InitialRouteListFactory? onGenerateInitialRoutes;
  final ThemeData? highContrastDarkTheme;
  final ThemeData? highContrastTheme;

  /// {@macro flutter.widgets.widgetsApp.routeInformationProvider}
  final RouteInformationProvider? routeInformationProvider;

  /// {@macro flutter.widgets.widgetsApp.routeInformationParser}
  final RouteInformationParser<Object>? routeInformationParser;

  /// {@macro flutter.widgets.widgetsApp.routerDelegate}
  final RouterDelegate<Object>? routerDelegate;

  /// {@macro flutter.widgets.widgetsApp.routerConfig}
  final RouterConfig<Object>? routerConfig;

  /// {@macro flutter.widgets.widgetsApp.backButtonDispatcher}
  final BackButtonDispatcher? backButtonDispatcher;

  final String? restorationScopeId;

  final ScrollBehavior? scrollBehavior;

  final NotificationListenerCallback<NavigationNotification>?
      onNavigationNotification;
}

class MaterialAppData extends _BaseData {
  MaterialAppData({
    super.widgetKey,
    super.navigatorKey,
    super.home,
    super.routes,
    super.initialRoute,
    super.onGenerateRoute,
    super.onUnknownRoute,
    super.navigatorObservers,
    super.builder,
    super.title,
    super.onGenerateTitle,
    super.color,
    super.locale,
    super.localizationsDelegates,
    super.localeListResolutionCallback,
    super.localeResolutionCallback,
    super.supportedLocales,
    super.showPerformanceOverlay,
    super.checkerboardRasterCacheImages,
    super.checkerboardOffscreenLayers,
    super.showSemanticsDebugger,
    super.debugShowCheckedModeBanner,
    super.shortcuts,
    super.actions,
    super.onGenerateInitialRoutes,
    super.restorationScopeId,
    super.scrollBehavior,
    super.onNavigationNotification,
    super.highContrastDarkTheme,
    super.highContrastTheme,
    this.theme,
    this.debugShowMaterialGrid,
    this.darkTheme,
    this.themeMode,
    this.scaffoldMessengerKey,
    this.themeAnimationCurve,
    this.themeAnimationDuration,
    this.themeAnimationStyle,
  });

  final ThemeData? theme;
  final bool? debugShowMaterialGrid;
  final ThemeData? darkTheme;
  final ThemeMode? themeMode;
  final GlobalKey<ScaffoldMessengerState>? scaffoldMessengerKey;
  final Curve? themeAnimationCurve;
  final Duration? themeAnimationDuration;
  final AnimationStyle? themeAnimationStyle;
}

class MaterialAppRouterData extends _BaseRouterData {
  MaterialAppRouterData({
    super.widgetKey,
    super.builder,
    super.title,
    super.onGenerateTitle,
    super.color,
    super.locale,
    super.localizationsDelegates,
    super.localeListResolutionCallback,
    super.localeResolutionCallback,
    super.supportedLocales,
    super.showPerformanceOverlay,
    super.checkerboardRasterCacheImages,
    super.checkerboardOffscreenLayers,
    super.showSemanticsDebugger,
    super.debugShowCheckedModeBanner,
    super.routeInformationProvider,
    super.routeInformationParser,
    super.routerDelegate,
    super.routerConfig,
    super.shortcuts,
    super.actions,
    super.onGenerateInitialRoutes,
    super.scrollBehavior,
    super.onNavigationNotification,
    super.restorationScopeId,
    super.backButtonDispatcher,
    super.highContrastDarkTheme,
    super.highContrastTheme,
    this.theme,
    this.debugShowMaterialGrid,
    this.darkTheme,
    this.themeMode,
    this.scaffoldMessengerKey,
    this.themeAnimationCurve,
    this.themeAnimationDuration,
    this.themeAnimationStyle,
  });

  final ThemeData? theme;
  final bool? debugShowMaterialGrid;
  final ThemeData? darkTheme;
  final ThemeMode? themeMode;
  final GlobalKey<ScaffoldMessengerState>? scaffoldMessengerKey;
  final Curve? themeAnimationCurve;
  final Duration? themeAnimationDuration;
  final AnimationStyle? themeAnimationStyle;
}

class CupertinoAppData extends _BaseData {
  CupertinoAppData({
    super.widgetKey,
    super.navigatorKey,
    super.home,
    super.routes,
    super.initialRoute,
    super.onGenerateRoute,
    super.onUnknownRoute,
    super.navigatorObservers,
    super.builder,
    super.title,
    super.onGenerateTitle,
    super.color,
    super.locale,
    super.shortcuts,
    super.actions,
    super.onGenerateInitialRoutes,
    super.localizationsDelegates,
    super.localeListResolutionCallback,
    super.localeResolutionCallback,
    super.supportedLocales,
    super.showPerformanceOverlay,
    super.checkerboardRasterCacheImages,
    super.checkerboardOffscreenLayers,
    super.showSemanticsDebugger,
    super.debugShowCheckedModeBanner,
    super.scrollBehavior,
    this.theme,
  });

  final CupertinoThemeData? theme;
}

class CupertinoAppRouterData extends _BaseRouterData {
  CupertinoAppRouterData({
    super.widgetKey,
    super.builder,
    super.title,
    super.onGenerateTitle,
    super.color,
    super.locale,
    super.shortcuts,
    super.actions,
    super.onGenerateInitialRoutes,
    super.localizationsDelegates,
    super.localeListResolutionCallback,
    super.localeResolutionCallback,
    super.supportedLocales,
    super.showPerformanceOverlay,
    super.checkerboardRasterCacheImages,
    super.checkerboardOffscreenLayers,
    super.showSemanticsDebugger,
    super.debugShowCheckedModeBanner,
    super.routeInformationProvider,
    super.routeInformationParser,
    super.routerDelegate,
    super.routerConfig,
    super.backButtonDispatcher,
    super.scrollBehavior,
    this.theme,
  });

  final CupertinoThemeData? theme;
}

class FluentAppData extends _BaseData {
  FluentAppData({
    super.widgetKey,
    super.navigatorKey,
    super.home,
    super.routes,
    super.initialRoute,
    super.onGenerateRoute,
    super.onUnknownRoute,
    super.navigatorObservers,
    super.builder,
    super.title,
    super.onGenerateTitle,
    super.color,
    super.locale,
    super.shortcuts,
    super.actions,
    super.onGenerateInitialRoutes,
    super.localizationsDelegates,
    super.localeListResolutionCallback,
    super.localeResolutionCallback,
    super.supportedLocales,
    super.showPerformanceOverlay,
    super.checkerboardRasterCacheImages,
    super.checkerboardOffscreenLayers,
    super.showSemanticsDebugger,
    super.debugShowCheckedModeBanner,
    super.scrollBehavior,
    this.theme,
    this.darkTheme,
    this.themeMode,
  });

  final FluentThemeData? theme;
  final FluentThemeData? darkTheme;
  final ThemeMode? themeMode;
}

class FluentAppRouterData extends _BaseRouterData {
  FluentAppRouterData({
    super.widgetKey,
    super.builder,
    super.title,
    super.onGenerateTitle,
    super.color,
    super.locale,
    super.localizationsDelegates,
    super.localeListResolutionCallback,
    super.localeResolutionCallback,
    super.supportedLocales,
    super.showPerformanceOverlay,
    super.checkerboardRasterCacheImages,
    super.checkerboardOffscreenLayers,
    super.showSemanticsDebugger,
    super.debugShowCheckedModeBanner,
    super.routeInformationProvider,
    super.routeInformationParser,
    super.routerDelegate,
    super.routerConfig,
    super.shortcuts,
    super.actions,
    super.onGenerateInitialRoutes,
    super.scrollBehavior,
    super.onNavigationNotification,
    this.theme,
    this.darkTheme,
    this.themeMode,
  });

  final FluentThemeData? theme;
  final FluentThemeData? darkTheme;
  final ThemeMode? themeMode;
}

class PlatformApp extends PlatformWidgetBase<MaterialApp, CupertinoApp,
    FluentApp, CupertinoApp, MaterialApp, MaterialApp, MaterialApp> {
  final Key? widgetKey;
  final GlobalKey<NavigatorState>? navigatorKey;
  final Widget? home;
  final Map<String, WidgetBuilder>? routes;
  final String? initialRoute;
  final RouteFactory? onGenerateRoute;
  final RouteFactory? onUnknownRoute;
  final List<NavigatorObserver>? navigatorObservers;
  final TransitionBuilder? builder;
  final String? title;
  final GenerateAppTitle? onGenerateTitle;
  final Color? color;
  final Locale? locale;
  final Iterable<LocalizationsDelegate<dynamic>>? localizationsDelegates;
  final LocaleListResolutionCallback? localeListResolutionCallback;
  final LocaleResolutionCallback? localeResolutionCallback;
  final Iterable<Locale>? supportedLocales;
  final bool? showPerformanceOverlay;
  final bool? checkerboardRasterCacheImages;
  final bool? checkerboardOffscreenLayers;
  final bool? showSemanticsDebugger;
  final bool? debugShowCheckedModeBanner;
  final Map<LogicalKeySet, Intent>? shortcuts;
  final Map<Type, Action<Intent>>? actions;
  final InitialRouteListFactory? onGenerateInitialRoutes;
  final NotificationListenerCallback<NavigationNotification>?
      onNavigationNotification;

  final PlatformBuilder<MaterialAppData>? material;
  final PlatformBuilder<CupertinoAppData>? cupertino;
  final PlatformBuilder<FluentAppData>? windows;
  final PlatformBuilder<CupertinoAppData>? macos;
  final PlatformBuilder<MaterialAppData>? linux;
  final PlatformBuilder<MaterialAppData>? web;
  final PlatformBuilder<MaterialAppData>? fuchsia;
  final PlatformBuilder<MaterialAppRouterData>? materialRouter;
  final PlatformBuilder<CupertinoAppRouterData>? cupertinoRouter;
  final PlatformBuilder<FluentAppRouterData>? windowsRouter;
  final PlatformBuilder<CupertinoAppRouterData>? macosRouter;
  final PlatformBuilder<MaterialAppRouterData>? linuxRouter;
  final PlatformBuilder<MaterialAppRouterData>? webRouter;
  final PlatformBuilder<MaterialAppRouterData>? fuchsiaRouter;

  /// {@macro flutter.widgets.widgetsApp.routeInformationProvider}
  final RouteInformationProvider? routeInformationProvider;

  /// {@macro flutter.widgets.widgetsApp.routeInformationParser}
  final RouteInformationParser<Object>? routeInformationParser;

  /// {@macro flutter.widgets.widgetsApp.routerDelegate}
  final RouterDelegate<Object>? routerDelegate;

  /// {@macro flutter.widgets.widgetsApp.routerConfig}
  final RouterConfig<Object>? routerConfig;

  /// {@macro flutter.widgets.widgetsApp.backButtonDispatcher}
  final BackButtonDispatcher? backButtonDispatcher;

  final String? restorationScopeId;

  final ScrollBehavior? scrollBehavior;

  const PlatformApp({
    super.key,
    this.widgetKey,
    this.navigatorKey,
    this.home,
    this.routes,
    this.initialRoute,
    this.onGenerateRoute,
    this.onUnknownRoute,
    this.navigatorObservers,
    this.builder,
    this.title,
    this.onGenerateTitle,
    this.color,
    this.locale,
    this.localizationsDelegates,
    this.localeListResolutionCallback,
    this.localeResolutionCallback,
    this.supportedLocales,
    this.showPerformanceOverlay,
    this.checkerboardRasterCacheImages,
    this.checkerboardOffscreenLayers,
    this.showSemanticsDebugger,
    this.debugShowCheckedModeBanner,
    this.shortcuts,
    this.actions,
    this.onGenerateInitialRoutes,
    this.restorationScopeId,
    this.scrollBehavior,
    this.onNavigationNotification,
    this.material,
    this.cupertino,
    this.macos,
    this.windows,
    this.linux,
    this.fuchsia,
    this.web,
  })  : routeInformationProvider = null,
        routeInformationParser = null,
        routerDelegate = null,
        routerConfig = null,
        backButtonDispatcher = null,
        materialRouter = null,
        cupertinoRouter = null,
        windowsRouter = null,
        macosRouter = null,
        linuxRouter = null,
        fuchsiaRouter = null,
        webRouter = null;

  const PlatformApp.router({
    super.key,
    this.routeInformationProvider,
    this.routeInformationParser,
    this.routerDelegate,
    this.routerConfig,
    this.backButtonDispatcher,
    this.widgetKey,
    this.builder,
    this.title,
    this.onGenerateTitle,
    this.color,
    this.locale,
    this.localizationsDelegates,
    this.localeListResolutionCallback,
    this.localeResolutionCallback,
    this.supportedLocales,
    this.showPerformanceOverlay,
    this.checkerboardRasterCacheImages,
    this.checkerboardOffscreenLayers,
    this.showSemanticsDebugger,
    this.debugShowCheckedModeBanner,
    this.shortcuts,
    this.actions,
    this.restorationScopeId,
    this.scrollBehavior,
    this.onNavigationNotification,
    PlatformBuilder<MaterialAppRouterData>? material,
    PlatformBuilder<CupertinoAppRouterData>? cupertino,
    PlatformBuilder<CupertinoAppRouterData>? macos,
    PlatformBuilder<FluentAppRouterData>? windows,
    PlatformBuilder<MaterialAppRouterData>? linux,
    PlatformBuilder<MaterialAppRouterData>? fuchsia,
    PlatformBuilder<MaterialAppRouterData>? web,
  })  : navigatorObservers = null,
        navigatorKey = null,
        onGenerateRoute = null,
        home = null,
        onGenerateInitialRoutes = null,
        onUnknownRoute = null,
        routes = null,
        initialRoute = null,
        material = null,
        cupertino = null,
        macos = null,
        windows = null,
        linux = null,
        fuchsia = null,
        web = null,
        materialRouter = material,
        cupertinoRouter = cupertino,
        macosRouter = macos,
        windowsRouter = windows,
        linuxRouter = linux,
        fuchsiaRouter = fuchsia,
        webRouter = web;

  @override
  createMaterialWidget(BuildContext context) {
    final dataRouter = materialRouter?.call(context, platform(context));

    if (routeInformationParser != null ||
        dataRouter?.routeInformationParser != null ||
        routerConfig != null ||
        dataRouter?.routerConfig != null) {
      assert(dataRouter?.routerDelegate != null ||
          routerDelegate != null ||
          dataRouter?.routerConfig != null ||
          routerConfig != null);

      return MaterialApp.router(
        routeInformationProvider:
            dataRouter?.routeInformationProvider ?? routeInformationProvider,
        routeInformationParser:
            dataRouter?.routeInformationParser ?? routeInformationParser,
        routerDelegate: dataRouter?.routerDelegate ?? routerDelegate,
        routerConfig: dataRouter?.routerConfig ?? routerConfig,
        backButtonDispatcher:
            dataRouter?.backButtonDispatcher ?? backButtonDispatcher,
        builder: dataRouter?.builder ?? builder,
        title: dataRouter?.title ?? title ?? '',
        onGenerateTitle: dataRouter?.onGenerateTitle ?? onGenerateTitle,
        color: dataRouter?.color ?? color,
        theme: (dataRouter?.theme ??
                _getMaterialLightThemeData(context) ??
                Theme.of(context))
            .copyWith(platform: TargetPlatform.android),
        darkTheme: (dataRouter?.darkTheme ?? _getMaterialDarkThemeData(context))
            ?.copyWith(platform: TargetPlatform.android),
        themeMode: dataRouter?.themeMode ??
            _getMaterialThemeMode(context) ??
            ThemeMode.system,
        highContrastDarkTheme: dataRouter?.highContrastDarkTheme,
        highContrastTheme: dataRouter?.highContrastTheme,
        locale: dataRouter?.locale ?? locale,
        localizationsDelegates:
            dataRouter?.localizationsDelegates ?? localizationsDelegates,
        localeListResolutionCallback:
            dataRouter?.localeListResolutionCallback ??
                localeListResolutionCallback,
        localeResolutionCallback:
            dataRouter?.localeResolutionCallback ?? localeResolutionCallback,
        supportedLocales: dataRouter?.supportedLocales ??
            supportedLocales ??
            const <Locale>[Locale('en', 'US')],
        debugShowMaterialGrid: dataRouter?.debugShowMaterialGrid ?? false,
        showPerformanceOverlay: dataRouter?.showPerformanceOverlay ??
            showPerformanceOverlay ??
            false,
        checkerboardRasterCacheImages:
            dataRouter?.checkerboardRasterCacheImages ??
                checkerboardRasterCacheImages ??
                false,
        checkerboardOffscreenLayers: dataRouter?.checkerboardOffscreenLayers ??
            checkerboardOffscreenLayers ??
            false,
        showSemanticsDebugger:
            dataRouter?.showSemanticsDebugger ?? showSemanticsDebugger ?? false,
        debugShowCheckedModeBanner: dataRouter?.debugShowCheckedModeBanner ??
            debugShowCheckedModeBanner ??
            true,
        shortcuts: dataRouter?.shortcuts ?? shortcuts,
        actions: dataRouter?.actions ?? actions,
        key: dataRouter?.widgetKey ?? widgetKey,
        restorationScopeId:
            dataRouter?.restorationScopeId ?? restorationScopeId,
        scaffoldMessengerKey: dataRouter?.scaffoldMessengerKey,
        scrollBehavior: dataRouter?.scrollBehavior ?? scrollBehavior,
        themeAnimationCurve: dataRouter?.themeAnimationCurve ?? Curves.linear,
        themeAnimationDuration:
            dataRouter?.themeAnimationDuration ?? kThemeAnimationDuration,
        onNavigationNotification:
            dataRouter?.onNavigationNotification ?? onNavigationNotification,
        themeAnimationStyle: dataRouter?.themeAnimationStyle,
        // useInheritedMediaQuery: , Deprecated
      );
    } else {
      final data = material?.call(context, platform(context));
      return MaterialApp(
        key: data?.widgetKey ?? widgetKey,
        navigatorKey: data?.navigatorKey ?? navigatorKey,
        home: data?.home ?? home,
        routes: data?.routes ?? routes ?? const <String, WidgetBuilder>{},
        initialRoute: data?.initialRoute ?? initialRoute,
        onGenerateRoute: data?.onGenerateRoute ?? onGenerateRoute,
        onUnknownRoute: data?.onUnknownRoute ?? onUnknownRoute,
        navigatorObservers: data?.navigatorObservers ??
            navigatorObservers ??
            const <NavigatorObserver>[],
        builder: data?.builder ?? builder,
        title: data?.title ?? title ?? '',
        onGenerateTitle: data?.onGenerateTitle ?? onGenerateTitle,
        color: data?.color ?? color,
        locale: data?.locale ?? locale,
        localizationsDelegates:
            data?.localizationsDelegates ?? localizationsDelegates,
        localeListResolutionCallback:
            data?.localeListResolutionCallback ?? localeListResolutionCallback,
        localeResolutionCallback:
            data?.localeResolutionCallback ?? localeResolutionCallback,
        supportedLocales: data?.supportedLocales ??
            supportedLocales ??
            const <Locale>[Locale('en', 'US')],
        showPerformanceOverlay:
            data?.showPerformanceOverlay ?? showPerformanceOverlay ?? false,
        checkerboardRasterCacheImages: data?.checkerboardRasterCacheImages ??
            checkerboardRasterCacheImages ??
            false,
        checkerboardOffscreenLayers: data?.checkerboardOffscreenLayers ??
            checkerboardOffscreenLayers ??
            false,
        showSemanticsDebugger:
            data?.showSemanticsDebugger ?? showSemanticsDebugger ?? false,
        debugShowCheckedModeBanner: data?.debugShowCheckedModeBanner ??
            debugShowCheckedModeBanner ??
            true,
        debugShowMaterialGrid: data?.debugShowMaterialGrid ?? false,
        theme: (data?.theme ??
                _getMaterialLightThemeData(context) ??
                Theme.of(context))
            .copyWith(platform: TargetPlatform.android),
        darkTheme: (data?.darkTheme ?? _getMaterialDarkThemeData(context))
            ?.copyWith(platform: TargetPlatform.android),
        themeMode: data?.themeMode ??
            _getMaterialThemeMode(context) ??
            ThemeMode.system,
        shortcuts: data?.shortcuts ?? shortcuts,
        actions: data?.actions ?? actions,
        onGenerateInitialRoutes:
            data?.onGenerateInitialRoutes ?? onGenerateInitialRoutes,
        highContrastDarkTheme: data?.highContrastDarkTheme,
        highContrastTheme: data?.highContrastTheme,
        restorationScopeId: data?.restorationScopeId ?? restorationScopeId,
        scaffoldMessengerKey: data?.scaffoldMessengerKey,
        scrollBehavior: data?.scrollBehavior ?? scrollBehavior,
        themeAnimationCurve: data?.themeAnimationCurve ?? Curves.linear,
        themeAnimationDuration:
            data?.themeAnimationDuration ?? kThemeAnimationDuration,
        onNavigationNotification:
            data?.onNavigationNotification ?? onNavigationNotification,
        themeAnimationStyle: data?.themeAnimationStyle,
        // useInheritedMediaQuery: , Deprecated
      );
    }
  }

  @override
  createCupertinoWidget(BuildContext context) {
    final dataRouter = cupertinoRouter?.call(context, platform(context));

    if (routeInformationParser != null ||
        dataRouter?.routeInformationParser != null ||
        routerConfig != null ||
        dataRouter?.routerConfig != null) {
      assert(dataRouter?.routerDelegate != null ||
          routerDelegate != null ||
          dataRouter?.routerConfig != null ||
          routerConfig != null);

      return CupertinoApp.router(
        routeInformationProvider:
            dataRouter?.routeInformationProvider ?? routeInformationProvider,
        routeInformationParser:
            dataRouter?.routeInformationParser ?? routeInformationParser,
        routerDelegate: dataRouter?.routerDelegate ?? routerDelegate,
        routerConfig: dataRouter?.routerConfig ?? routerConfig,
        backButtonDispatcher:
            dataRouter?.backButtonDispatcher ?? backButtonDispatcher,
        theme: dataRouter?.theme ?? _getCupertinoTheme(context),
        builder: dataRouter?.builder ?? builder,
        title: dataRouter?.title ?? title ?? '',
        onGenerateTitle: dataRouter?.onGenerateTitle ?? onGenerateTitle,
        color: dataRouter?.color ?? color,
        locale: dataRouter?.locale ?? locale,
        localizationsDelegates:
            dataRouter?.localizationsDelegates ?? localizationsDelegates,
        localeListResolutionCallback:
            dataRouter?.localeListResolutionCallback ??
                localeListResolutionCallback,
        localeResolutionCallback:
            dataRouter?.localeResolutionCallback ?? localeResolutionCallback,
        supportedLocales: dataRouter?.supportedLocales ??
            supportedLocales ??
            const <Locale>[Locale('en', 'US')],
        showPerformanceOverlay: dataRouter?.showPerformanceOverlay ??
            showPerformanceOverlay ??
            false,
        checkerboardRasterCacheImages:
            dataRouter?.checkerboardRasterCacheImages ??
                checkerboardRasterCacheImages ??
                false,
        checkerboardOffscreenLayers: dataRouter?.checkerboardOffscreenLayers ??
            checkerboardOffscreenLayers ??
            false,
        showSemanticsDebugger:
            dataRouter?.showSemanticsDebugger ?? showSemanticsDebugger ?? false,
        debugShowCheckedModeBanner: dataRouter?.debugShowCheckedModeBanner ??
            debugShowCheckedModeBanner ??
            true,
        shortcuts: dataRouter?.shortcuts ?? shortcuts,
        actions: dataRouter?.actions ?? actions,
        key: dataRouter?.widgetKey ?? widgetKey,
        restorationScopeId:
            dataRouter?.restorationScopeId ?? restorationScopeId,
        scrollBehavior: dataRouter?.scrollBehavior ?? scrollBehavior,
        onNavigationNotification:
            dataRouter?.onNavigationNotification ?? onNavigationNotification,
        // useInheritedMediaQuery: , Deprecated
      );
    } else {
      final data = cupertino?.call(context, platform(context));

      return CupertinoApp(
        key: data?.widgetKey ?? widgetKey,
        navigatorKey: data?.navigatorKey ?? navigatorKey,
        home: data?.home ?? home,
        routes: data?.routes ?? routes ?? const <String, WidgetBuilder>{},
        initialRoute: data?.initialRoute ?? initialRoute,
        onGenerateRoute: data?.onGenerateRoute ?? onGenerateRoute,
        onUnknownRoute: data?.onUnknownRoute ?? onUnknownRoute,
        navigatorObservers: data?.navigatorObservers ??
            navigatorObservers ??
            const <NavigatorObserver>[],
        builder: data?.builder ?? builder,
        title: data?.title ?? title ?? '',
        onGenerateTitle: data?.onGenerateTitle ?? onGenerateTitle,
        color: data?.color ?? color,
        locale: data?.locale ?? locale,
        localizationsDelegates:
            data?.localizationsDelegates ?? localizationsDelegates,
        localeListResolutionCallback:
            data?.localeListResolutionCallback ?? localeListResolutionCallback,
        localeResolutionCallback:
            data?.localeResolutionCallback ?? localeResolutionCallback,
        supportedLocales: data?.supportedLocales ??
            supportedLocales ??
            const <Locale>[Locale('en', 'US')],
        showPerformanceOverlay:
            data?.showPerformanceOverlay ?? showPerformanceOverlay ?? false,
        checkerboardRasterCacheImages: data?.checkerboardRasterCacheImages ??
            checkerboardRasterCacheImages ??
            false,
        checkerboardOffscreenLayers: data?.checkerboardOffscreenLayers ??
            checkerboardOffscreenLayers ??
            false,
        showSemanticsDebugger:
            data?.showSemanticsDebugger ?? showSemanticsDebugger ?? false,
        debugShowCheckedModeBanner: data?.debugShowCheckedModeBanner ??
            debugShowCheckedModeBanner ??
            true,
        theme: data?.theme ?? _getCupertinoTheme(context),
        shortcuts: data?.shortcuts ?? shortcuts,
        actions: data?.actions ?? actions,
        onGenerateInitialRoutes:
            data?.onGenerateInitialRoutes ?? onGenerateInitialRoutes,
        restorationScopeId: data?.restorationScopeId ?? restorationScopeId,
        scrollBehavior: data?.scrollBehavior ?? scrollBehavior,
        onNavigationNotification:
            data?.onNavigationNotification ?? onNavigationNotification,
        // useInheritedMediaQuery: , Deprecated
      );
    }
  }

  ThemeData? _getMaterialLightThemeData(BuildContext context) {
    return PlatformTheme.of(context)?.materialLightTheme;
  }

  ThemeData? _getMaterialDarkThemeData(BuildContext context) {
    return PlatformTheme.of(context)?.materialDarkTheme;
  }

  ThemeMode? _getMaterialThemeMode(BuildContext context) {
    return PlatformTheme.of(context)?.themeMode;
  }

  CupertinoThemeData? _getCupertinoTheme(BuildContext context) {
    final isDark = PlatformTheme.of(context)?.isDark;
    final lightTheme = PlatformTheme.of(context)?.cupertinoLightTheme;
    final darkTheme = PlatformTheme.of(context)?.cupertinoDarkTheme ??
        PlatformTheme.of(context)?.cupertinoLightTheme;
    final theme = isDark == null
        ? null
        : isDark
            ? darkTheme
            : lightTheme;

    return theme;
  }

  @override
  FluentApp createWindowsWidget(BuildContext context) {
    final dataRouter = windowsRouter?.call(context, platform(context));

    if (routeInformationParser != null ||
        dataRouter?.routeInformationParser != null ||
        routerConfig != null ||
        dataRouter?.routerConfig != null) {
      assert(
        dataRouter?.routerDelegate != null ||
            routerDelegate != null ||
            dataRouter?.routerConfig != null ||
            routerConfig != null,
      );
      return FluentApp.router(
        routeInformationProvider:
            dataRouter?.routeInformationProvider ?? routeInformationProvider,
        routeInformationParser:
            dataRouter?.routeInformationParser ?? routeInformationParser,
        routerDelegate: dataRouter?.routerDelegate ?? routerDelegate,
        routerConfig: dataRouter?.routerConfig ?? routerConfig,
        backButtonDispatcher:
            dataRouter?.backButtonDispatcher ?? backButtonDispatcher,
        builder: dataRouter?.builder ?? builder,
        title: dataRouter?.title ?? title ?? '',
        onGenerateTitle: dataRouter?.onGenerateTitle ?? onGenerateTitle,
        color: dataRouter?.color ?? color,
        theme: dataRouter?.theme ?? _getFluentLightTheme(context),
        darkTheme: dataRouter?.darkTheme ?? _getFluentDarkTheme(context),
        themeMode: dataRouter?.themeMode ??
            _getFluentThemeMode(context) ??
            ThemeMode.system,
        locale: dataRouter?.locale ?? locale,
        localizationsDelegates:
            dataRouter?.localizationsDelegates ?? localizationsDelegates,
        localeListResolutionCallback:
            dataRouter?.localeListResolutionCallback ??
                localeListResolutionCallback,
        localeResolutionCallback:
            dataRouter?.localeResolutionCallback ?? localeResolutionCallback,
        supportedLocales: dataRouter?.supportedLocales ??
            supportedLocales ??
            const <Locale>[Locale('en', 'US')],
        showPerformanceOverlay: dataRouter?.showPerformanceOverlay ??
            showPerformanceOverlay ??
            false,
        showSemanticsDebugger:
            dataRouter?.showSemanticsDebugger ?? showSemanticsDebugger ?? false,
        debugShowCheckedModeBanner: dataRouter?.debugShowCheckedModeBanner ??
            debugShowCheckedModeBanner ??
            true,
        shortcuts: dataRouter?.shortcuts ?? shortcuts,
        actions: dataRouter?.actions ?? actions,
        key: dataRouter?.widgetKey ?? widgetKey,
        restorationScopeId:
            dataRouter?.restorationScopeId ?? restorationScopeId,
        scrollBehavior: dataRouter?.scrollBehavior ??
            scrollBehavior ??
            const FluentScrollBehavior(),
      );
    } else {
      final data = windows?.call(context, platform(context));
      return FluentApp(
        key: data?.widgetKey ?? widgetKey,
        navigatorKey: data?.navigatorKey ?? navigatorKey,
        home: data?.home ?? home,
        routes: data?.routes ?? routes ?? const <String, WidgetBuilder>{},
        initialRoute: data?.initialRoute ?? initialRoute,
        onGenerateRoute: data?.onGenerateRoute ?? onGenerateRoute,
        onUnknownRoute: data?.onUnknownRoute ?? onUnknownRoute,
        navigatorObservers: data?.navigatorObservers ??
            navigatorObservers ??
            const <NavigatorObserver>[],
        builder: data?.builder ?? builder,
        title: data?.title ?? title ?? '',
        onGenerateTitle: data?.onGenerateTitle ?? onGenerateTitle,
        color: data?.color ?? color,
        locale: data?.locale ?? locale,
        localizationsDelegates:
            data?.localizationsDelegates ?? localizationsDelegates,
        localeListResolutionCallback:
            data?.localeListResolutionCallback ?? localeListResolutionCallback,
        localeResolutionCallback:
            data?.localeResolutionCallback ?? localeResolutionCallback,
        supportedLocales: data?.supportedLocales ??
            supportedLocales ??
            const <Locale>[Locale('en', 'US')],
        showPerformanceOverlay:
            data?.showPerformanceOverlay ?? showPerformanceOverlay ?? false,
        showSemanticsDebugger:
            data?.showSemanticsDebugger ?? showSemanticsDebugger ?? false,
        debugShowCheckedModeBanner: data?.debugShowCheckedModeBanner ??
            debugShowCheckedModeBanner ??
            true,
        theme: dataRouter?.theme ?? _getFluentLightTheme(context),
        darkTheme: dataRouter?.darkTheme ?? _getFluentDarkTheme(context),
        themeMode: dataRouter?.themeMode ??
            _getFluentThemeMode(context) ??
            ThemeMode.system,
        shortcuts: data?.shortcuts ?? shortcuts,
        actions: data?.actions ?? actions,
        onGenerateInitialRoutes:
            data?.onGenerateInitialRoutes ?? onGenerateInitialRoutes,
        restorationScopeId: data?.restorationScopeId ?? restorationScopeId,
        scrollBehavior: data?.scrollBehavior ??
            scrollBehavior ??
            const FluentScrollBehavior(),
      );
    }
  }

  FluentThemeData? _getFluentLightTheme(BuildContext context) =>
      PlatformTheme.of(context)?.fluentLightTheme;

  FluentThemeData? _getFluentDarkTheme(BuildContext context) =>
      PlatformTheme.of(context)?.fluentDarkTheme;

  ThemeMode? _getFluentThemeMode(BuildContext context) =>
      PlatformTheme.of(context)?.themeMode;

  //Todo(mehul): change themes here
  @override
  CupertinoApp createMacosWidget(BuildContext context) =>
      createCupertinoWidget(context);

  @override
  MaterialApp createLinuxWidget(BuildContext context) =>
      createMaterialWidget(context);

  @override
  MaterialApp createFuchsiaWidget(BuildContext context) =>
      createMaterialWidget(context);

  @override
  MaterialApp createWebWidget(BuildContext context) =>
      createMaterialWidget(context);
}
