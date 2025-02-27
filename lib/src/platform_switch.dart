/*
 * flutter_platform_widgets
 * Copyright (c) 2018 Lance Johnstone. All rights reserved.
 * See LICENSE for distribution and usage details.
 */

import 'package:fluent_ui/fluent_ui.dart' show ToggleSwitch;
import 'package:flutter/cupertino.dart' show CupertinoSwitch;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart'
    show WidgetStateProperty, MaterialTapTargetSize, Switch;
import 'package:flutter/widgets.dart';
import 'package:flutter_extended_platform_widgets/src/extensions/macos_color_extensions.dart';
import 'package:macos_ui/macos_ui.dart' show MacosSwitch;

import 'platform.dart';
import 'widget_base.dart';

abstract class _BaseData {
  _BaseData({
    this.widgetKey,
    this.value,
    this.onChanged,
    this.activeColor,
    this.dragStartBehavior,
    this.focusNode,
    this.autofocus,
    this.onFocusChange,
  });

  final Key? widgetKey;
  final bool? value;
  final Color? activeColor;
  final void Function(bool)? onChanged;
  final DragStartBehavior? dragStartBehavior;
  final FocusNode? focusNode;
  final bool? autofocus;
  final ValueChanged<bool>? onFocusChange;
}

class MaterialSwitchData extends _BaseData {
  MaterialSwitchData({
    super.widgetKey,
    super.value,
    super.onChanged,
    super.activeColor,
    super.dragStartBehavior,
    super.focusNode,
    super.autofocus,
    super.onFocusChange,
    this.activeTrackColor,
    this.inactiveThumbColor,
    this.inactiveTrackColor,
    this.activeThumbImage,
    this.inactiveThumbImage,
    this.materialTapTargetSize,
    this.focusColor,
    this.hoverColor,
    this.onActiveThumbImageError,
    this.onInactiveThumbImageError,
    this.mouseCursor,
    this.overlayColor,
    this.splashRadius,
    this.thumbColor,
    this.trackColor,
    this.thumbIcon,
    this.trackOutlineColor,
    this.trackOutlineWidth,
  });

  final Color? activeTrackColor;
  final Color? inactiveThumbColor;
  final Color? inactiveTrackColor;
  final ImageProvider? activeThumbImage;
  final ImageProvider? inactiveThumbImage;
  final MaterialTapTargetSize? materialTapTargetSize;
  final Color? focusColor;
  final Color? hoverColor;
  final ImageErrorListener? onActiveThumbImageError;
  final ImageErrorListener? onInactiveThumbImageError;
  final MouseCursor? mouseCursor;
  final WidgetStateProperty<Color?>? overlayColor;
  final double? splashRadius;
  final WidgetStateProperty<Color?>? thumbColor;
  final WidgetStateProperty<Color?>? trackColor;
  final WidgetStateProperty<Icon?>? thumbIcon;
  final WidgetStateProperty<Color?>? trackOutlineColor;
  final WidgetStateProperty<double?>? trackOutlineWidth;
}

class CupertinoSwitchData extends _BaseData {
  CupertinoSwitchData({
    super.widgetKey,
    super.value,
    super.onChanged,
    super.activeColor,
    super.dragStartBehavior,
    super.focusNode,
    super.autofocus,
    super.onFocusChange,
    this.trackColor,
    this.inactiveTrackColor,
    this.thumbColor,
    this.applyTheme,
    this.focusColor,
    this.offLabelColor,
    this.onLabelColor,
  });

  final Color? inactiveTrackColor;
  final Color? thumbColor;
  final bool? applyTheme;
  final Color? focusColor;
  final Color? offLabelColor;
  final Color? onLabelColor;
  final Color? trackColor;
}

class FluentSwitchData extends _BaseData {
  FluentSwitchData({
    super.widgetKey,
    super.value,
    super.onChanged,
    super.activeColor,
    super.dragStartBehavior,
    super.focusNode,
    super.autofocus,
  });
}

