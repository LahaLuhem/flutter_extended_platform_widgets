/*
 * flutter_platform_widgets
 * Copyright (c) 2018 Lance Johnstone. All rights reserved.
 * See LICENSE for distribution and usage details.
 */

import 'package:fluent_ui/fluent_ui.dart' as fluent;
import 'package:flutter/cupertino.dart'
    show CupertinoButton, CupertinoColors, CupertinoNavigationBar;
import 'package:flutter/material.dart'
    show ButtonStyle, IconButton, VisualDensity;
import 'package:flutter/widgets.dart';
import 'package:flutter_extended_platform_widgets/src/parent_widget_finder.dart';
import 'package:flutter_extended_platform_widgets/src/platform.dart';
import 'package:flutter_extended_platform_widgets/src/platform_provider.dart';
import 'package:flutter_extended_platform_widgets/src/widget_base.dart';

const double _kMinInteractiveDimensionCupertino = 44;

abstract class _BaseData {
  _BaseData({
    this.widgetKey,
    this.icon,
    this.onPressed,
    this.padding,
    this.color,
    this.disabledColor,
  });

  final Key? widgetKey;
  final Widget? icon;
  final void Function()? onPressed;
  final EdgeInsets? padding;
  final Color? color;
  final Color? disabledColor;
}

class MaterialIconButtonData extends _BaseData {
  MaterialIconButtonData({
    super.widgetKey,
    super.icon,
    super.onPressed,
    super.padding,
    super.color,
    super.disabledColor,
    this.alignment,
    this.highlightColor,
    this.iconSize = 24.0,
    this.splashColor,
    this.tooltip,
    this.focusColor,
    this.hoverColor,
    this.focusNode,
    this.autofocus,
    this.enableFeedback,
    this.visualDensity,
    this.constraints,
    this.splashRadius,
    this.mouseCursor,
    this.isSelected,
    this.selectedIcon,
    this.style,
  });

  final AlignmentGeometry? alignment;
  final Color? highlightColor;
  final double? iconSize;
  final Color? splashColor;
  final String? tooltip;
  final Color? focusColor;
  final Color? hoverColor;
  final FocusNode? focusNode;
  final bool? autofocus;
  final bool? enableFeedback;
  final VisualDensity? visualDensity;
  final BoxConstraints? constraints;
  final double? splashRadius;
  final MouseCursor? mouseCursor;
  final bool? isSelected;
  final Widget? selectedIcon;
  final ButtonStyle? style;
}

class CupertinoIconButtonData extends _BaseData {
  CupertinoIconButtonData({
    super.widgetKey,
    super.icon,
    super.onPressed,
    super.padding,
    super.color,
    super.disabledColor,
    this.borderRadius,
    this.minSize,
    this.pressedOpacity,
    this.alignment,
  });

  final BorderRadius? borderRadius;
  final double? minSize;
  final double? pressedOpacity;
  final AlignmentGeometry? alignment;
}

class FluentIconButtonData extends _BaseData {
  FluentIconButtonData({
    super.widgetKey,
    super.icon,
    super.onPressed,
    super.padding,
    super.color,
    super.disabledColor,
    this.focusNode,
    this.autofocus,
    this.style,
    this.iconButtonMode,
  });

  final FocusNode? focusNode;
  final bool? autofocus;
  final fluent.IconButtonMode? iconButtonMode;
  final fluent.ButtonStyle? style;
}

