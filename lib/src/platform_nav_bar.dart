/*
 * flutter_platform_widgets
 * Copyright (c) 2018 Lance Johnstone. All rights reserved.
 * See LICENSE for distribution and usage details.
 */

import 'package:fluent_ui/fluent_ui.dart' show Tab, TabView;
import 'package:flutter/cupertino.dart' show CupertinoColors, CupertinoTabBar;
import 'package:flutter/material.dart'
    show
        BottomAppBar,
        BottomNavigationBar,
        BottomNavigationBarLandscapeLayout,
        BottomNavigationBarType,
        NavigationBar,
        NavigationDestination,
        NavigationDestinationLabelBehavior,
        Theme;
import 'package:flutter/widgets.dart';

import 'package:flutter_extended_platform_widgets/src/platform.dart';
import 'package:flutter_extended_platform_widgets/src/widget_base.dart';

// Standard iOS 10 tab bar height.
const double _kTabBarHeight = 50;
const Color _kDefaultTabBarBorderColor = Color(0x4C000000);
const Color _kDefaultTabBarInactiveColor = CupertinoColors.inactiveGray;

abstract class _BaseData {
  _BaseData({
    this.widgetKey,
    this.items,
    this.backgroundColor,
    this.iconSize,
    this.activeColor,
    this.currentIndex,
    this.itemChanged,
    this.height,
  });

  final Key? widgetKey;
  final List<BottomNavigationBarItem>? items;
  final Color? backgroundColor;
  final double? iconSize;
  final Color? activeColor;
  final int? currentIndex;
  final void Function(int)? itemChanged;
  final double? height;
}

class MaterialNavigationBarData {
  MaterialNavigationBarData({
    this.widgetKey,
    this.items,
    this.height,
    this.animationDuration,
    this.backgroundColor,
    this.elevation,
    this.indicatorColor,
    this.indicatorShape,
    this.labelBehavior,
    this.onDestinationSelected,
    this.selectedIndex,
    this.shadowColor,
    this.surfaceTintColor,
    this.overlayColor,
    this.labelPadding,
    this.labelTextStyle,
  });

  final Key? widgetKey;
  final List<NavigationDestination>? items;
  final double? height;
  final Duration? animationDuration;
  final Color? backgroundColor;
  final double? elevation;
  final Color? indicatorColor;
  final ShapeBorder? indicatorShape;
  final NavigationDestinationLabelBehavior? labelBehavior;
  final ValueChanged<int>? onDestinationSelected;
  final int? selectedIndex;
  final Color? shadowColor;
  final Color? surfaceTintColor;
  final WidgetStateProperty<Color?>? overlayColor;
  final EdgeInsetsGeometry? labelPadding;
  final WidgetStateProperty<TextStyle?>? labelTextStyle;
}

class MaterialNavBarData extends _BaseData {
  MaterialNavBarData({
    super.items,
    super.backgroundColor,
    super.iconSize,
    this.elevation,
    Color? fixedColor,
    super.widgetKey,
    super.itemChanged,
    super.currentIndex,
    super.height,
    this.type,
    this.bottomNavigationBarKey,
    this.shape,
    this.clipBehavior,
    this.notchMargin,
    this.selectedFontSize,
    this.selectedItemColor,
    this.showSelectedLabels,
    this.showUnselectedLabels,
    this.unselectedFontSize,
    this.unselectedItemColor,
    this.selectedIconTheme,
    this.selectedLabelStyle,
    this.unselectedIconTheme,
    this.unselectedLabelStyle,
    this.mouseCursor,
    this.enableFeedback,
    this.landscapeLayout,
    this.useLegacyColorScheme = true,
    this.padding,
    this.surfaceTintColor,
    this.shadowColor,
  }) : super(activeColor: fixedColor);

  final double? selectedFontSize;
  final double? elevation;
  final BottomNavigationBarType? type;
  final Key? bottomNavigationBarKey;
  final NotchedShape? shape;
  final Clip? clipBehavior;
  final double? notchMargin;
  final Color? selectedItemColor;
  final bool? showSelectedLabels;
  final bool? showUnselectedLabels;
  final double? unselectedFontSize;
  final Color? unselectedItemColor;
  final IconThemeData? selectedIconTheme;
  final TextStyle? selectedLabelStyle;
  final IconThemeData? unselectedIconTheme;
  final TextStyle? unselectedLabelStyle;
  final MouseCursor? mouseCursor;
  final bool? enableFeedback;
  final BottomNavigationBarLandscapeLayout? landscapeLayout;
  final bool useLegacyColorScheme;
  final EdgeInsetsGeometry? padding;
  final Color? surfaceTintColor;
  final Color? shadowColor;
}

