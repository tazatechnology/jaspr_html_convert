import 'package:jaspr/jaspr.dart';
import 'package:jaspr_html_convert_app/app.dart';
import 'package:jaspr_riverpod/jaspr_riverpod.dart';

void main() {
  runApp(ProviderScope(
    child: App(),
  ));
}
