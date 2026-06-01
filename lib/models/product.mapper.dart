// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'product.dart';

class ProductMapper extends ClassMapperBase<Product> {
  ProductMapper._();

  static ProductMapper? _instance;
  static ProductMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ProductMapper._());
      RatingMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'Product';

  static int _$id(Product v) => v.id;
  static const Field<Product, int> _f$id = Field('id', _$id);
  static String _$title(Product v) => v.title;
  static const Field<Product, String> _f$title = Field('title', _$title);
  static num _$price(Product v) => v.price;
  static const Field<Product, num> _f$price = Field('price', _$price);
  static String _$description(Product v) => v.description;
  static const Field<Product, String> _f$description = Field(
    'description',
    _$description,
  );
  static String _$category(Product v) => v.category;
  static const Field<Product, String> _f$category = Field(
    'category',
    _$category,
  );
  static String _$image(Product v) => v.image;
  static const Field<Product, String> _f$image = Field('image', _$image);
  static Rating _$rating(Product v) => v.rating;
  static const Field<Product, Rating> _f$rating = Field('rating', _$rating);

  @override
  final MappableFields<Product> fields = const {
    #id: _f$id,
    #title: _f$title,
    #price: _f$price,
    #description: _f$description,
    #category: _f$category,
    #image: _f$image,
    #rating: _f$rating,
  };

  static Product _instantiate(DecodingData data) {
    return Product(
      id: data.dec(_f$id),
      title: data.dec(_f$title),
      price: data.dec(_f$price),
      description: data.dec(_f$description),
      category: data.dec(_f$category),
      image: data.dec(_f$image),
      rating: data.dec(_f$rating),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static Product fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Product>(map);
  }

  static Product fromJson(String json) {
    return ensureInitialized().decodeJson<Product>(json);
  }
}

mixin ProductMappable {
  String toJson() {
    return ProductMapper.ensureInitialized().encodeJson<Product>(
      this as Product,
    );
  }

  Map<String, dynamic> toMap() {
    return ProductMapper.ensureInitialized().encodeMap<Product>(
      this as Product,
    );
  }

  ProductCopyWith<Product, Product, Product> get copyWith =>
      _ProductCopyWithImpl<Product, Product>(
        this as Product,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return ProductMapper.ensureInitialized().stringifyValue(this as Product);
  }

  @override
  bool operator ==(Object other) {
    return ProductMapper.ensureInitialized().equalsValue(
      this as Product,
      other,
    );
  }

  @override
  int get hashCode {
    return ProductMapper.ensureInitialized().hashValue(this as Product);
  }
}

extension ProductValueCopy<$R, $Out> on ObjectCopyWith<$R, Product, $Out> {
  ProductCopyWith<$R, Product, $Out> get $asProduct =>
      $base.as((v, t, t2) => _ProductCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class ProductCopyWith<$R, $In extends Product, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  RatingCopyWith<$R, Rating, Rating> get rating;
  $R call({
    int? id,
    String? title,
    num? price,
    String? description,
    String? category,
    String? image,
    Rating? rating,
  });
  ProductCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _ProductCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, Product, $Out>
    implements ProductCopyWith<$R, Product, $Out> {
  _ProductCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Product> $mapper =
      ProductMapper.ensureInitialized();
  @override
  RatingCopyWith<$R, Rating, Rating> get rating =>
      $value.rating.copyWith.$chain((v) => call(rating: v));
  @override
  $R call({
    int? id,
    String? title,
    num? price,
    String? description,
    String? category,
    String? image,
    Rating? rating,
  }) => $apply(
    FieldCopyWithData({
      if (id != null) #id: id,
      if (title != null) #title: title,
      if (price != null) #price: price,
      if (description != null) #description: description,
      if (category != null) #category: category,
      if (image != null) #image: image,
      if (rating != null) #rating: rating,
    }),
  );
  @override
  Product $make(CopyWithData data) => Product(
    id: data.get(#id, or: $value.id),
    title: data.get(#title, or: $value.title),
    price: data.get(#price, or: $value.price),
    description: data.get(#description, or: $value.description),
    category: data.get(#category, or: $value.category),
    image: data.get(#image, or: $value.image),
    rating: data.get(#rating, or: $value.rating),
  );

  @override
  ProductCopyWith<$R2, Product, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _ProductCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class RatingMapper extends ClassMapperBase<Rating> {
  RatingMapper._();

  static RatingMapper? _instance;
  static RatingMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = RatingMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'Rating';

  static num _$rate(Rating v) => v.rate;
  static const Field<Rating, num> _f$rate = Field('rate', _$rate);
  static int _$count(Rating v) => v.count;
  static const Field<Rating, int> _f$count = Field('count', _$count);

  @override
  final MappableFields<Rating> fields = const {
    #rate: _f$rate,
    #count: _f$count,
  };

  static Rating _instantiate(DecodingData data) {
    return Rating(rate: data.dec(_f$rate), count: data.dec(_f$count));
  }

  @override
  final Function instantiate = _instantiate;

  static Rating fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Rating>(map);
  }

  static Rating fromJson(String json) {
    return ensureInitialized().decodeJson<Rating>(json);
  }
}

mixin RatingMappable {
  String toJson() {
    return RatingMapper.ensureInitialized().encodeJson<Rating>(this as Rating);
  }

  Map<String, dynamic> toMap() {
    return RatingMapper.ensureInitialized().encodeMap<Rating>(this as Rating);
  }

  RatingCopyWith<Rating, Rating, Rating> get copyWith =>
      _RatingCopyWithImpl<Rating, Rating>(this as Rating, $identity, $identity);
  @override
  String toString() {
    return RatingMapper.ensureInitialized().stringifyValue(this as Rating);
  }

  @override
  bool operator ==(Object other) {
    return RatingMapper.ensureInitialized().equalsValue(this as Rating, other);
  }

  @override
  int get hashCode {
    return RatingMapper.ensureInitialized().hashValue(this as Rating);
  }
}

extension RatingValueCopy<$R, $Out> on ObjectCopyWith<$R, Rating, $Out> {
  RatingCopyWith<$R, Rating, $Out> get $asRating =>
      $base.as((v, t, t2) => _RatingCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class RatingCopyWith<$R, $In extends Rating, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({num? rate, int? count});
  RatingCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _RatingCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, Rating, $Out>
    implements RatingCopyWith<$R, Rating, $Out> {
  _RatingCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Rating> $mapper = RatingMapper.ensureInitialized();
  @override
  $R call({num? rate, int? count}) => $apply(
    FieldCopyWithData({
      if (rate != null) #rate: rate,
      if (count != null) #count: count,
    }),
  );
  @override
  Rating $make(CopyWithData data) => Rating(
    rate: data.get(#rate, or: $value.rate),
    count: data.get(#count, or: $value.count),
  );

  @override
  RatingCopyWith<$R2, Rating, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _RatingCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

