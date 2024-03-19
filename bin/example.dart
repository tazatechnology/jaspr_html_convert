// ignore_for_file: depend_on_referenced_packages

import 'dart:io';

import 'package:dart_style/dart_style.dart';

import 'package:jaspr_html_convert/jaspr_html_convert.dart';

void main() {
  final input = File('assets/index.html').readAsStringSync();

//   final input = """
// """;

  final converter = JasprConverter(classesAsList: false);
  var result = converter.convert(input);
  print(DartFormatter().format('final x = $result;'));
}
