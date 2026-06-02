import 'package:hive_ce/hive_ce.dart';
import 'package:product_catelog_app/main.export.dart';
import 'package:product_catelog_app/models/config.dart';

@GenerateAdapters([AdapterSpec<AppConfig>(), AdapterSpec<Product>(), AdapterSpec<Rating>()])
part 'hive_adapters.g.dart';
