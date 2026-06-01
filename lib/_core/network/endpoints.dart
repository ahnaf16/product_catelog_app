extension type const EndPoint(String value) implements String {
  String queryParams(Map<String, dynamic> query) {
    return '$this?${query.entries.map((e) => '${e.key}=${e.value}').join('&')}';
  }

  EndPoint addPath(String p) => EndPoint('$value/$p');

  String get name => replaceAll('/', '');
}

class Endpoints {
  Endpoints._();

  // base url
  static const String _baseUrl = 'https://fakestoreapi.com/';

  static String get clientApi => _baseUrl;

  static EndPoint get products => const EndPoint('products');
}
