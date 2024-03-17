// import 'package:dart_style/dart_style.dart';
import 'package:html/dom.dart';
import 'package:html/parser.dart';
import 'package:recase/recase.dart';

// ==========================================
// CLASS: JasprConverter
// ==========================================

class JasprConverter {
  const JasprConverter({
    this.classesAsList = false,
  });

  /// Convert classes to list of strings with a join statement
  ///
  /// Useful for easily adding/removing classes in component code
  final bool classesAsList;

  // ------------------------------------------
  // METHOD: convert
  // ------------------------------------------

  /// Converts an HTML string input into Jaspr components
  String convert(String source) {
    String output = '';

    final doc = parse(source);

    for (final element in doc.children.first.children) {
      output += _convertElement(element, source);
    }

    output = output.trim();
    // return DartFormatter().format('final components = [$output];');
    return output;
  }

  // ------------------------------------------
  // METHOD: _convertElement
  // ------------------------------------------

  String _convertElement(Element e, String source) {
    final eName = e.localName;
    final unSupportedComponent = !_components.contains(eName);

    final noChildren = ['br', 'img'].contains(eName);

    final sourceContainsParent = source.contains('<$eName');

    // Implies element added by parser and not actually in source
    if (!sourceContainsParent && e.children.isEmpty) {
      return '';
    }

    String out = '';

    // Handle elements that do not expect to have children
    if (sourceContainsParent) {
      if (noChildren) {
        out = '\n$eName(\n';
      } else {
        if (unSupportedComponent) {
          out = "DomComponent(tag: '$eName',children: [";
        } else {
          out = '\n$eName([';
        }
      }
    }

    // Look for any inner text
    if (e.hasChildNodes()) {
      for (final node in e.nodes) {
        if (node.nodeType == Node.TEXT_NODE &&
            (node.text?.trim().isNotEmpty ?? false)) {
          out += "text('${node.text!.replaceAll('\n', '')}'),";
        }
      }
    }

    // Recursively convert nested DOM elements
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
      if (classesAsList) {
        final classList = e.className
            .split(' ')
            .map((e) => e.replaceAll(RegExp(r'\s+'), ' ').trim())
            .join("', '");
        out += "classes: ['$classList',].join(' '),";
      } else {
        out += "classes: '${e.className}',";
      }
    }

    final Map<String, String> unsupportedAttrMap = {};
    final Map<String, String> specialAttrMap = {};

    // Add Jaspr supported attributes
    for (final attr in e.attributes.entries) {
      if (attr.key == 'class') {
        continue;
      }

      String attrKey = attr.key.toString();

      if (unSupportedComponent && attrKey != 'id') {
        unsupportedAttrMap[attrKey] = attr.value;
        continue;
      }

      // Add protections for specific attribute names
      if (attrKey == 'for') {
        attrKey = 'htmlFor';
      }

      // Handle unsupported attributes separately
      if (_unsupportedAttributes.contains(attrKey) ||
          attrKey.startsWith('aria') ||
          attrKey.startsWith('stroke')) {
        if (eName == 'path' && attrKey == 'stroke-width') {
          attrKey = 'strokeWidth';
        } else {
          unsupportedAttrMap[attrKey] = attr.value;
          continue;
        }
      }

      // Handle special attributes separately
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
      if (eName == 'svg' && (attrKey == 'width' || attrKey == 'height')) {
        specialAttrMap[attrKey] = 'Unit.pixels(${attr.value})';
        continue;
      }
      if (eName == 'img' && (attrKey == 'width' || attrKey == 'height')) {
        specialAttrMap[attrKey] = attr.value;
        continue;
      }
      out += "$attrKey: '${attr.value}',";
    }

    if (specialAttrMap.isNotEmpty) {
      for (final attr in specialAttrMap.entries) {
        out += "${attr.key}: ${attr.value},";
      }
    }

    // Add unsupported attributes
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
}

/// List of unsupported attributes
/// These attributes are not directly supported by Jaspr and need to be passed in via an attribute map
final _unsupportedAttributes = [
  'autocomplete',
  'required',
  'fill',
  'fill-rule',
  'clip-rule',
  'version',
  'xmlns',
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
