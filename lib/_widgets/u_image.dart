import 'dart:io';

import 'package:flutter/material.dart';
import 'package:universal_image/universal_image.dart';

class UImage extends StatelessWidget {
  const UImage(
    this.src, {
    super.key,
    this.height,
    this.width,
    this.dimension,
    this.fit = BoxFit.cover,
    this.onImgTap,
    this.borderRadius,

    this.iconSize,
    this.color,
    this.colorBlendMode,
    this.backgroundColor,
    this.borderColor,
    this.borderWidth,
    this.padding,
  });

  /// Image source, it can be
  /// - `http url`,
  /// - `assets file path` (assets path must start with `assets`),
  /// - `local file path`
  /// - `icon data`
  /// - `Base64 string`
  /// - `Uint8List`
  final Object src;

  final double? height;
  final double? width;

  /// if not null then height and width are ignored
  final double? dimension;
  final double? iconSize;
  final BoxFit fit;
  final void Function()? onImgTap;

  final double? borderRadius;

  /// An optional `Color` property that sets the color of the image.
  final Color? color;

  /// An optional `BlendMode` property that defines how the image color should blend with the background.
  final BlendMode? colorBlendMode;
  final Color? backgroundColor;
  final Color? borderColor;
  final double? borderWidth;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    final radius = BorderRadius.circular(borderRadius ?? 0);

    final double? h = dimension ?? height;
    final double? w = dimension ?? width;
    final size = iconSize ?? 20;

    dynamic source = src;

    if (src case final File file) source = file.path;

    return InkWell(
      borderRadius: radius,
      hoverColor: Colors.transparent,
      onTap: onImgTap,
      child: Container(
        height: h,
        width: w,
        decoration: ShapeDecoration(
          shape: RoundedSuperellipseBorder(
            borderRadius: radius,
            side: BorderSide(
              color: borderColor ?? Colors.transparent,
              width: borderWidth ?? 0,
              strokeAlign: BorderSide.strokeAlignOutside,
            ),
          ),
          color: backgroundColor,
        ),
        padding: padding,
        clipBehavior: Clip.hardEdge,
        child: UniversalImage(
          source,
          width: w,
          height: h,
          size: size,
          fit: fit,
          color: color,
          placeholder: const Center(child: SizedBox.square(dimension: 20, child: CircularProgressIndicator())),
          errorPlaceholder: const Center(child: Icon(Icons.hide_image_outlined)),
        ),
      ),
    );
  }
}