class CupertinoTabBarData extends _BaseData {
  CupertinoTabBarData({
    super.backgroundColor,
    super.items,
    super.activeColor,
    super.widgetKey,
    super.itemChanged,
    super.iconSize,
    super.currentIndex,
    super.height,
    this.inactiveColor,
    this.border,
  });

  final Color? inactiveColor;
  final Border? border;
}

class FluentTabBarData extends _BaseData {
  FluentTabBarData({
    super.items,
    super.backgroundColor,
    super.iconSize,
    this.elevation,
    Color? fixedColor,
    super.widgetKey,
    super.itemChanged,
    super.currentIndex,
    super.height,
    this.navigationBarKey,
    this.shape,
    this.clipBehavior,
    this.notchMargin,
    this.selectedFontSize,
    this.selectedItemColor,
    this.showSelectedLabels,
    this.showUnselectedLabels,
    this.unselectedFontSize,
    this.unselectedItemColor,
    this.selectedIconTheme,
    this.selectedLabelStyle,
    this.unselectedIconTheme,
    this.unselectedLabelStyle,
    this.mouseCursor,
    this.enableFeedback,
    this.useLegacyColorScheme = true,
    this.padding,
    this.surfaceTintColor,
    this.shadowColor,
  }) : super(activeColor: fixedColor);

  final double? selectedFontSize;
  final double? elevation;
  final Key? navigationBarKey;
  final NotchedShape? shape;
  final Clip? clipBehavior;
  final double? notchMargin;
  final Color? selectedItemColor;
  final bool? showSelectedLabels;
  final bool? showUnselectedLabels;
  final double? unselectedFontSize;
  final Color? unselectedItemColor;
  final IconThemeData? selectedIconTheme;
  final TextStyle? selectedLabelStyle;
  final IconThemeData? unselectedIconTheme;
  final TextStyle? unselectedLabelStyle;
  final MouseCursor? mouseCursor;
  final bool? enableFeedback;
  final bool useLegacyColorScheme;
  final EdgeInsetsGeometry? padding;
  final Color? surfaceTintColor;
  final Color? shadowColor;
}

