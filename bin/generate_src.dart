// ignore_for_file: depend_on_referenced_packages

import 'dart:convert';
import 'dart:io';

import "package:dart_style/dart_style.dart";
import "package:path/path.dart" as p;

void main() {
  final root = Platform.script.path.split('.dart_tool')[0];
  final htmlFile = File(p.join(root, 'assets', 'html.json'));
  final srcFile = File(p.join(root, 'lib', 'src', 'components.dart'));
  final jsonData = Map<String, dynamic>.from(
    jsonDecode(htmlFile.readAsStringSync()),
  );

  final src = StringBuffer();
  src.write("""
  import 'schema.dart';

  const List<ComponentStructure> components = [\n
  """);
  for (final group in jsonData.keys) {
    final groupData = Map<String, Map<String, dynamic>>.from(jsonData[group]);
    for (final e in groupData.entries) {
      if (e.key.startsWith(':')) {
        continue;
      }
      src.write("""
      ComponentStructure(
        name: '${e.key}',
      """);

      if (e.value['self_closing'] == true) {
        src.write("selfClosing: true,");
      }

      if (e.value['attributes'] == null) {
        src.write("),");
        continue;
      } else {
        src.write("attributes: [");
      }

      if (e.value['inherit'] == 'shapes') {
        src.write("...shapes,");
      }

      final attrs = Map<String, dynamic>.from(e.value['attributes']);
      for (final attr in attrs.entries) {
        String? typeName;
        if (attr.value['type'] != null) {
          if (attr.value['type'] is Map) {
            typeName = attr.value['type']['name'].toString().split(':').last;
          } else if (attr.value['type'] is String) {
            typeName = attr.value['type'].toString().split(':').last;
          }
        }

        // Skip function attributes, these cannot be parsed from HTML
        if (typeName?.contains('event:') ?? false) {
          continue;
        }

        src.write("""
        ComponentAttribute(
          raw: '${attr.key}',
          name: '${attr.value['name'] ?? attr.key}',
          type: '${typeName ?? 'String'}',
        ),
        """);
      }
      src.write("],),");
    }
  }
  src.write("];");

  srcFile.writeAsStringSync(
    DartFormatter().format(src.toString()),
  );
}
