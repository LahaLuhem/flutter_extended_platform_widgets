import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/cupertino.dart'
    show CupertinoActionSheet, CupertinoActionSheetAction;
import 'package:flutter/material.dart'
    show
        WidgetStateProperty,
        PopupMenuButton,
        PopupMenuCanceled,
        PopupMenuDivider,
        PopupMenuEntry,
        PopupMenuItem,
        PopupMenuItemBuilder,
        PopupMenuPosition,
        kMinInteractiveDimension;

import 'package:flutter_extended_platform_widgets/src/platform.dart';
import 'package:flutter_extended_platform_widgets/src/platform_widget.dart';
import 'package:flutter_extended_platform_widgets/src/widget_base.dart';

const double _kMenuDividerHeight = 16;

class PopupMenuOption {
  const PopupMenuOption({
    this.label,
    this.onTap,
    this.cupertino,
    this.material,
    this.windows,
    this.macos,
    this.linux,
    this.fuchsia,
    this.web,
  });
  final String? label;
  final void Function(PopupMenuOption)? onTap;

  final PlatformBuilder<MaterialPopupMenuOptionData>? material;
  final PlatformBuilder<CupertinoPopupMenuOptionData>? cupertino;
  final PlatformBuilder<FluentPopupMenuOptionData>? windows;
  final PlatformBuilder<CupertinoPopupMenuOptionData>? macos;
  final PlatformBuilder<MaterialPopupMenuOptionData>? linux;
  final PlatformBuilder<MaterialPopupMenuOptionData>? fuchsia;
  final PlatformBuilder<MaterialPopupMenuOptionData>? web;
}

abstract class _BaseData {
  const _BaseData({
    this.key,
    this.child,
  });
  final Key? key;
  final Widget? child;
}

class MaterialPopupMenuOptionData extends _BaseData {
  final bool? enabled;
  final double? height;
  final MouseCursor? mouseCursor;
  final VoidCallback? onTap;
  final EdgeInsets? padding;
  final TextStyle? textStyle;
  final bool withDivider;
  final double dividerHeight;
  final WidgetStateProperty<TextStyle?>? labelTextStyle;

  MaterialPopupMenuOptionData({
    super.key,
    super.child,
    this.enabled,
    this.height,
    this.mouseCursor,
    this.onTap,
    this.padding,
    this.textStyle,
    this.withDivider = false,
    this.dividerHeight = _kMenuDividerHeight,
    this.labelTextStyle,
  });
  final bool? enabled;
  final double? height;
  final MouseCursor? mouseCursor;
  final VoidCallback? onTap;
  final EdgeInsets? padding;
  final TextStyle? textStyle;
  final bool withDivider;
  final double dividerHeight;
  final MaterialStateProperty<TextStyle?>? labelTextStyle;
}

class CupertinoPopupMenuOptionData extends _BaseData {
  CupertinoPopupMenuOptionData({
    super.key,
    super.child,
    this.onPressed,
    this.isDefaultAction,
    this.isDestructiveAction,
  });
  final VoidCallback? onPressed;
  final bool? isDefaultAction;
  final bool? isDestructiveAction;
}

class FluentPopupMenuOptionData extends _BaseData {
  const FluentPopupMenuOptionData({
    super.key,
    super.child,
    this.enabled,
    this.height,
    this.mouseCursor,
    this.onTap,
    this.padding,
    this.textStyle,
    this.withDivider = false,
    this.dividerHeight = _kMenuDividerHeight,
  });
  final bool? enabled;
  final double? height;
  final MouseCursor? mouseCursor;
  final VoidCallback? onTap;
  final EdgeInsets? padding;
  final TextStyle? textStyle;
  final bool withDivider;
  final double dividerHeight;
}

class MaterialPopupMenuData {
  final Key? key;
  final Widget? icon;
  final PopupMenuItemBuilder<PopupMenuOption>? itemBuilder;
  final Widget? child;
  final Color? color;
  final double? elevation;
  final bool? enableFeedback;
  final bool? enabled;
  final double? iconSize;
  final PopupMenuOption? initialValue;
  final Offset? offset;
  final PopupMenuCanceled? onCanceled;
  final EdgeInsets? padding;
  final ShapeBorder? shape;
  final String? tooltip;
  final BoxConstraints? constraints;
  final PopupMenuPosition? position;
  final double? splashRadius;
  final Clip clipBehavior;
  final VoidCallback? onOpened;
  final Color? shadowColor;
  final Color? surfaceTintColor;
  final Color? iconColor;
  final AnimationStyle? popUpAnimationStyle;
  final bool? useRootNavigator;

