/*
 * flutter_platform_widgets
 * Copyright (c) 2021 Lance Johnstone. All rights reserved.
 * See LICENSE for distribution and usage details.
 */

import 'package:fluent_ui/fluent_ui.dart' as fluent;
import 'package:flutter/cupertino.dart'
    show CupertinoButton, CupertinoColors, CupertinoTheme;
import 'package:flutter/material.dart'
    show ElevatedButton, ButtonStyle, WidgetStatesController;
import 'package:flutter/widgets.dart';

import 'package:flutter_extended_platform_widgets/src/platform.dart';
import 'package:flutter_extended_platform_widgets/src/widget_base.dart';

const double _kMinInteractiveDimensionCupertino = 44;

abstract class _BaseData {
  _BaseData({
    this.widgetKey,
    this.child,
    this.onPressed,
  });

  final Key? widgetKey;
  final Widget? child;
  final VoidCallback? onPressed;
}

class MaterialElevatedButtonData extends _BaseData {
  MaterialElevatedButtonData({
    super.widgetKey,
    super.child,
    super.onPressed,
    this.onLongPress,
    this.focusNode,
    this.style,
    this.autofocus,
    this.clipBehavior,
    this.icon,
    this.onHover,
    this.onFocusChange,
    this.statesController,
  });

  final VoidCallback? onLongPress;
  final FocusNode? focusNode;
  final ButtonStyle? style;
  final bool? autofocus;
  final Clip? clipBehavior;
  final Widget? icon;
  final ValueChanged<bool>? onHover;
  final ValueChanged<bool>? onFocusChange;
  final WidgetStatesController? statesController;
}

class CupertinoElevatedButtonData extends _BaseData {
  CupertinoElevatedButtonData({
    super.widgetKey,
    super.child,
    super.onPressed,
    this.color,
    this.padding,
    this.disabledColor,
    this.borderRadius,
    this.minSize,
    this.pressedOpacity,
    this.alignment,
    this.originalStyle = false,
  });

  final Color? color;
  final EdgeInsetsGeometry? padding;
  final Color? disabledColor;
  final BorderRadius? borderRadius;
  final double? minSize;
  final double? pressedOpacity;
  final AlignmentGeometry? alignment;

  // If true will use the text style rather than the filled style
  final bool originalStyle;
}

class FluentElevatedButtonData extends _BaseData {
  FluentElevatedButtonData({
    super.widgetKey,
    super.child,
    super.onPressed,
    this.onLongPress,
    this.focusNode,
    this.style,
    this.autofocus,
    this.clipBehavior,
    this.icon,
    this.onHover,
    this.onFocusChange,
    this.statesController,
  });

  final VoidCallback? onLongPress;
  final FocusNode? focusNode;
  final fluent.ButtonStyle? style;
  final bool? autofocus;
  final Clip? clipBehavior;
  final Widget? icon;
  final ValueChanged<bool>? onHover;
  final ValueChanged<bool>? onFocusChange;
  final MaterialStatesController? statesController;
}

