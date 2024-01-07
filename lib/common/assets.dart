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

  String get plusIcon => "$basePath/plus_icon.svg";
  String get arrowBackIcon => "$basePath/cupertino_back.svg";
  String get iconUser => "$basePath/icon_user.svg";
  String get iconNotification => "$basePath/icon_notification.svg";
  String get basket => "$basePath/basket.svg";
  String get clients => "$basePath/clients.svg";
  String get home => "$basePath/home.svg";
  String get leddingIcon => "$basePath/ledding_icon.svg";
  String get saleIcon => "$basePath/sale_icon.svg";
  String get summaIcon => "$basePath/summa_icon.svg";
}

class _Images extends _AssetsHolder {
  const _Images() : super('assets/images');

  String get ellipseBig => "$basePath/ellipse_big.svg";
  String get ellipseMiddle => "$basePath/ellipse_middle.svg";
  String get ellipseSmall => "$basePath/ellipse_small.svg";
  String get mebel => "$basePath/mebel.png";
  String get kitchenPhoto => "$basePath/kitchen_photo.png";
}