  MaterialPopupMenuData({
    this.key,
    this.icon,
    this.itemBuilder,
    this.child,
    this.color,
    this.elevation,
    this.enableFeedback,
    this.enabled,
    this.iconSize,
    this.initialValue,
    this.offset,
    this.onCanceled,
    this.padding,
    this.shape,
    this.tooltip,
    this.constraints,
    this.position,
    this.splashRadius,
    this.clipBehavior = Clip.none,
    this.onOpened,
    this.shadowColor,
    this.surfaceTintColor,
    this.iconColor,
    this.popUpAnimationStyle,
    this.useRootNavigator,
  });
}

class CupertinoPopupMenuData {
  CupertinoPopupMenuData({
    this.key,
    this.title,
    this.message,
    this.actionScrollController,
    this.messageScrollController,
    this.actions,
    this.cancelButtonData,
  });
  final Key? key;
  final Widget? title;
  final Widget? message;
  final ScrollController? actionScrollController;
  final ScrollController? messageScrollController;
  final List<Widget>? actions;
  final CupertinoPopupMenuCancelButtonData? cancelButtonData;
}

class CupertinoPopupMenuCancelButtonData {
  CupertinoPopupMenuCancelButtonData({
    this.child = const Text('Cancel'),
    this.key,
    this.onPressed,
    this.isDefaultAction,
    this.isDestructiveAction,
  });
  final Key? key;
  final Widget child;
  final VoidCallback? onPressed;
  final bool? isDefaultAction;
  final bool? isDestructiveAction;
}

class FluentPopupMenuData {
  FluentPopupMenuData({
    this.key,
    this.icon,
    this.elevation,
    this.iconSize,
    this.initialValue,
  });
  final Key? key;
  final Widget? icon;
  final double? elevation;
  final double? iconSize;
  final PopupMenuOption? initialValue;
}

class PlatformPopupMenu extends StatelessWidget {
  const PlatformPopupMenu({
    required this.options,
    required this.icon,
    this.material,
    this.cupertino,
    this.windows,
    this.macos,
    this.linux,
    this.fuchsia,
    this.web,
    super.key,
  });
  final List<PopupMenuOption> options;
  final Widget icon;

  final PlatformBuilder<MaterialPopupMenuData>? material;
  final PlatformBuilder<CupertinoPopupMenuData>? cupertino;
  final PlatformBuilder<FluentPopupMenuData>? windows;
  final PlatformBuilder<CupertinoPopupMenuData>? macos;
  final PlatformBuilder<CupertinoPopupMenuData>? linux;
  final PlatformBuilder<MaterialPopupMenuData>? fuchsia;
  final PlatformBuilder<CupertinoPopupMenuData>? web;

  @override
  Widget build(BuildContext context) {
    return PlatformWidget(
      material: (context, _) => _materialPopupMenuButton(context),
      cupertino: (context, _) => _cupertinoPopupBottomSheet(context),
      windows: (_, __) => _FluentPopupMenuButton(
        options: options,
        data: windows?.call(context, platform(context)),
        icon: icon,
      ),
      macos: (context, _) => _cupertinoPopupBottomSheet(context),
      linux: (context, _) => _materialPopupMenuButton(context),
      fuchsia: (context, _) => _materialPopupMenuButton(context),
      web: (context, _) => _materialPopupMenuButton(context),
    );
  }

