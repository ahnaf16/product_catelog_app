import 'package:product_catelog_app/main.export.dart';

export 'package:go_router/go_router.dart';

class RPaths {
  const RPaths._();
  static const products = RPath('/product');
  static const favorites = RPath('/favorites');
  static const config = RPath('/settings');

  static RPath productDetails(String id) => RPath('/product/product-details/$id');
}
