/*
 * flutter_platform_widgets
 * Copyright (c) 2018 Lance Johnstone. All rights reserved.
 * See LICENSE for distribution and usage details.
 */

import 'dart:ui';

import 'package:fluent_ui/fluent_ui.dart' as fluent;
import 'package:flutter/cupertino.dart'
    show
        CupertinoDynamicColor,
        CupertinoTheme,
        CupertinoThemeData,
        showCupertinoDialog,
        showCupertinoModalPopup;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart'
    show Theme, ThemeData, Colors, showDialog, showModalBottomSheet;
import 'package:flutter/widgets.dart';
import 'package:flutter_extended_platform_widgets/flutter_extended_platform_widgets.dart';

const double _defaultScrollControlDisabledMaxHeightRatio = 9.0 / 16.0;

const Color _kModalBarrierColor = CupertinoDynamicColor.withBrightness(
  color: Color(0x33000000),
  darkColor: Color(0x7A000000),
);

/// Extends on [TargetPlatform] to include web
enum PlatformTarget {
  /// Android: <https://www.android.com/>
  android,

  /// Fuchsia: <https://fuchsia.googlesource.com/>
  fuchsia,

  /// iOS: <https://www.apple.com/ios/>
  iOS,

  /// Linux: <https://www.linux.org>
  linux,

  /// macOS: <https://www.apple.com/macos>
  macOS,

  /// Windows: <https://www.windows.com>
  windows,
  web,
}

PlatformStyle _platformStyle(BuildContext context) {
  final platform = PlatformProvider.of(context)?.platform;

  final platformStyle = PlatformProvider.of(context)?.settings.platformStyle;

  if (platform == null && kIsWeb) {
    return platformStyle?.web ?? PlatformStyle.material;
  }

  switch (platform ?? Theme.of(context).platform) {
    case TargetPlatform.android:
      return platformStyle?.android ?? PlatformStyle.material;
    case TargetPlatform.fuchsia:
      return platformStyle?.fuchsia ?? PlatformStyle.fuchsia;
    case TargetPlatform.iOS:
      return platformStyle?.ios ?? PlatformStyle.cupertino;
    case TargetPlatform.linux:
      return platformStyle?.linux ?? PlatformStyle.linux;
    case TargetPlatform.macOS:
      return platformStyle?.macos ?? PlatformStyle.macos;
    case TargetPlatform.windows:
      return platformStyle?.windows ?? PlatformStyle.windows;
  }
}

bool isMaterial(BuildContext context) =>
    _platformStyle(context) == PlatformStyle.material;

bool isCupertino(BuildContext context) =>
    _platformStyle(context) == PlatformStyle.cupertino;

bool isWindows(BuildContext context) =>
    PlatformStyle.windows == _platformStyle(context);

bool isMacos(BuildContext context) =>
    _platformStyle(context) == PlatformStyle.macos;

bool isLinux(BuildContext context) =>
    _platformStyle(context) == PlatformStyle.linux;

bool isFuchsia(BuildContext context) =>
    _platformStyle(context) == PlatformStyle.fuchsia;

bool isWeb(BuildContext context) =>
    _platformStyle(context) == PlatformStyle.web;

T platformThemeData<T>(
  BuildContext context, {
  required T Function(ThemeData theme) material,
  required T Function(CupertinoThemeData theme) cupertino,
  required T Function(fluent.FluentThemeData theme) windows,
  required T Function(CupertinoThemeData theme) macos,
  required T Function(ThemeData theme) linux,
  required T Function(ThemeData theme) fuchsia,
  required T Function(ThemeData theme) web,
}) {
  if (isMaterial(context)) {
    return material(Theme.of(context));
  } else if (isCupertino(context)) {
    return cupertino(CupertinoTheme.of(context));
  } else if (isWindows(context)) {
    return windows(fluent.FluentTheme.of(context));
  } else if (isMacos(context)) {
    return macos(CupertinoTheme.of(context));
  } else if (isLinux(context)) {
    return linux(Theme.of(context));
  } else if (isFuchsia(context)) {
    return fuchsia(Theme.of(context));
  } else if (isWeb(context)) {
    return web(Theme.of(context));
  }

  return throw UnsupportedError(
    'This platform is not supported: $defaultTargetPlatform',
  );
}