  Widget _materialPopupMenuButton(BuildContext context) {
    final data = material?.call(context, platform(context));

    return PopupMenuButton<PopupMenuOption>(
      onSelected: (option) {
        option.onTap?.call(option);
      },
      icon: data?.icon ?? icon,
      itemBuilder: data?.itemBuilder ??
          (context) {
            final items = <PopupMenuEntry<PopupMenuOption>>[];
            for (final option in options) {
              final data = option.material?.call(context, platform(context));
              items.add(
                PopupMenuItem<PopupMenuOption>(
                  value: option,
                  enabled: data?.enabled ?? true,
                  height: data?.height ?? kMinInteractiveDimension,
                  key: data?.key,
                  mouseCursor: data?.mouseCursor,
                  onTap: data?.onTap,
                  padding: data?.padding,
                  textStyle: data?.textStyle,
                  labelTextStyle: data?.labelTextStyle,
                  child: data?.child ?? Text(option.label ?? ''),
                ),
              );
              if (data?.withDivider ?? false) {
                items.add(
                  PopupMenuDivider(
                    height: data?.dividerHeight ?? _kMenuDividerHeight,
                  ),
                );
              }
            }
            return items;
          },
      child: data?.child,
      color: data?.color,
      elevation: data?.elevation,
      enableFeedback: data?.enableFeedback,
      enabled: data?.enabled ?? true,
      iconSize: data?.iconSize,
      initialValue: data?.initialValue,
      key: data?.key ?? key,
      offset: data?.offset ?? Offset.zero,
      onCanceled: data?.onCanceled,
      padding: data?.padding ?? const EdgeInsets.all(8.0),
      shape: data?.shape,
      tooltip: data?.tooltip,
      constraints: data?.constraints,
      position: data?.position ?? PopupMenuPosition.over,
      splashRadius: data?.splashRadius,
      clipBehavior: data?.clipBehavior ?? Clip.none,
      onOpened: data?.onOpened,
      shadowColor: data?.shadowColor,
      surfaceTintColor: data?.surfaceTintColor,
      iconColor: data?.iconColor,
      popUpAnimationStyle: data?.popUpAnimationStyle,
      useRootNavigator: data?.useRootNavigator ?? false,
    );
  }

  Widget _cupertinoPopupBottomSheet<T>(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showPlatformModalSheet<T>(
          context: context,
          builder: _cupertinoSheetContent,
        );
      },
      child: icon,
    );
  }

  Widget _cupertinoSheetContent(BuildContext context) {
    final data = cupertino?.call(context, platform(context));
    final cancelData = data?.cancelButtonData;

    return CupertinoActionSheet(
      key: data?.key ?? key,
      title: data?.title,
      message: data?.message,
      actionScrollController: data?.actionScrollController,
      messageScrollController: data?.messageScrollController,
      actions: data?.actions ??
          options.map(
            (option) {
              final data = option.cupertino?.call(context, platform(context));
              return CupertinoActionSheetAction(
                key: data?.key,
                isDefaultAction: data?.isDefaultAction ?? false,
                isDestructiveAction: data?.isDestructiveAction ?? false,
                onPressed: data?.onPressed ??
                    () {
                      Navigator.pop(context);
                      option.onTap?.call(option);
                    },
                child: data?.child ?? Text(option.label ?? ''),
              );
            },
          ).toList(),
      cancelButton: cancelData == null
          ? null
          : CupertinoActionSheetAction(
              key: cancelData.key,
              isDefaultAction: cancelData.isDefaultAction ?? false,
              isDestructiveAction: cancelData.isDestructiveAction ?? false,
              onPressed: cancelData.onPressed ?? () => Navigator.pop(context),
              child: cancelData.child,
            ),
    );
  }
}

class _FluentPopupMenuButton extends StatelessWidget {
  _FluentPopupMenuButton({
    required this.options,
    required this.data,
    required this.icon,
    super.key,
  }) : _selectedValueNotifier =
            ValueNotifier(data?.initialValue ?? options.first);

  final FluentPopupMenuData? data;
  final List<PopupMenuOption> options;

  final Widget icon;

  final ValueNotifier<PopupMenuOption> _selectedValueNotifier;

  @override
  Widget build(BuildContext context) => ValueListenableBuilder(
        valueListenable: _selectedValueNotifier,
        builder: (context, selectedValue, _) => ComboBox<PopupMenuOption>(
          key: data?.key ?? key,
          icon: data?.icon ?? icon,
          value: _selectedValueNotifier.value,
          onChanged: (option) => _selectedValueNotifier.value = option!,
          elevation: data?.elevation?.toInt() ?? 8,
          iconSize: data?.iconSize ?? 8.0,
          items: [
            for (final item in options)
              ComboBoxItem(
                value: item,
                child: Text(item.label ?? ''),
                onTap: () {
                  if (item.onTap != null) item.onTap!(item);
                },
              ),
          ],
        ),
      );
}
