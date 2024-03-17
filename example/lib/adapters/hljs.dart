@JS()
library hljs;

import 'package:js/js.dart';

@JS('hljs.highlightAll')
external void highlightAll();

@JS('hljs.highlight')
external dynamic highlight(
  String language,
  String code,
  // Map<String, String> options,
);
