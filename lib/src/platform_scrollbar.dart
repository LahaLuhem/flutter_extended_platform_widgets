/*
 * flutter_platform_widgets
 * Copyright (c) 2018 Lance Johnstone. All rights reserved.
 * See LICENSE for distribution and usage details.
 */

import 'package:flutter/cupertino.dart' show CupertinoScrollbar;
import 'package:flutter/material.dart' show Scrollbar;
import 'package:fluent_ui/fluent_ui.dart' as fluent;
import 'package:flutter/widgets.dart';

import 'platform.dart';
import 'widget_base.dart';

abstract class _BaseData {
  _BaseData({
    // Common
    this.widgetKey,
    this.child,
    this.controller,
    this.thumbVisibility,
    this.thickness,
    this.radius,
    this.notificationPredicate,
    this.scrollbarOrientation,
  });
  final Key? widgetKey;
  final Widget? child;
  final ScrollController? controller;
  final bool? thumbVisibility;
  final double? thickness;
  final Radius? radius;
  final bool Function(ScrollNotification)? notificationPredicate;
  final ScrollbarOrientation? scrollbarOrientation;
}

class MaterialScrollbarData extends _BaseData {
  MaterialScrollbarData({
    // Common
    super.widgetKey,
    super.child,
    super.controller,
    super.thumbVisibility,
    super.thickness,
    super.radius,
    super.notificationPredicate,
    super.scrollbarOrientation,

    // Material
    this.trackVisibility,
    this.interactive,
  });

  final bool? trackVisibility;
  final bool? interactive;
}

class CupertinoScrollbarData extends _BaseData {
  CupertinoScrollbarData({
    // Common
    super.widgetKey,
    super.child,
    super.controller,
    super.thumbVisibility,
    super.thickness,
    super.radius,
    super.notificationPredicate,
    super.scrollbarOrientation,

    // Cupertino
    this.thicknessWhileDragging,
    this.radiusWhileDragging,
  })  : assert(thickness != null && thickness < double.infinity),
        assert(thicknessWhileDragging != null &&
            thicknessWhileDragging < double.infinity);
  final double? thicknessWhileDragging;
  final Radius? radiusWhileDragging;
}

class FluentScrollbarData extends _BaseData {
  FluentScrollbarData({
    // Common
    super.widgetKey,
    super.child,
    super.controller,
    super.thumbVisibility,
    super.thickness,
    super.radius,
    super.scrollbarOrientation,

    // Fluent
    this.trackVisibility,
    this.interactive,
    this.notificationPredicate,
    this.scrollbarThemeData,
  });

  final bool? trackVisibility;
  final bool? interactive;
  final bool Function(fluent.ScrollNotification)? notificationPredicate;
  final fluent.ScrollbarThemeData? scrollbarThemeData;
}

class PlatformScrollbar extends PlatformWidgetBase<
    Scrollbar,
    CupertinoScrollbar,
    fluent.Scrollbar,
    CupertinoScrollbar,
    Scrollbar,
    Scrollbar,
    Scrollbar> {
  //Common
  final Key? widgetKey;
  final Widget child;
  final ScrollController? controller;
  final bool? thumbVisibility;
  final double? thickness;
  final Radius? radius;
  final bool Function(ScrollNotification)? notificationPredicate;
  final ScrollbarOrientation? scrollbarOrientation;

  //Platform
  final PlatformBuilder<MaterialScrollbarData>? material;
  final PlatformBuilder<CupertinoScrollbarData>? cupertino;
  final PlatformBuilder<FluentScrollbarData>? windows;
  final PlatformBuilder<CupertinoScrollbarData>? macos;
  final PlatformBuilder<MaterialScrollbarData>? linux;
  final PlatformBuilder<CupertinoScrollbarData>? web;
  final PlatformBuilder<MaterialScrollbarData>? fuschsia;

  const PlatformScrollbar({
    //Common
    super.key,
    this.widgetKey,
    required this.child,
    this.controller,
    this.thumbVisibility,
    this.thickness,
    this.radius,
    this.notificationPredicate,
    this.scrollbarOrientation,
    //Platform
    this.material,
    this.cupertino,
    this.windows,
    this.macos,
    this.linux,
    this.web,
    this.fuschsia,
  });

  @override
  Scrollbar createMaterialWidget(BuildContext context) {
    final data = material?.call(context, platform(context));
    return Scrollbar(
      //Common
      key: data?.widgetKey ?? widgetKey,
      child: data?.child ?? child,
      controller: data?.controller ?? controller,
      thumbVisibility: data?.thumbVisibility ?? thumbVisibility,
      thickness: data?.thickness ?? thickness,
      radius: data?.radius ?? radius,
      notificationPredicate:
          data?.notificationPredicate ?? notificationPredicate,
      scrollbarOrientation: data?.scrollbarOrientation ?? scrollbarOrientation,

      //Material only
      trackVisibility: data?.trackVisibility,
      interactive: data?.interactive,
      // showTrackOnHover: deprecated,
    );
  }

  @override
  CupertinoScrollbar createCupertinoWidget(BuildContext context) {
    final data = cupertino?.call(context, platform(context));
    return CupertinoScrollbar(
      //Common
      key: data?.widgetKey ?? widgetKey,
      controller: data?.controller ?? controller,
      child: data?.child ?? child,
      thumbVisibility: data?.thumbVisibility ?? thumbVisibility,
      thickness:
          data?.thickness ?? thickness ?? CupertinoScrollbar.defaultThickness,
      radius: data?.radius ?? radius ?? CupertinoScrollbar.defaultRadius,
      notificationPredicate:
          data?.notificationPredicate ?? notificationPredicate,
      scrollbarOrientation: data?.scrollbarOrientation ?? scrollbarOrientation,

      //Cupertino only
      thicknessWhileDragging: data?.thicknessWhileDragging ??
          CupertinoScrollbar.defaultThicknessWhileDragging,
      radiusWhileDragging: data?.radiusWhileDragging ??
          CupertinoScrollbar.defaultRadiusWhileDragging,
    );
  }

  @override
  fluent.Scrollbar createWindowsWidget(BuildContext context) {
    final data = windows?.call(context, platform(context));
    return fluent.Scrollbar(
      //Common
      key: data?.widgetKey ?? widgetKey,
      controller: data?.controller ?? controller,
      thumbVisibility: data?.thumbVisibility ?? thumbVisibility,
      scrollbarOrientation: data?.scrollbarOrientation ?? scrollbarOrientation,
      interactive: data?.interactive,
      style: data?.scrollbarThemeData,
      child: data?.child ?? child,
    );
  }

  @override
  CupertinoScrollbar createMacosWidget(BuildContext context) =>
      createCupertinoWidget(context);

  @override
  Scrollbar createLinuxWidget(BuildContext context) =>
      createMaterialWidget(context);

  @override
  Scrollbar createWebWidget(BuildContext context) =>
      createMaterialWidget(context);

  @override
  Scrollbar createFuchsiaWidget(BuildContext context) =>
      createMaterialWidget(context);
}
