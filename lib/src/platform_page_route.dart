/*
 * flutter_platform_widgets
 * Copyright (c) 2018 Lance Johnstone. All rights reserved.
 * See LICENSE for distribution and usage details.
 */

import 'package:fluent_ui/fluent_ui.dart' show FluentPageRoute;
import 'package:flutter/cupertino.dart' show CupertinoPageRoute;
import 'package:flutter/material.dart' show MaterialPageRoute;
import 'package:flutter/widgets.dart';

import 'package:flutter_extended_platform_widgets/src/platform.dart';
import 'package:flutter_extended_platform_widgets/src/widget_base.dart';

class _BasePageRouteData {
  final WidgetBuilder? builder;
  final RouteSettings? settings;
  final bool? maintainState;
  final bool? fullscreenDialog;
  final bool? allowSnapshotting;
  final bool? barrierDismissible;

  _BasePageRouteData({
    this.builder,
    this.settings,
    this.maintainState,
    this.fullscreenDialog,
    this.allowSnapshotting,
    this.barrierDismissible,
  });
}

class MaterialPageRouteData extends _BasePageRouteData {
  MaterialPageRouteData({
    super.builder,
    super.settings,
    super.maintainState,
    super.fullscreenDialog,
    super.allowSnapshotting,
    super.barrierDismissible,
  });
}

class CupertinoPageRouteData extends _BasePageRouteData {
  CupertinoPageRouteData({
    super.builder,
    super.settings,
    super.maintainState,
    super.fullscreenDialog,
    super.allowSnapshotting,
    super.barrierDismissible,
  });
}

class FluentPageRouteData extends _BasePageRouteData {
  FluentPageRouteData({
    super.builder,
    super.settings,
    super.maintainState,
    super.fullscreenDialog,
    super.allowSnapshotting,
    this.barrierLabel,
  });

  final String? barrierLabel;
}

PageRoute<T> platformPageRoute<T>({
  required BuildContext context,
  WidgetBuilder? builder,
  RouteSettings? settings,
  bool? maintainState,
  bool? fullscreenDialog,
  String? iosTitle,
  bool allowSnapshotting = true,
  bool barrierDismissible = false,
  PlatformBuilder<MaterialPageRouteData>? material,
  PlatformBuilder<CupertinoPageRouteData>? cupertino,
  PlatformBuilder<FluentPageRouteData>? windows,
  PlatformBuilder<CupertinoPageRouteData>? macos,
  PlatformBuilder<MaterialPageRouteData>? linux,
  PlatformBuilder<MaterialPageRouteData>? fuchsia,
  PlatformBuilder<MaterialPageRouteData>? web,
}) {
  if (isMaterial(context)) {
    final data = material?.call(context, platform(context));

    return MaterialPageRoute<T>(
      builder: data?.builder ?? builder!,
      settings: data?.settings ?? settings,
      maintainState: data?.maintainState ?? maintainState ?? true,
      fullscreenDialog: data?.fullscreenDialog ?? fullscreenDialog ?? false,
      allowSnapshotting: data?.allowSnapshotting ?? allowSnapshotting,
      barrierDismissible: data?.barrierDismissible ?? barrierDismissible,
    );
  } else if (isCupertino(context)) {
    final data = cupertino?.call(context, platform(context));

    return CupertinoPageRoute<T>(
      builder: data?.builder ?? builder!,
      settings: data?.settings ?? settings,
      maintainState: data?.maintainState ?? maintainState ?? true,
      fullscreenDialog: data?.fullscreenDialog ?? fullscreenDialog ?? false,
      title: iosTitle,
      allowSnapshotting: data?.allowSnapshotting ?? allowSnapshotting,
      barrierDismissible: data?.barrierDismissible ?? barrierDismissible,
    );
  } else if (isWindows(context)) {
    final data = windows?.call(context, platform(context));

    return FluentPageRoute<T>(
      builder: data?.builder ?? builder!,
      settings: data?.settings ?? settings,
      maintainState: data?.maintainState ?? maintainState ?? true,
      fullscreenDialog: data?.fullscreenDialog ?? fullscreenDialog ?? false,
      barrierLabel: data?.barrierLabel,
    );
  } else if (isMacos(context)) {
    final data = macos?.call(context, platform(context));

    return CupertinoPageRoute<T>(
      builder: data?.builder ?? builder!,
      settings: data?.settings ?? settings,
      maintainState: data?.maintainState ?? maintainState ?? true,
      fullscreenDialog: data?.fullscreenDialog ?? fullscreenDialog ?? false,
      title: iosTitle,
      allowSnapshotting: data?.allowSnapshotting ?? allowSnapshotting,
    );
  } else if (isLinux(context)) {
    final data = linux?.call(context, platform(context));

    return MaterialPageRoute<T>(
      builder: data?.builder ?? builder!,
      settings: data?.settings ?? settings,
      maintainState: data?.maintainState ?? maintainState ?? true,
      fullscreenDialog: data?.fullscreenDialog ?? fullscreenDialog ?? false,
      allowSnapshotting: data?.allowSnapshotting ?? allowSnapshotting,
    );
  } else if (isFuchsia(context)) {
    final data = fuchsia?.call(context, platform(context));

    return MaterialPageRoute<T>(
      builder: data?.builder ?? builder!,
      settings: data?.settings ?? settings,
      maintainState: data?.maintainState ?? maintainState ?? true,
      fullscreenDialog: data?.fullscreenDialog ?? fullscreenDialog ?? false,
      allowSnapshotting: data?.allowSnapshotting ?? allowSnapshotting,
    );
  } else {
    final data = web?.call(context, platform(context));

    return MaterialPageRoute<T>(
      builder: data?.builder ?? builder!,
      settings: data?.settings ?? settings,
      maintainState: data?.maintainState ?? maintainState ?? true,
      fullscreenDialog: data?.fullscreenDialog ?? fullscreenDialog ?? false,
      allowSnapshotting: data?.allowSnapshotting ?? allowSnapshotting,
    );
  }
}
