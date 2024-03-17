import 'package:jaspr_html_convert/jaspr_html_convert.dart';

void main() {
  var result = JasprConverter().convert("<h1>Hello, World!</h1>");
  print(result);
}
