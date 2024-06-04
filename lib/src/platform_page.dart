/*
 * flutter_platform_widgets
 * Copyright (c) 2021 Lance Johnstone. All rights reserved.
 * See LICENSE for distribution and usage details.
 */

import 'package:flutter/cupertino.dart' show CupertinoPage;
import 'package:flutter/material.dart' show MaterialPage;
import 'package:flutter/widgets.dart';

import 'package:flutter_extended_platform_widgets/src/platform.dart';
import 'package:flutter_extended_platform_widgets/src/widget_base.dart';

abstract class _BasePageData {
  _BasePageData({
    this.child,
    this.name,
    this.maintainState,
    this.fullscreenDialog,
    this.key,
    this.restorationId,
    this.arguments,
    this.allowSnapshotting,
  });

  /// The content to be shown in the [Route] created by this page.
  final Widget? child;

  /// {@macro flutter.widgets.ModalRoute.maintainState}
  final bool? maintainState;

  /// {@macro flutter.widgets.PageRoute.fullscreenDialog}
  final bool? fullscreenDialog;

  /// The key associated with this page.
  ///
  /// This key will be used for comparing pages in [canUpdate].
  final LocalKey? key;

  /// The name of the route (e.g., "/settings").
  ///
  /// If null, the route is anonymous.
  final String? name;

  /// Restoration ID to save and restore the state of the [Route] configured by
  /// this page.
  ///
  /// If no restoration ID is provided, the [Route] will not restore its state.
  ///
  /// See also:
  ///
  ///  * [RestorationManager], which explains how state restoration works in
  ///    Flutter.
  final String? restorationId;

  /// The arguments passed to this route.
  ///
  /// May be used when building the route, e.g. in [Navigator.onGenerateRoute].
  final Object? arguments;

  final bool? allowSnapshotting;
}

class MaterialPageData extends _BasePageData {
  MaterialPageData({
    super.child,
    super.name,
    super.maintainState,
    super.fullscreenDialog,
    super.key,
    super.restorationId,
    super.arguments,
    super.allowSnapshotting,
  });
}

class CupertinoPageData extends _BasePageData {
  CupertinoPageData({
    super.child,
    super.name,
    super.maintainState,
    super.fullscreenDialog,
    super.key,
    super.restorationId,
    super.arguments,
    super.allowSnapshotting,
    this.title,
  });

  /// {@macro flutter.cupertino.CupertinoRouteTransitionMixin.title}
  final String? title;
}

class FluentPageData extends _BasePageData {
  FluentPageData({
    super.child,
    super.name,
    super.maintainState,
    super.fullscreenDialog,
    super.key,
    super.restorationId,
    super.arguments,
    super.allowSnapshotting,
  });
}

