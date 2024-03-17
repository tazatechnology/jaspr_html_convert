import 'package:jaspr_html_convert/jaspr_html_convert.dart';
import 'package:test/test.dart';

void main() {
  group('Placeholder Test', () {
    JasprConverter().convert("<h1>Hello, World!</h1>");
  });
}
