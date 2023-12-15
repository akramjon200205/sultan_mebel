abstract class Assets {
  const Assets._();

  // ignore: library_private_types_in_public_api
  static _Icons get icons => const _Icons();

  // ignore: library_private_types_in_public_api
  static _Images get images => const _Images();
}

abstract class _AssetsHolder {
  final String basePath;

  const _AssetsHolder(this.basePath);
}

class _Icons extends _AssetsHolder {
  const _Icons() : super('assets/icons');

  // String get allThemIcon => "$basePath/all_of_them_icon.svg";
}

class _Images extends _AssetsHolder {
  const _Images() : super('assets/images');

  String get ellipseBig => "$basePath/ellipse_big.svg";
  String get ellipseMiddle => "$basePath/ellipse_middle.svg";
  String get ellipseSmall => "$basePath/ellipse_small.svg";
}
