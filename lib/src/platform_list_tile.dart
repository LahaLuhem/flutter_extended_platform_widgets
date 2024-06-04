/*
 * flutter_platform_widgets
 * Copyright (c) 2018 Lance Johnstone. All rights reserved.
 * See LICENSE for distribution and usage details.
 */

import 'package:fluent_ui/fluent_ui.dart' as fluent;
import 'package:flutter/cupertino.dart' show CupertinoListTile;
import 'package:flutter/material.dart'
    show ListTile, ListTileStyle, ListTileTitleAlignment, VisualDensity;
import 'package:flutter/widgets.dart';
import 'package:flutter_extended_platform_widgets/src/platform.dart';
import 'package:flutter_extended_platform_widgets/src/widget_base.dart';

const double _kLeadingSize = 28;
const double _kLeadingToTitle = 16;

abstract class _BaseData {
  _BaseData({
    this.key,
    this.leading,
    this.title,
    this.subtitle,
    this.trailing,
    this.onTap,
  });

  final Key? key;
  final Widget? leading;
  final Widget? title;
  final Widget? subtitle;
  final Widget? trailing;
  final VoidCallback? onTap;
}

class MaterialListTileData extends _BaseData {
  MaterialListTileData({
    super.key,
    super.leading,
    super.title,
    super.subtitle,
    super.trailing,
    super.onTap,
    this.isThreeLine,
    this.dense,
    this.visualDensity,
    this.shape,
    this.style,
    this.selectedColor,
    this.iconColor,
    this.textColor,
    this.contentPadding,
    this.enabled,
    this.onLongPress,
    this.onFocusChange,
    this.mouseCursor,
    this.selected,
    this.focusColor,
    this.hoverColor,
    this.splashColor,
    this.focusNode,
    this.autofocus,
    this.tileColor,
    this.selectedTileColor,
    this.enableFeedback,
    this.horizontalTitleGap,
    this.minVerticalPadding,
    this.minLeadingWidth,
    this.leadingAndTrailingTextStyle,
    this.subtitleTextStyle,
    this.titleAlignment,
    this.titleTextStyle,
    this.internalAddSemanticForOnTap,
    this.minTileHeight,
  });

  final bool? isThreeLine;
  final bool? dense;
  final VisualDensity? visualDensity;
  final ShapeBorder? shape;
  final Color? selectedColor;
  final Color? iconColor;
  final Color? textColor;
  final ListTileStyle? style;
  final EdgeInsetsGeometry? contentPadding;
  final bool? enabled;
  final GestureLongPressCallback? onLongPress;
  final ValueChanged<bool>? onFocusChange;
  final MouseCursor? mouseCursor;
  final bool? selected;
  final Color? focusColor;
  final Color? hoverColor;
  final Color? splashColor;
  final FocusNode? focusNode;
  final bool? autofocus;
  final Color? tileColor;
  final Color? selectedTileColor;
  final bool? enableFeedback;
  final double? horizontalTitleGap;
  final double? minVerticalPadding;
  final double? minLeadingWidth;
  final TextStyle? leadingAndTrailingTextStyle;
  final TextStyle? subtitleTextStyle;
  final ListTileTitleAlignment? titleAlignment;
  final TextStyle? titleTextStyle;
  final bool? internalAddSemanticForOnTap;
  final double? minTileHeight;
}

class CupertinoListTileData extends _BaseData {
  CupertinoListTileData({
    super.key,
    super.leading,
    super.title,
    super.subtitle,
    super.trailing,
    super.onTap,
    this.leadingToTitle,
    this.leadingSize,
    this.padding,
    this.backgroundColor,
    this.backgroundColorActivated,
    this.additionalInfo,
  });

  double? leadingToTitle;
  double? leadingSize;
  EdgeInsetsGeometry? padding;
  Color? backgroundColor;
  Color? backgroundColorActivated;
  Widget? additionalInfo;
}

class FluentListTileData extends _BaseData {
  FluentListTileData({
    super.key,
    super.leading,
    super.title,
    super.subtitle,
    super.trailing,
    super.onTap,
    this.shape,
    this.autofocus,
    this.tileColor,
  });

  final ShapeBorder? shape;
  final bool? autofocus;
  final fluent.ButtonState<Color>? tileColor;
}