class PlatformIconButton extends PlatformWidgetBase<IconButton, CupertinoButton,
    fluent.IconButton, CupertinoButton, IconButton, IconButton, IconButton> {
  const PlatformIconButton({
    super.key,
    this.widgetKey,
    this.icon,
    this.onPressed,
    this.color,
    this.disabledColor,
    this.padding,
    this.materialIcon,
    this.cupertinoIcon,
    this.windowsIcon,
    this.macosIcon,
    this.linuxIcon,
    this.fuchsiaIcon,
    this.webIcon,
    this.material,
    this.cupertino,
    this.windows,
    this.macos,
    this.linux,
    this.fuchsia,
    this.web,
  });
  final Key? widgetKey;

  final Widget? icon;
  final Widget? cupertinoIcon;
  final Widget? materialIcon;
  final Widget? windowsIcon;
  final Widget? macosIcon;
  final Widget? linuxIcon;
  final Widget? fuchsiaIcon;
  final Widget? webIcon;
  final void Function()? onPressed;
  final Color? color;
  final EdgeInsets? padding;
  final Color? disabledColor;

  final PlatformBuilder<MaterialIconButtonData>? material;
  final PlatformBuilder<CupertinoIconButtonData>? cupertino;
  final PlatformBuilder<FluentIconButtonData>? windows;
  final PlatformBuilder<CupertinoIconButtonData>? macos;
  final PlatformBuilder<MaterialIconButtonData>? linux;
  final PlatformBuilder<CupertinoIconButtonData>? fuchsia;
  final PlatformBuilder<MaterialIconButtonData>? web;

  @override
  IconButton createMaterialWidget(BuildContext context) {
    final data = material?.call(context, platform(context));

    // icon is required non nullable
    assert(data?.icon != null || materialIcon != null || icon != null);

    return IconButton(
      key: data?.widgetKey ?? widgetKey,
      icon: data?.icon ?? materialIcon ?? icon!,
      onPressed: data?.onPressed ?? onPressed,
      padding: data?.padding ?? padding ?? const EdgeInsets.all(8),
      color: data?.color ?? color,
      alignment: data?.alignment ?? Alignment.center,
      disabledColor: data?.disabledColor ?? disabledColor,
      highlightColor: data?.highlightColor,
      iconSize: data?.iconSize ?? 24.0,
      splashColor: data?.splashColor,
      tooltip: data?.tooltip,
      focusColor: data?.focusColor,
      focusNode: data?.focusNode,
      hoverColor: data?.hoverColor,
      autofocus: data?.autofocus ?? false,
      enableFeedback: data?.enableFeedback ?? true,
      visualDensity: data?.visualDensity,
      constraints: data?.constraints,
      splashRadius: data?.splashRadius,
      mouseCursor: data?.mouseCursor ?? SystemMouseCursors.click,
      isSelected: data?.isSelected,
      selectedIcon: data?.selectedIcon,
      style: data?.style,
    );
  }

  @override
  CupertinoButton createCupertinoWidget(BuildContext context) {
    final data = cupertino?.call(context, platform(context));

    // icon is required non nullable
    assert(data?.icon != null || cupertinoIcon != null || icon != null);

    // If the IconButton is placed inside the AppBar, we need to have zero padding.
    final haveZeroPadding = PlatformProvider.of(context)
            ?.settings
            .iosUseZeroPaddingForAppbarPlatformIcon ??
        false;
    final isPlacedOnPlatformAppBar =
        ParentWidgetFinder.of<CupertinoNavigationBar>(context) != null;
    final overriddenPadding =
        haveZeroPadding && isPlacedOnPlatformAppBar ? EdgeInsets.zero : null;

    final givenPadding = data?.padding ?? padding ?? overriddenPadding;

    return CupertinoButton(
      key: data?.widgetKey ?? widgetKey,
      onPressed: data?.onPressed ?? onPressed,
      padding: givenPadding,
      color: data?.color ?? color,
      borderRadius:
          data?.borderRadius ?? const BorderRadius.all(Radius.circular(8)),
      minSize: data?.minSize ?? _kMinInteractiveDimensionCupertino,
      pressedOpacity: data?.pressedOpacity ?? 0.4,
      disabledColor: data?.disabledColor ??
          disabledColor ??
          CupertinoColors.quaternarySystemFill,
      alignment: data?.alignment ?? Alignment.center,
      child: data?.icon ?? cupertinoIcon ?? icon!,
    );
  }

  @override
  fluent.IconButton createWindowsWidget(BuildContext context) {
    final data = windows?.call(context, platform(context));

    // icon is required non nullable
    assert(data?.icon != null || cupertinoIcon != null || icon != null);

    return fluent.IconButton(
      key: data?.widgetKey ?? widgetKey,
      icon: data?.icon ?? windowsIcon ?? icon!,
      onPressed: data?.onPressed ?? onPressed,
      style: data?.style,
      focusNode: data?.focusNode,
      autofocus: data?.autofocus ?? false,
      iconButtonMode: data?.iconButtonMode,
    );
  }

  //Todo(mehul): change themes here
  @override
  CupertinoButton createMacosWidget(BuildContext context) =>
      createCupertinoWidget(context);

  @override
  IconButton createLinuxWidget(BuildContext context) =>
      createMaterialWidget(context);

  @override
  IconButton createFuchsiaWidget(BuildContext context) =>
      createMaterialWidget(context);

  @override
  IconButton createWebWidget(BuildContext context) =>
      createMaterialWidget(context);
}