class PlatformElevatedButton extends PlatformWidgetBase<ElevatedButton, Widget,
    fluent.Button, Widget, ElevatedButton, ElevatedButton, ElevatedButton> {
  const PlatformElevatedButton({
    super.key,
    this.widgetKey,
    this.onPressed,
    this.child,
    this.padding,
    this.alignment,
    this.color,
    this.material,
    this.cupertino,
    this.windows,
    this.macos,
    this.linux,
    this.fuchsia,
    this.web,
  });
  final Key? widgetKey;

  final VoidCallback? onPressed;
  final Widget? child;

  final EdgeInsetsGeometry? padding;
  final AlignmentGeometry? alignment;
  final Color? color;

  final PlatformBuilder<MaterialElevatedButtonData>? material;
  final PlatformBuilder<CupertinoElevatedButtonData>? cupertino;
  final PlatformBuilder<FluentElevatedButtonData>? windows;
  final PlatformBuilder<CupertinoElevatedButtonData>? macos;
  final PlatformBuilder<MaterialElevatedButtonData>? linux;
  final PlatformBuilder<MaterialElevatedButtonData>? fuchsia;
  final PlatformBuilder<MaterialElevatedButtonData>? web;

  @override
  ElevatedButton createMaterialWidget(BuildContext context) {
    final data = material?.call(context, platform(context));

    final icon = data?.icon;

    if (icon != null) {
      return ElevatedButton.icon(
        key: data?.widgetKey ?? widgetKey,
        label: data?.child ?? child!,
        icon: icon,
        onPressed: data?.onPressed ?? onPressed,
        onLongPress: data?.onLongPress,
        autofocus: data?.autofocus ?? false,
        clipBehavior: data?.clipBehavior ?? Clip.none,
        focusNode: data?.focusNode,
        style: data?.style ??
            ElevatedButton.styleFrom(
              backgroundColor: color,
              padding: padding,
              alignment: alignment,
            ),
        onHover: data?.onHover,
        onFocusChange: data?.onFocusChange,
        statesController: data?.statesController,
      );
    }

    return ElevatedButton(
      key: data?.widgetKey ?? widgetKey,
      onPressed: data?.onPressed ?? onPressed,
      onLongPress: data?.onLongPress,
      autofocus: data?.autofocus ?? false,
      clipBehavior: data?.clipBehavior ?? Clip.none,
      focusNode: data?.focusNode,
      style: data?.style ??
          ElevatedButton.styleFrom(
            backgroundColor: color,
            padding: padding,
            alignment: alignment,
          ),
      onHover: data?.onHover,
      onFocusChange: data?.onFocusChange,
      statesController: data?.statesController,
      child: data?.child ?? child!,
    );
  }

  @override
  Widget createCupertinoWidget(BuildContext context) {
    final data = cupertino?.call(context, platform(context));
    if (data?.originalStyle ?? false) {
      return CupertinoButton(
        key: data?.widgetKey ?? widgetKey,
        onPressed: data?.onPressed ?? onPressed,
        borderRadius:
            data?.borderRadius ?? const BorderRadius.all(Radius.circular(8)),
        minSize: data?.minSize ?? _kMinInteractiveDimensionCupertino,
        padding: data?.padding ?? padding,
        pressedOpacity: data?.pressedOpacity ?? 0.4,
        disabledColor:
            data?.disabledColor ?? CupertinoColors.quaternarySystemFill,
        alignment: data?.alignment ?? alignment ?? Alignment.center,
        color: data?.color ?? color,
        child: data?.child ?? child!,
      );
    } else {
      final button = CupertinoButton.filled(
        key: data?.widgetKey ?? widgetKey,
        onPressed: data?.onPressed ?? onPressed,
        borderRadius:
            data?.borderRadius ?? const BorderRadius.all(Radius.circular(8)),
        minSize: data?.minSize ?? _kMinInteractiveDimensionCupertino,
        padding: data?.padding ?? padding,
        pressedOpacity: data?.pressedOpacity ?? 0.4,
        disabledColor:
            data?.disabledColor ?? CupertinoColors.quaternarySystemFill,
        alignment: data?.alignment ?? alignment ?? Alignment.center,
        child: data?.child ?? child!,
      );

      if (color != null) {
        final themeData = CupertinoTheme.of(context);
        return CupertinoTheme(
          data: themeData.copyWith(primaryColor: color),
          child: button,
        );
      }
      return button;
    }
  }

  @override
  fluent.Button createWindowsWidget(BuildContext context) {
    final data = windows?.call(context, platform(context));

    final icon = data?.icon;

    assert(icon != null || data?.child != null || child != null);
    return fluent.FilledButton(
      key: data?.widgetKey ?? widgetKey,
      onPressed: data?.onPressed ?? onPressed,
      onLongPress: data?.onLongPress,
      autofocus: data?.autofocus ?? false,
      focusNode: data?.focusNode,
      style: data?.style,
      child: (icon != null) ? icon : data?.child ?? child!,
    );
  }

  //Todo(mehul): change themes here
  @override
  Widget createMacosWidget(BuildContext context) =>
      createCupertinoWidget(context);

  @override
  ElevatedButton createLinuxWidget(BuildContext context) =>
      createMaterialWidget(context);

  @override
  ElevatedButton createFuchsiaWidget(BuildContext context) =>
      createMaterialWidget(context);

  @override
  ElevatedButton createWebWidget(BuildContext context) =>
      createMaterialWidget(context);
}
