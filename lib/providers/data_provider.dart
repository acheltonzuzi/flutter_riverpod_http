import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http_riverpod/models/userModel.dart';
import 'package:http_riverpod/services/services.dart';

final userdataProvider=FutureProvider<List<User>>((ref) async{
  return ref.watch(userProvider).getUser();
});