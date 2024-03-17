import 'package:test/test.dart';

import 'package:jaspr_html_convert/jaspr_html_convert.dart';

void main() {
  group('Placeholder Test', () {
    JasprConverter().convert("<div><h1>Hello, World!</h1></div>");
  });
}
