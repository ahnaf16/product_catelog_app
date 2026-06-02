import 'dart:io';
import 'dart:typed_data';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

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
        child: _ImageContent(
          src: src,
          height: h,
          width: w,
          fit: fit,
          iconSize: iconSize,
          color: color,
          colorBlendMode: colorBlendMode,
        ),
      ),
    );
  }
}

class _ImageContent extends StatelessWidget {
  const _ImageContent({
    required this.src,
    required this.height,
    required this.width,
    required this.fit,
    required this.iconSize,
    required this.color,
    required this.colorBlendMode,
  });

  final Object src;
  final double? height;
  final double? width;
  final BoxFit fit;
  final double? iconSize;
  final Color? color;
  final BlendMode? colorBlendMode;

  @override
  Widget build(BuildContext context) {
    final size = iconSize ?? 20;

    return switch (src) {
      final String value when _isNetworkUrl(value) => CachedNetworkImage(
        imageUrl: value,
        height: height,
        width: width,
        fit: fit,
        color: color,
        colorBlendMode: colorBlendMode,
        placeholder: (_, _) => const _ImagePlaceholder(),
        errorWidget: (_, _, _) => const _ImageError(),
      ),
      final String value when value.startsWith('assets') => Image.asset(
        value,
        height: height,
        width: width,
        fit: fit,
        color: color,
        colorBlendMode: colorBlendMode,
        errorBuilder: (_, _, _) => const _ImageError(),
      ),
      final String value => Image.file(
        File(value),
        height: height,
        width: width,
        fit: fit,
        color: color,
        colorBlendMode: colorBlendMode,
        errorBuilder: (_, _, _) => const _ImageError(),
      ),
      final File value => Image.file(
        value,
        height: height,
        width: width,
        fit: fit,
        color: color,
        colorBlendMode: colorBlendMode,
        errorBuilder: (_, _, _) => const _ImageError(),
      ),
      final Uint8List value => Image.memory(
        value,
        height: height,
        width: width,
        fit: fit,
        color: color,
        colorBlendMode: colorBlendMode,
        errorBuilder: (_, _, _) => const _ImageError(),
      ),
      final IconData value => Center(
        child: Icon(value, size: size, color: color),
      ),
      _ => const _ImageError(),
    };
  }

  bool _isNetworkUrl(String value) {
    final uri = Uri.tryParse(value);
    return uri != null && (uri.scheme == 'http' || uri.scheme == 'https');
  }
}

class _ImagePlaceholder extends StatelessWidget {
  const _ImagePlaceholder();

  @override
  Widget build(BuildContext context) {
    return const Center(child: SizedBox.square(dimension: 20, child: CircularProgressIndicator()));
  }
}

class _ImageError extends StatelessWidget {
  const _ImageError();

  @override
  Widget build(BuildContext context) {
    return const Center(child: Icon(Icons.hide_image_outlined));
  }
}