Page<dynamic> platformPage({
  required BuildContext context,
  Widget? child,
  String? title,
  String? name,
  bool? maintainState,
  bool? fullscreenDialog,
  LocalKey? key,
  String? restorationId,
  Object? arguments,
  bool allowSnapshotting = true,
  PlatformBuilder<MaterialPageData>? material,
  PlatformBuilder<CupertinoPageData>? cupertino,
  PlatformBuilder<FluentPageData>? windows,
  PlatformBuilder<CupertinoPageData>? macos,
  PlatformBuilder<MaterialPageData>? linux,
  PlatformBuilder<MaterialPageData>? fuchsia,
  PlatformBuilder<MaterialPageData>? web,
}) {
  if (isMaterial(context)) {
    final data = material?.call(context, platform(context));

    return MaterialPage(
      key: data?.key ?? key,
      child: data?.child ?? child!,
      name: data?.name ?? name,
      maintainState: data?.maintainState ?? maintainState ?? true,
      arguments: data?.arguments ?? arguments,
      fullscreenDialog: data?.fullscreenDialog ?? fullscreenDialog ?? false,
      restorationId: data?.restorationId ?? restorationId,
      allowSnapshotting: data?.allowSnapshotting ?? allowSnapshotting,
    );
  } else if (isCupertino(context)) {
    final data = cupertino?.call(context, platform(context));

    return CupertinoPage(
      key: data?.key ?? key,
      child: data?.child ?? child!,
      name: data?.name ?? name,
      maintainState: data?.maintainState ?? maintainState ?? true,
      arguments: data?.arguments ?? arguments,
      fullscreenDialog: data?.fullscreenDialog ?? fullscreenDialog ?? false,
      restorationId: data?.restorationId ?? restorationId,
      title: data?.title ?? title,
      allowSnapshotting: data?.allowSnapshotting ?? allowSnapshotting,
    );
  } else if (isWindows(context)) {
    final data = windows?.call(context, platform(context));

    return _FluentPage(
      key: data?.key ?? key,
      child: data?.child ?? child!,
      name: data?.name ?? name,
      maintainState: data?.maintainState ?? maintainState ?? true,
      arguments: data?.arguments ?? arguments,
      fullscreenDialog: data?.fullscreenDialog ?? fullscreenDialog ?? false,
      restorationId: data?.restorationId ?? restorationId,
      allowSnapshotting: data?.allowSnapshotting ?? allowSnapshotting,
    );
  } else if (isMacos(context)) {
    final data = macos?.call(context, platform(context));

    return CupertinoPage(
      key: data?.key ?? key,
      child: data?.child ?? child!,
      name: data?.name ?? name,
      maintainState: data?.maintainState ?? maintainState ?? true,
      arguments: data?.arguments ?? arguments,
      fullscreenDialog: data?.fullscreenDialog ?? fullscreenDialog ?? false,
      restorationId: data?.restorationId ?? restorationId,
      title: data?.title ?? title,
      allowSnapshotting: data?.allowSnapshotting ?? allowSnapshotting,
    );
  } else if (isLinux(context)) {
    final data = linux?.call(context, platform(context));

    return MaterialPage(
      key: data?.key ?? key,
      child: data?.child ?? child!,
      name: data?.name ?? name,
      maintainState: data?.maintainState ?? maintainState ?? true,
      arguments: data?.arguments ?? arguments,
      fullscreenDialog: data?.fullscreenDialog ?? fullscreenDialog ?? false,
      restorationId: data?.restorationId ?? restorationId,
      allowSnapshotting: data?.allowSnapshotting ?? allowSnapshotting,
    );
  } else if (isFuchsia(context)) {
    final data = fuchsia?.call(context, platform(context));

    return MaterialPage(
      key: data?.key ?? key,
      child: data?.child ?? child!,
      name: data?.name ?? name,
      maintainState: data?.maintainState ?? maintainState ?? true,
      arguments: data?.arguments ?? arguments,
      fullscreenDialog: data?.fullscreenDialog ?? fullscreenDialog ?? false,
      restorationId: data?.restorationId ?? restorationId,
      allowSnapshotting: data?.allowSnapshotting ?? allowSnapshotting,
    );
  } else {
    final data = web?.call(context, platform(context));

    return MaterialPage(
      key: data?.key ?? key,
      child: data?.child ?? child!,
      name: data?.name ?? name,
      maintainState: data?.maintainState ?? maintainState ?? true,
      arguments: data?.arguments ?? arguments,
      fullscreenDialog: data?.fullscreenDialog ?? fullscreenDialog ?? false,
      restorationId: data?.restorationId ?? restorationId,
      allowSnapshotting: data?.allowSnapshotting ?? allowSnapshotting,
    );
  }
}

class _FluentPage<T> extends Page<T> {
  /// Creates a cupertino page.
  const _FluentPage({
    required this.child,
    this.maintainState = true,
    this.title,
    this.fullscreenDialog = false,
    this.allowSnapshotting = true,
    super.key,
    super.name,
    super.arguments,
    super.restorationId,
  });

  /// The content to be shown in the [Route] created by this page.
  final Widget child;

  /// {@macro flutter.cupertino.FluentRouteTransitionMixin.title}
  final String? title;

  /// {@macro flutter.widgets.ModalRoute.maintainState}
  final bool maintainState;

  /// {@macro flutter.widgets.PageRoute.fullscreenDialog}
  final bool fullscreenDialog;

  /// {@macro flutter.widgets.TransitionRoute.allowSnapshotting}
  final bool allowSnapshotting;

  @override
  Route<T> createRoute(BuildContext context) {
    return _PageBasedFluentPageRoute<T>(
      page: this,
      allowSnapshotting: allowSnapshotting,
    );
  }
}

// A page-based version of FluentPageRoute.
//
// This route uses the builder from the page to build its content. This ensures
// the content is up to date after page updates.
class _PageBasedFluentPageRoute<T> extends PageRoute<T> {
  _PageBasedFluentPageRoute({
    required _FluentPage<T> page,
    super.allowSnapshotting = true,
  }) : super(settings: page) {
    assert(opaque);
  }

  _FluentPage<T> get _page => settings as _FluentPage<T>;

  @override
  bool get maintainState => _page.maintainState;

  @override
  bool get fullscreenDialog => _page.fullscreenDialog;

  @override
  String get debugLabel => '${super.debugLabel}(${_page.name})';

  @override
  // TODO: implement barrierColor
  Color? get barrierColor => throw UnimplementedError();

  @override
  // TODO: implement barrierLabel
  String? get barrierLabel => throw UnimplementedError();

  @override
  Widget buildPage(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
  ) {
    // TODO: implement buildPage
    throw UnimplementedError();
  }

  @override
  // TODO: implement transitionDuration
  Duration get transitionDuration => throw UnimplementedError();
}
