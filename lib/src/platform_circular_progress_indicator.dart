/*
 * flutter_platform_widgets
 * Copyright (c) 2018 Lance Johnstone. All rights reserved.
 * See LICENSE for distribution and usage details.
 */

import 'package:fluent_ui/fluent_ui.dart' show ProgressRing;
import 'package:flutter/cupertino.dart' show CupertinoActivityIndicator;
import 'package:flutter/material.dart' show CircularProgressIndicator;
import 'package:flutter/widgets.dart';

import 'package:flutter_extended_platform_widgets/src/platform.dart';
import 'package:flutter_extended_platform_widgets/src/widget_base.dart';

const double _kDefaultIndicatorRadius = 10;

abstract class _BaseData {
  _BaseData({
    this.key,
    this.color,
  });

  final Key? key;
  final Color? color;
}

class MaterialProgressIndicatorData extends _BaseData {
  MaterialProgressIndicatorData({
    super.key,
    super.color,
    this.backgroundColor,
    this.strokeWidth,
    this.value,
    this.valueColor,
    this.semanticsLabel,
    this.semanticsValue,
    this.strokeAlign,
    this.strokeCap,
  });

  final Color? backgroundColor;
  final double? strokeWidth;
  final double? value;
  final Animation<Color>? valueColor;
  final String? semanticsLabel;
  final String? semanticsValue;
  final double? strokeAlign;
  final StrokeCap? strokeCap;
}

class CupertinoProgressIndicatorData extends _BaseData {
  CupertinoProgressIndicatorData({
    super.key,
    super.color,
    this.animating,
    this.radius = _kDefaultIndicatorRadius,
  });

  final bool? animating;
  final double? radius;
}

class FluentProgressIndicatorData extends _BaseData {
  FluentProgressIndicatorData({
    super.key,
    super.color,
    this.backgroundColor,
    this.strokeWidth,
    this.value,
    this.valueColor,
    this.semanticsLabel,
    this.semanticsValue,
  });

  final Color? backgroundColor;
  final double? strokeWidth;
  final double? value;
  final Animation<Color>? valueColor;
  final String? semanticsLabel;
  final String? semanticsValue;
}

class PlatformCircularProgressIndicator extends PlatformWidgetBase<
    CircularProgressIndicator,
    CupertinoActivityIndicator,
    ProgressRing,
    CupertinoActivityIndicator,
    CircularProgressIndicator,
    CircularProgressIndicator,
    CircularProgressIndicator> {
  const PlatformCircularProgressIndicator({
    super.key,
    this.widgetKey,
    this.material,
    this.cupertino,
    this.windows,
    this.macos,
    this.linux,
    this.fuchsia,
    this.web,
  });
  final Key? widgetKey;

  final PlatformBuilder<MaterialProgressIndicatorData>? material;
  final PlatformBuilder<CupertinoProgressIndicatorData>? cupertino;
  final PlatformBuilder<FluentProgressIndicatorData>? windows;
  final PlatformBuilder<CupertinoProgressIndicatorData>? macos;
  final PlatformBuilder<MaterialProgressIndicatorData>? linux;
  final PlatformBuilder<MaterialProgressIndicatorData>? fuchsia;
  final PlatformBuilder<MaterialProgressIndicatorData>? web;

  @override
  CircularProgressIndicator createMaterialWidget(BuildContext context) {
    final data = material?.call(context, platform(context));

    return CircularProgressIndicator(
      key: data?.key ?? widgetKey,
      backgroundColor: data?.backgroundColor,
      strokeWidth: data?.strokeWidth ?? 4.0,
      value: data?.value,
      valueColor: data?.valueColor,
      semanticsLabel: data?.semanticsLabel,
      semanticsValue: data?.semanticsValue,
      color: data?.color,
      strokeAlign:
          data?.strokeAlign ?? CircularProgressIndicator.strokeAlignCenter,
      strokeCap: data?.strokeCap,
    );
  }

  @override
  CupertinoActivityIndicator createCupertinoWidget(BuildContext context) {
    final data = cupertino?.call(context, platform(context));

    return CupertinoActivityIndicator(
      key: data?.key ?? widgetKey,
      animating: data?.animating ?? true,
      radius: data?.radius ?? _kDefaultIndicatorRadius,
      color: data?.color,
    );
  }

  @override
  ProgressRing createWindowsWidget(BuildContext context) {
    final data = windows?.call(context, platform(context));

    return ProgressRing(
      key: data?.key ?? widgetKey,
      value: data?.value,
      activeColor: data?.color,
      semanticLabel: data?.semanticsLabel,
      strokeWidth: data?.strokeWidth ?? 4.5,
    );
  }

  //Todo(mehul): change themes here
  @override
  CupertinoActivityIndicator createMacosWidget(BuildContext context) =>
      createCupertinoWidget(context);

  @override
  CircularProgressIndicator createLinuxWidget(BuildContext context) =>
      createMaterialWidget(context);

  @override
  CircularProgressIndicator createFuchsiaWidget(BuildContext context) =>
      createMaterialWidget(context);

  @override
  CircularProgressIndicator createWebWidget(BuildContext context) =>
      createMaterialWidget(context);
}
