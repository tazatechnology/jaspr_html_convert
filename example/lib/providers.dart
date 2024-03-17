import 'package:jaspr_riverpod/jaspr_riverpod.dart';

// ignore: constant_identifier_names
const DEFAULT_INPUT = '<div><h1>Hello, World!</h1></div>';

final inputProvider = StateProvider<String>((ref) {
  return DEFAULT_INPUT;
});

final outputProvider = StateProvider<String>((ref) {
  return '';
});