class PlatformListTile extends PlatformWidgetBase<ListTile, CupertinoListTile,
    fluent.ListTile, CupertinoListTile, ListTile, ListTile, ListTile> {
  const PlatformListTile({
    required this.title,
    this.leading,
    this.subtitle,
    this.trailing,
    this.onTap,
    this.material,
    this.cupertino,
    this.windows,
    this.macos,
    this.linux,
    this.fuchsia,
    this.web,
    super.key,
  });
  final Widget? leading;
  final Widget title;
  final Widget? subtitle;
  final Widget? trailing;

  final VoidCallback? onTap;

  final PlatformBuilder<MaterialListTileData>? material;
  final PlatformBuilder<CupertinoListTileData>? cupertino;
  final PlatformBuilder<FluentListTileData>? windows;
  final PlatformBuilder<CupertinoListTileData>? macos;
  final PlatformBuilder<MaterialListTileData>? linux;
  final PlatformBuilder<MaterialListTileData>? fuchsia;
  final PlatformBuilder<MaterialListTileData>? web;

  @override
  ListTile createMaterialWidget(BuildContext context) {
    final data = material?.call(context, platform(context));

    return ListTile(
      key: data?.key ?? key,
      leading: data?.leading ?? leading,
      title: data?.title ?? title,
      subtitle: data?.subtitle ?? subtitle,
      trailing: data?.trailing ?? trailing,
      onTap: data?.onTap ?? onTap,
      autofocus: data?.autofocus ?? false,
      contentPadding: data?.contentPadding,
      dense: data?.dense,
      enableFeedback: data?.enableFeedback,
      enabled: data?.enabled ?? true,
      focusColor: data?.focusColor,
      focusNode: data?.focusNode,
      horizontalTitleGap: data?.horizontalTitleGap,
      hoverColor: data?.hoverColor,
      iconColor: data?.iconColor,
      isThreeLine: data?.isThreeLine ?? false,
      minLeadingWidth: data?.minLeadingWidth,
      minVerticalPadding: data?.minVerticalPadding,
      mouseCursor: data?.mouseCursor,
      onFocusChange: data?.onFocusChange,
      onLongPress: data?.onLongPress,
      selected: data?.selected ?? false,
      selectedColor: data?.selectedColor,
      selectedTileColor: data?.selectedTileColor,
      shape: data?.shape,
      splashColor: data?.splashColor,
      style: data?.style,
      textColor: data?.textColor,
      tileColor: data?.tileColor,
      visualDensity: data?.visualDensity,
      leadingAndTrailingTextStyle: data?.leadingAndTrailingTextStyle,
      subtitleTextStyle: data?.subtitleTextStyle,
      titleAlignment: data?.titleAlignment,
      titleTextStyle: data?.titleTextStyle,
      internalAddSemanticForOnTap: data?.internalAddSemanticForOnTap ?? true,
      minTileHeight: data?.minTileHeight,
    );
  }

  @override
  CupertinoListTile createCupertinoWidget(BuildContext context) {
    final data = cupertino?.call(context, platform(context));

    return CupertinoListTile(
      key: data?.key ?? key,
      leading: data?.leading ?? leading,
      title: data?.title ?? title,
      subtitle: data?.subtitle ?? subtitle,
      trailing: data?.trailing ?? trailing,
      onTap: data?.onTap ?? onTap,
      additionalInfo: data?.additionalInfo,
      backgroundColor: data?.backgroundColor,
      backgroundColorActivated: data?.backgroundColorActivated,
      leadingSize: data?.leadingSize ?? _kLeadingSize,
      leadingToTitle: data?.leadingToTitle ?? _kLeadingToTitle,
      padding: data?.padding,
    );
  }

  @override
  fluent.ListTile createWindowsWidget(BuildContext context) {
    final data = windows?.call(context, platform(context));

    return fluent.ListTile(
      key: data?.key ?? key,
      leading: data?.leading ?? leading,
      title: data?.title ?? title,
      subtitle: data?.subtitle ?? subtitle,
      trailing: data?.trailing ?? trailing,
      autofocus: data?.autofocus ?? false,
      shape: data?.shape ?? fluent.kDefaultListTileShape,
      tileColor: data?.tileColor,
    );
  }

  //Todo(mehul): change themes here
  @override
  CupertinoListTile createMacosWidget(BuildContext context) =>
      createCupertinoWidget(context);

  @override
  ListTile createLinuxWidget(BuildContext context) =>
      createMaterialWidget(context);

  @override
  ListTile createFuchsiaWidget(BuildContext context) =>
      createMaterialWidget(context);

  @override
  ListTile createWebWidget(BuildContext context) =>
      createMaterialWidget(context);
}
