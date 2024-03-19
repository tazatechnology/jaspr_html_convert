import 'dart:io';

import 'package:dart_style/dart_style.dart';
import 'package:test/test.dart';

import 'package:jaspr_html_convert/jaspr_html_convert.dart';

void main() {
  group('Samples', () {
    test('HTML 5 Test Page', () {
      // Read the test HTML file
      // https://github.com/cbracco/html5-test-page/tree/master
      final input = File('assets/index.html').readAsStringSync();
      final converter = JasprConverter(classesAsList: false);
      var result = converter.convert(input);
      // Ensure the output can be formatted correctly
      DartFormatter().format('final x = $result;');
    });
  });
}
