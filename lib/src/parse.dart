import 'package:html/dom.dart';
import 'package:html/parser.dart';
import 'package:dart_style/dart_style.dart';
import 'package:recase/recase.dart';

// ------------------------------------------
// METHOD: convertHtmlToJaspr
// ------------------------------------------

/// Converts an HTML string input into Jaspr components
String convertHtmlToJaspr(String source) {
  String output = '';

  final doc = parse(source);

  for (final element in doc.children.first.children) {
    output += _convertElement(element, source);
  }

  output = output.trim();
  try {
    return DartFormatter().format('final components = [$output];');
  } catch (e) {
    print(e);
    return output;
  }
}

// ------------------------------------------
// METHOD: _convertElement
// ------------------------------------------

String _convertElement(Element e, String source) {
  if (!_components.contains(e.localName)) {
    return '';
  }

  final eName = e.localName;
  final noChildren = ['br', 'img'].contains(eName);

  final sourceContainsParent = source.contains('<$eName');

  /// Implies element added by parser and not actually in source
  if (!sourceContainsParent && e.children.isEmpty) {
    return '';
  }

  String out = '';

  // Handle elements that do not expect to have children
  if (sourceContainsParent) {
    if (noChildren) {
      out = '\nimg(\n';
    } else {
      out = '\n$eName([';
    }
  }

  for (final child in e.children) {
    out += _convertElement(child, source);
  }

  // Do not include this parent element, added by parser
  if (!sourceContainsParent) {
    return out;
  }

  if (!noChildren) {
    out += '],';
  }

  /// Add classes
  if (e.className.isNotEmpty) {
    out += "classes: '${e.className}',";
  }

  final Map<String, String> unsupportedAttrMap = {};
  final Map<String, String> specialAttrMap = {};

  /// Add Jaspr supported attributes
  for (final attr in e.attributes.entries) {
    if (attr.key == 'class') {
      continue;
    }
    String attrKey = attr.key.toString();

    /// Handle unsupported attributes separately
    if (_unsupportedAttributes.contains(attrKey)) {
      unsupportedAttrMap[attrKey] = attr.value;
      continue;
    }

    /// Handle special attributes separately
    if (eName == 'input' && attrKey == 'type') {
      specialAttrMap[attrKey] = 'InputType.${attr.value.snakeCase}';
      continue;
    }
    if (eName == 'button' && attrKey == 'type') {
      specialAttrMap[attrKey] = 'ButtonType.${attr.value.snakeCase}';
      continue;
    }
    if (eName == 'form' && attrKey == 'method') {
      specialAttrMap[attrKey] = 'FormMethod.${attr.value.snakeCase}';
      continue;
    }

    /// Add protections for specific attribute names
    if (attrKey == 'for') {
      attrKey = 'htmlFor';
    }

    out += "$attrKey: '${attr.value}',";
  }

  if (specialAttrMap.isNotEmpty) {
    for (final attr in specialAttrMap.entries) {
      out += "${attr.key}: ${attr.value},";
    }
  }

  /// Add unsupported attributes
  if (unsupportedAttrMap.isNotEmpty) {
    out += 'attributes: {';
    for (final attr in unsupportedAttrMap.entries) {
      out += "'${attr.key}': '${attr.value}',";
    }
    out += '},';
  }

  out += '),\n';

  return out;
}

/// List of unsupported attributes
/// These attributes are not directly supported by Jaspr and need to be passed in via an attribute map
final _unsupportedAttributes = [
  'autocomplete',
  'required',
];

/// Refer to Jaspr package for list of supported components
/// https://github.com/schultek/jaspr/tree/main/packages/jaspr/lib/src/components/html
final _components = [
  'a',
  'b',
  'br',
  'code',
  'em',
  'i',
  's',
  'small',
  'span',
  'strong',
  'u',
  'audio',
  'img',
  'video',
  'embed',
  'iframe',
  'object',
  'source',
  'svg',
  'rect',
  'circle',
  'ellipse',
  'line',
  'path',
  'polygon',
  'polyline',
  'button',
  'form',
  'input',
  'label',
  'datalist',
  'legend',
  'meter',
  'progress',
  'optgroup',
  'option',
  'select',
  'fieldset',
  'textarea',
  'details',
  'dialog',
  'summary',
  'link',
  'script',
  'article',
  'aside',
  'body',
  'footer',
  'head',
  'header',
  'html',
  'h1',
  'h2',
  'h3',
  'h4',
  'h5',
  'h6',
  'nav',
  'section',
  'blockquote',
  'div',
  'ul',
  'ol',
  'li',
  'hr',
  'p',
  'pre',
];
