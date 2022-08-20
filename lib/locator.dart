
import 'package:get_it/get_it.dart';
import 'package:piton_assignment/features/auth/helper/shared_helper.dart';
import 'package:piton_assignment/features/auth/service/login_service.dart';
import 'package:piton_assignment/features/products/service/product_service.dart';

GetIt getIt = GetIt.instance;

setup(){
  getIt.registerLazySingleton<ProductService>(() => ProductService());
  getIt.registerLazySingleton<LoginService>(() => LoginService());
  getIt.registerLazySingleton<SharedHelper>(() => SharedHelper());
}