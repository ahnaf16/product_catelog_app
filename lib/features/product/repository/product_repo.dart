import 'package:injectable/injectable.dart';
import 'package:product_catelog_app/main.export.dart';

@singleton
class ProductRepo with ApiHandler {
  FutureReport<List<Product>> getProducts() async {
    return handle(
      call: () => client.get(Endpoints.products),
      mapper: (data) {
        if (data case final List list) {
          return list.map((e) => Product.fromMap(e)).toList();
        }

        return [];
      },
    );
  }

  FutureReport<Product> getProduct(String id) async {
    return handle(
      call: () => client.get(Endpoints.products.addPath(id)),
      mapper: (data) {
        if (data case final Map map) {
          return Product.fromMap(map.map((k, v) => MapEntry(k.toString(), v)));
        }

        throw const Failure('Product not found');
      },
    );
  }
}