class PlatformSwitch extends PlatformWidgetBase<Switch, CupertinoSwitch,
    ToggleSwitch, MacosSwitch, Switch, Switch, Switch> {
  final Key? widgetKey;

  final bool value;
  final Color? activeColor;
  final void Function(bool)? onChanged;
  final DragStartBehavior? dragStartBehavior;
  final bool? autofocus;
  final FocusNode? focusNode;
  final ValueChanged<bool>? onFocusChange;

  final PlatformBuilder<MaterialSwitchData>? material;
  final PlatformBuilder<CupertinoSwitchData>? cupertino;
  final PlatformBuilder<FluentSwitchData>? windows;
  final PlatformBuilder<CupertinoSwitchData>? macos;
  final PlatformBuilder<MaterialSwitchData>? linux;
  final PlatformBuilder<MaterialSwitchData>? fuchsia;
  final PlatformBuilder<MaterialSwitchData>? web;

  const PlatformSwitch({
    super.key,
    this.widgetKey,
    required this.value,
    required this.onChanged,
    this.dragStartBehavior,
    this.activeColor,
    this.autofocus,
    this.focusNode,
    this.onFocusChange,
    this.material,
    this.cupertino,
    this.windows,
    this.macos,
    this.linux,
    this.web,
    this.fuchsia,
  });

  @override
  Switch createMaterialWidget(BuildContext context) {
    final data = material?.call(context, platform(context));

    return Switch(
      key: data?.widgetKey ?? widgetKey,
      value: data?.value ?? value,
      onChanged: data?.onChanged ?? onChanged,
      activeColor: data?.activeColor ?? activeColor,
      activeThumbImage: data?.activeThumbImage,
      activeTrackColor: data?.activeTrackColor,
      inactiveThumbColor: data?.inactiveThumbColor,
      inactiveThumbImage: data?.inactiveThumbImage,
      inactiveTrackColor: data?.inactiveTrackColor,
      materialTapTargetSize: data?.materialTapTargetSize,
      dragStartBehavior: data?.dragStartBehavior ??
          dragStartBehavior ??
          DragStartBehavior.start,
      autofocus: data?.autofocus ?? autofocus ?? false,
      focusColor: data?.focusColor,
      focusNode: data?.focusNode ?? focusNode,
      hoverColor: data?.hoverColor,
      onActiveThumbImageError: data?.onActiveThumbImageError,
      onInactiveThumbImageError: data?.onInactiveThumbImageError,
      mouseCursor: data?.mouseCursor,
      overlayColor: data?.overlayColor,
      splashRadius: data?.splashRadius,
      thumbColor: data?.thumbColor,
      trackColor: data?.trackColor,
      onFocusChange: data?.onFocusChange ?? onFocusChange,
      thumbIcon: data?.thumbIcon,
      trackOutlineColor: data?.trackOutlineColor,
      trackOutlineWidth: data?.trackOutlineWidth,
    );
  }

  @override
  CupertinoSwitch createCupertinoWidget(BuildContext context) {
    final data = cupertino?.call(context, platform(context));

    return CupertinoSwitch(
      key: data?.widgetKey ?? widgetKey,
      value: data?.value ?? value,
      onChanged: data?.onChanged ?? onChanged,
      activeTrackColor: data?.activeColor ?? activeColor,
      dragStartBehavior: data?.dragStartBehavior ??
          dragStartBehavior ??
          DragStartBehavior.start,
      inactiveTrackColor: data?.inactiveTrackColor,
      thumbColor: data?.thumbColor,
      applyTheme: data?.applyTheme,
      focusColor: data?.focusColor,
      autofocus: data?.autofocus ?? autofocus ?? false,
      focusNode: data?.focusNode ?? focusNode,
      onFocusChange: data?.onFocusChange ?? onFocusChange,
      offLabelColor: data?.offLabelColor,
      onLabelColor: data?.onLabelColor,
    );
  }

  @override
  ToggleSwitch createWindowsWidget(BuildContext context) {
    final data = windows?.call(context, platform(context));

    return ToggleSwitch(
      key: data?.widgetKey ?? widgetKey,
      checked: data?.value ?? value,
      onChanged: data?.onChanged ?? onChanged,
      autofocus: data?.autofocus ?? autofocus ?? false,
      focusNode: data?.focusNode ?? focusNode,
    );
  }

  @override
  MacosSwitch createMacosWidget(BuildContext context) {
    final data = macos?.call(context, platform(context));

    return MacosSwitch(
      key: data?.widgetKey ?? widgetKey,
      value: data?.value ?? value,
      onChanged: data?.onChanged ?? onChanged,
      activeColor: (data?.activeColor ?? activeColor)?.toMacosColor(),
      dragStartBehavior: data?.dragStartBehavior ??
          dragStartBehavior ??
          DragStartBehavior.start,
      trackColor: data?.trackColor?.toMacosColor(),
      knobColor: data?.thumbColor?.toMacosColor(),
    );
  }

  @override
  Switch createLinuxWidget(BuildContext context) =>
      createMaterialWidget(context);

  @override
  Switch createWebWidget(BuildContext context) => createMaterialWidget(context);

  @override
  Switch createFuchsiaWidget(BuildContext context) =>
      createMaterialWidget(context);
}
