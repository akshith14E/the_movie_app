import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';

final boxProvider = Provider.family<Box, String>((ref, boxName) {
  return Hive.box(boxName);
});