class PlatformNavBar extends PlatformWidgetBase<Widget, CupertinoTabBar,
    TabView, CupertinoTabBar, Widget, Widget, Widget> {
  const PlatformNavBar({
    super.key,
    this.widgetKey,
    this.backgroundColor,
    this.items,
    this.itemChanged,
    this.currentIndex,
    this.height,
    this.material,
    this.material3,
    this.cupertino,
    this.windows,
    this.macos,
    this.linux,
    this.fuchsia,
    this.web,
  });
  final Key? widgetKey;
  final Color? backgroundColor;

  final List<BottomNavigationBarItem>? items;
  final void Function(int)? itemChanged;
  final int? currentIndex;
  final double? height;

  final PlatformBuilder<MaterialNavBarData>? material;
  final PlatformBuilder<MaterialNavigationBarData>? material3;
  final PlatformBuilder<CupertinoTabBarData>? cupertino;
  final PlatformBuilder<FluentTabBarData>? windows;
  final PlatformBuilder<CupertinoTabBarData>? macos;
  final PlatformBuilder<MaterialNavBarData>? linux;
  final PlatformBuilder<MaterialNavBarData>? fuchsia;
  final PlatformBuilder<MaterialNavBarData>? web;

  @override
  Widget createMaterialWidget(BuildContext context) {
    final useMaterial3 = Theme.of(context).useMaterial3;
    return useMaterial3
        ? _createMaterial3Widget(context)
        : _createMaterial2Widget(context);
  }

  Widget _createMaterial3Widget(BuildContext context) {
    final data = material3?.call(context, platform(context));
    final selectedIndex = data?.selectedIndex ?? currentIndex ?? 0;
    final destinations = data?.items ??
        items?.map(
          (item) {
            return NavigationDestination(
              // key: ,
              icon: item.icon,
              label: item.label ?? '',
              selectedIcon: item.activeIcon,
              tooltip: item.tooltip,
              enabled: true,
            );
          },
        ).toList() ??
        [];
    assert(destinations.length >= 2);
    assert(0 <= selectedIndex && selectedIndex < destinations.length);

    return NavigationBar(
      key: data?.widgetKey ?? widgetKey,
      destinations: destinations,
      animationDuration: data?.animationDuration,
      backgroundColor: data?.backgroundColor ?? backgroundColor,
      elevation: data?.elevation,
      height: data?.height ?? height,
      indicatorColor: data?.indicatorColor,
      indicatorShape: data?.indicatorShape,
      labelBehavior: data?.labelBehavior,
      onDestinationSelected: data?.onDestinationSelected ?? itemChanged,
      selectedIndex: selectedIndex,
      shadowColor: data?.shadowColor,
      surfaceTintColor: data?.surfaceTintColor,
      overlayColor: data?.overlayColor,
      labelPadding: data?.labelPadding,
      labelTextStyle: data?.labelTextStyle,
    );
  }

  Widget _createMaterial2Widget(BuildContext context) {
    final data = material?.call(context, platform(context));

    final bar = BottomNavigationBar(
      items: data?.items ?? items ?? const <BottomNavigationBarItem>[],
      currentIndex: data?.currentIndex ?? currentIndex ?? 0,
      onTap: data?.itemChanged ?? itemChanged,
      iconSize: data?.iconSize ?? 24.0,
      fixedColor: data?.activeColor,
      type: data?.type,
      key: data?.bottomNavigationBarKey,
      backgroundColor: data?.backgroundColor ?? backgroundColor,
      elevation: data?.elevation ?? 8.0,
      selectedFontSize: data?.selectedFontSize ?? 14.0,
      selectedItemColor: data?.selectedItemColor,
      showSelectedLabels: data?.showSelectedLabels ?? true,
      showUnselectedLabels: data?.showUnselectedLabels,
      unselectedFontSize: data?.unselectedFontSize ?? 12.0,
      unselectedItemColor: data?.unselectedItemColor,
      selectedIconTheme: data?.selectedIconTheme ?? const IconThemeData(),
      selectedLabelStyle: data?.selectedLabelStyle,
      unselectedIconTheme: data?.unselectedIconTheme ?? const IconThemeData(),
      unselectedLabelStyle: data?.unselectedLabelStyle,
      mouseCursor: data?.mouseCursor,
      enableFeedback: data?.enableFeedback,
      landscapeLayout: data?.landscapeLayout,
      useLegacyColorScheme: data?.useLegacyColorScheme ?? true,
    );

    return BottomAppBar(
      color: data?.backgroundColor ?? backgroundColor,
      elevation: data?.elevation,
      key: data?.widgetKey ?? widgetKey,
      shape: data?.shape,
      clipBehavior: data?.clipBehavior ?? Clip.none,
      notchMargin: data?.notchMargin ?? 4.0,
      height: data?.height ?? height,
      padding: data?.padding,
      surfaceTintColor: data?.surfaceTintColor,
      shadowColor: data?.shadowColor,
      child: bar,
    );
  }

  @override
  CupertinoTabBar createCupertinoWidget(BuildContext context) {
    final data = cupertino?.call(context, platform(context));

    return CupertinoTabBar(
      items: data?.items ?? items ?? const <BottomNavigationBarItem>[],
      activeColor: data?.activeColor,
      backgroundColor: data?.backgroundColor ?? backgroundColor,
      currentIndex: data?.currentIndex ?? currentIndex ?? 0,
      iconSize: data?.iconSize ?? 30.0,
      inactiveColor: data?.inactiveColor ?? _kDefaultTabBarInactiveColor,
      key: data?.widgetKey ?? widgetKey,
      onTap: data?.itemChanged ?? itemChanged,
      border: data?.border ??
          const Border(
            top: BorderSide(
              color: _kDefaultTabBarBorderColor,
              width: 0, // One physical pixel.
            ),
          ),
      height: data?.height ?? height ?? _kTabBarHeight,
    );
  }

  @override
  TabView createWindowsWidget(BuildContext context) {
    final data = windows?.call(context, platform(context));

    return TabView(
      key: data?.navigationBarKey ?? widgetKey,
      currentIndex: 0,
      tabs: data?.items
              ?.map(
                (bottomNavItem) => Tab(
                  text: Text(bottomNavItem.label ?? ''),
                  body: Text(bottomNavItem.label ?? ''),
                  icon: bottomNavItem.icon,
                ),
              )
              .toList(growable: false) ??
          items
              ?.map(
                (bottomNavItem) => Tab(
                  text: Text(bottomNavItem.label ?? ''),
                  body: Text(bottomNavItem.label ?? ''),
                  icon: bottomNavItem.icon,
                ),
              )
              .toList(growable: false) ??
          [],
    );
  }

  //Todo(mehul): change themes here
  @override
  CupertinoTabBar createMacosWidget(BuildContext context) =>
      createCupertinoWidget(context);

  @override
  Widget createLinuxWidget(BuildContext context) =>
      createMaterialWidget(context);

  @override
  Widget createFuchsiaWidget(BuildContext context) =>
      createMaterialWidget(context);

  @override
  Widget createWebWidget(BuildContext context) => createMaterialWidget(context);
}