PlatformTarget platform(BuildContext context) {
  if (kIsWeb) {
    return PlatformTarget.web;
  }

  switch (Theme.of(context).platform) {
    case TargetPlatform.android:
      return PlatformTarget.android;
    case TargetPlatform.fuchsia:
      return PlatformTarget.fuchsia;
    case TargetPlatform.iOS:
      return PlatformTarget.iOS;
    case TargetPlatform.linux:
      return PlatformTarget.linux;
    case TargetPlatform.macOS:
      return PlatformTarget.macOS;
    case TargetPlatform.windows:
      return PlatformTarget.windows;
  }
}

abstract class _DialogBaseData {
  final WidgetBuilder? builder;
  final bool? barrierDismissible;
  final RouteSettings? routeSettings;
  final bool? useRootNavigator;
  final String? barrierLabel;
  final Offset? anchorPoint;

  _DialogBaseData({
    this.builder,
    this.barrierDismissible,
    this.routeSettings,
    this.useRootNavigator,
    this.barrierLabel,
    this.anchorPoint,
  });
}

class MaterialDialogData extends _DialogBaseData {
  final bool? useSafeArea;
  final Color? barrierColor;
  final TraversalEdgeBehavior? traversalEdgeBehavior;

  MaterialDialogData({
    super.builder,
    super.barrierDismissible,
    super.routeSettings,
    super.useRootNavigator,
    super.barrierLabel,
    super.anchorPoint,
    this.useSafeArea,
    this.barrierColor,
    this.traversalEdgeBehavior,
  });
}

class CupertinoDialogData extends _DialogBaseData {
  CupertinoDialogData({
    super.builder,
    super.barrierDismissible,
    super.routeSettings,
    super.useRootNavigator,
    super.barrierLabel,
    super.anchorPoint,
  });
}

Future<T?> showPlatformDialog<T>({
  required BuildContext context,
  MaterialDialogData? material,
  CupertinoDialogData? cupertino,
  WidgetBuilder? builder,
  bool? barrierDismissible,
  RouteSettings? routeSettings,
  bool useRootNavigator = true,
  String? barrierLabel,
  Offset? anchorPoint,
}) {
  if (isMaterial(context)) {
    assert(material?.builder != null || builder != null);

    return showDialog<T>(
      context: context,
      builder: material?.builder ?? builder!,
      barrierDismissible:
          material?.barrierDismissible ?? barrierDismissible ?? true,
      routeSettings: material?.routeSettings ?? routeSettings,
      useRootNavigator: material?.useRootNavigator ?? useRootNavigator,
      useSafeArea: material?.useSafeArea ?? true,
      barrierColor: material?.barrierColor ?? Colors.black54,
      barrierLabel: material?.barrierLabel ?? barrierLabel,
      anchorPoint: material?.anchorPoint ?? anchorPoint,
      traversalEdgeBehavior: material?.traversalEdgeBehavior,
    );
  } else {
    assert(cupertino?.builder != null || builder != null);

    return showCupertinoDialog<T>(
      context: context,
      builder: cupertino?.builder ?? builder!,
      routeSettings: cupertino?.routeSettings ?? routeSettings,
      useRootNavigator: cupertino?.useRootNavigator ?? useRootNavigator,
      barrierDismissible:
          cupertino?.barrierDismissible ?? barrierDismissible ?? false,
      barrierLabel: cupertino?.barrierLabel ?? barrierLabel,
      anchorPoint: cupertino?.anchorPoint ?? anchorPoint,
    );
  }
}

