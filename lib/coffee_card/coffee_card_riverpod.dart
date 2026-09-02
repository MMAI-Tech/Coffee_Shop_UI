


import 'package:flutter_riverpod/legacy.dart';

final size_num = StateProvider.family((ref,String){
  return 1;
});

final isAdd = StateProvider.family((ref,String){
  return false;
});

final counter = StateProvider.family((ref,String){
  return 1;
});

final total_price = StateProvider.family((ref,String){
  return 0.0;
});