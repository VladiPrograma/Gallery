/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal

import 'package:flutter/widgets.dart';

class $AssetsFontsGen {
  const $AssetsFontsGen();

  /// File path: assets/fonts/CustomIcons.ttf
  String get customIcons => 'assets/fonts/CustomIcons.ttf';

  /// File path: assets/fonts/RedHatDisplayBlack.ttf
  String get redHatDisplayBlack => 'assets/fonts/RedHatDisplayBlack.ttf';

  /// File path: assets/fonts/RedHatDisplayMedium.ttf
  String get redHatDisplayMedium => 'assets/fonts/RedHatDisplayMedium.ttf';

  /// File path: assets/fonts/timesBold.ttf
  String get timesBold => 'assets/fonts/timesBold.ttf';

  /// File path: assets/fonts/timesRegular.ttf
  String get timesRegular => 'assets/fonts/timesRegular.ttf';

  /// List of all assets
  List<String> get values => [
        customIcons,
        redHatDisplayBlack,
        redHatDisplayMedium,
        timesBold,
        timesRegular
      ];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  $AssetsImagesVincentVanGoghGen get vincentVanGogh =>
      const $AssetsImagesVincentVanGoghGen();
}

class $AssetsImagesVincentVanGoghGen {
  const $AssetsImagesVincentVanGoghGen();

  /// File path: assets/images/vincentVanGogh/bg.jpg
  AssetGenImage get bg =>
      const AssetGenImage('assets/images/vincentVanGogh/bg.jpg');

  /// File path: assets/images/vincentVanGogh/painting1.jpg
  AssetGenImage get painting1 =>
      const AssetGenImage('assets/images/vincentVanGogh/painting1.jpg');

  /// File path: assets/images/vincentVanGogh/painting2.jpg
  AssetGenImage get painting2 =>
      const AssetGenImage('assets/images/vincentVanGogh/painting2.jpg');

  /// File path: assets/images/vincentVanGogh/painting3.jpg
  AssetGenImage get painting3 =>
      const AssetGenImage('assets/images/vincentVanGogh/painting3.jpg');

  /// File path: assets/images/vincentVanGogh/painting4.jpg
  AssetGenImage get painting4 =>
      const AssetGenImage('assets/images/vincentVanGogh/painting4.jpg');

  /// File path: assets/images/vincentVanGogh/painting5.jpg
  AssetGenImage get painting5 =>
      const AssetGenImage('assets/images/vincentVanGogh/painting5.jpg');

  /// File path: assets/images/vincentVanGogh/painting6.jpg
  AssetGenImage get painting6 =>
      const AssetGenImage('assets/images/vincentVanGogh/painting6.jpg');

  /// File path: assets/images/vincentVanGogh/painting7.jpg
  AssetGenImage get painting7 =>
      const AssetGenImage('assets/images/vincentVanGogh/painting7.jpg');

  /// List of all assets
  List<AssetGenImage> get values => [
        bg,
        painting1,
        painting2,
        painting3,
        painting4,
        painting5,
        painting6,
        painting7
      ];
}

class Assets {
  Assets._();

  static const $AssetsFontsGen fonts = $AssetsFontsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider() => AssetImage(_assetName);

  String get path => _assetName;

  String get keyName => _assetName;
}