abstract class _ModalSheetBaseData {
  _ModalSheetBaseData({this.anchorPoint});

  final Offset? anchorPoint;
}

class MaterialModalSheetData extends _ModalSheetBaseData {
  final Color? backgroundColor;
  final double? elevation;
  final ShapeBorder? shape;
  final bool? isScrollControlled;
  final bool? useRootNavigator;
  final Clip? clipBehavior;
  final Color? barrierColor;
  final bool? enableDrag;
  final bool? isDismissible;
  final RouteSettings? routeSettings;
  final AnimationController? transitionAnimationController;
  final BoxConstraints? constraints;
  final bool? useSafeArea;
  String? barrierLabel;
  double? scrollControlDisabledMaxHeightRatio;
  bool? showDragHandle;
  AnimationStyle? sheetAnimationStyle;

  MaterialModalSheetData({
    super.anchorPoint,
    this.backgroundColor,
    this.elevation,
    this.shape,
    this.isScrollControlled,
    this.useRootNavigator,
    this.clipBehavior,
    this.barrierColor,
    this.enableDrag,
    this.isDismissible,
    this.routeSettings,
    this.transitionAnimationController,
    this.constraints,
    this.useSafeArea,
    this.barrierLabel,
    this.scrollControlDisabledMaxHeightRatio,
    this.showDragHandle,
    this.sheetAnimationStyle,
  });
}

class CupertinoModalSheetData extends _ModalSheetBaseData {
  final ImageFilter? imageFilter;
  final bool? semanticsDismissible;
  final bool? useRootNavigator;
  final Color? barrierColor;
  final bool? barrierDismissible;
  final RouteSettings? routeSettings;

  CupertinoModalSheetData({
    super.anchorPoint,
    this.imageFilter,
    this.semanticsDismissible,
    this.useRootNavigator,
    this.barrierColor,
    this.barrierDismissible,
    this.routeSettings,
  });
}

/// Displays either the showModalBottomSheet for material
/// or showCupertinoModalPopup for cupertino
Future<T?> showPlatformModalSheet<T>({
  required BuildContext context,
  required WidgetBuilder builder,
  MaterialModalSheetData? material,
  CupertinoModalSheetData? cupertino,
}) {
  if (isMaterial(context)) {
    return showModalBottomSheet<T>(
      context: context,
      builder: builder,
      backgroundColor: material?.backgroundColor,
      elevation: material?.elevation,
      shape: material?.shape,
      isScrollControlled: material?.isScrollControlled ?? false,
      useRootNavigator: material?.useRootNavigator ?? false,
      clipBehavior: material?.clipBehavior,
      barrierColor: material?.barrierColor,
      enableDrag: material?.enableDrag ?? true,
      isDismissible: material?.isDismissible ?? true,
      routeSettings: material?.routeSettings,
      transitionAnimationController: material?.transitionAnimationController,
      constraints: material?.constraints,
      anchorPoint: material?.anchorPoint,
      useSafeArea: material?.useSafeArea ?? false,
      barrierLabel: material?.barrierLabel,
      scrollControlDisabledMaxHeightRatio:
          material?.scrollControlDisabledMaxHeightRatio ??
          _defaultScrollControlDisabledMaxHeightRatio,
      showDragHandle: material?.showDragHandle,
      sheetAnimationStyle: material?.sheetAnimationStyle,
    );
  } else {
    return showCupertinoModalPopup<T>(
      context: context,
      builder: builder,
      filter: cupertino?.imageFilter,
      semanticsDismissible: cupertino?.semanticsDismissible ?? false,
      useRootNavigator: cupertino?.useRootNavigator ?? true,
      barrierColor: cupertino?.barrierColor ?? _kModalBarrierColor,
      barrierDismissible: cupertino?.barrierDismissible ?? true,
      routeSettings: cupertino?.routeSettings,
      anchorPoint: cupertino?.anchorPoint,
    );
  }
}
