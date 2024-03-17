// ignore_for_file: unused_local_variable

import 'package:test/test.dart';
import 'package:dart_style/dart_style.dart';

import 'package:jaspr_html_convert/jaspr_html_convert.dart';

void main() {
  group('Test Components', () {
    test('a', () {
      final out = JasprConverter().convert("<a></a>");
      final outFmt = DartFormatter().format('final x = [$out];');
    });

    test('b', () {
      final out = JasprConverter().convert("<b></b>");
      final outFmt = DartFormatter().format('final x = [$out];');
    });

    test('br', () {
      final out = JasprConverter().convert("<br></br>");
      final outFmt = DartFormatter().format('final x = [$out];');
    });

    test('code', () {
      final out = JasprConverter().convert("<code></code>");
      final outFmt = DartFormatter().format('final x = [$out];');
    });

    test('em', () {
      final out = JasprConverter().convert("<em></em>");
      final outFmt = DartFormatter().format('final x = [$out];');
    });

    test('i', () {
      final out = JasprConverter().convert("<i></i>");
      final outFmt = DartFormatter().format('final x = [$out];');
    });

    test('s', () {
      final out = JasprConverter().convert("<s></s>");
      final outFmt = DartFormatter().format('final x = [$out];');
    });

    test('small', () {
      final out = JasprConverter().convert("<small></small>");
      final outFmt = DartFormatter().format('final x = [$out];');
    });

    test('span', () {
      final out = JasprConverter().convert("<span></span>");
      final outFmt = DartFormatter().format('final x = [$out];');
    });

    test('strong', () {
      final out = JasprConverter().convert("<strong></strong>");
      final outFmt = DartFormatter().format('final x = [$out];');
    });

    test('u', () {
      final out = JasprConverter().convert("<u></u>");
      final outFmt = DartFormatter().format('final x = [$out];');
    });

    test('audio', () {
      final out = JasprConverter().convert("<audio></audio>");
      final outFmt = DartFormatter().format('final x = [$out];');
    });

    test('img', () {
      final out = JasprConverter().convert("<img></img>");
      final outFmt = DartFormatter().format('final x = [$out];');
    });

    test('video', () {
      final out = JasprConverter().convert("<video></video>");
      final outFmt = DartFormatter().format('final x = [$out];');
    });

    test('embed', () {
      final out = JasprConverter().convert("<embed></embed>");
      final outFmt = DartFormatter().format('final x = [$out];');
    });

    test('iframe', () {
      final out = JasprConverter().convert("<iframe></iframe>");
      final outFmt = DartFormatter().format('final x = [$out];');
    });

    test('object', () {
      final out = JasprConverter().convert("<object></object>");
      final outFmt = DartFormatter().format('final x = [$out];');
    });

    test('source', () {
      final out = JasprConverter().convert("<source></source>");
      final outFmt = DartFormatter().format('final x = [$out];');
    });

    test('svg', () {
      final out = JasprConverter().convert("""
<svg x="50%" y="-1" viewBox="-60 -60 60 60" xmlns="http://www.w3.org/2000/svg" width="200" height="600" version="1.1">
   <path fill="red" stroke="blue" stroke-width="3" d="M -0.1552523 -50.822140300000001"/>
</svg>
""");

      // Ensure name is updated to safe name
      assert(out.contains('strokeWidth'));
      // Ensure that the width and height are converted to jasper units
      assert(out.contains('width: Unit.pixels(200)'));
      assert(out.contains('height: Unit.pixels(600)'));
      // Ensure that the x and y are added to attributes map
      assert(out.contains("'x': '50%','y': '-1'"));
      final outFmt = DartFormatter().format('final x = [$out];');
    });

    test('rect', () {
      final out = JasprConverter().convert("<rect></rect>");
      final outFmt = DartFormatter().format('final x = [$out];');
    });

    test('circle', () {
      final out = JasprConverter().convert("<circle></circle>");
      final outFmt = DartFormatter().format('final x = [$out];');
    });

    test('ellipse', () {
      final out = JasprConverter().convert("<ellipse></ellipse>");
      final outFmt = DartFormatter().format('final x = [$out];');
    });

    test('line', () {
      final out = JasprConverter().convert("<line></line>");
      final outFmt = DartFormatter().format('final x = [$out];');
    });

    test('path', () {
      final out = JasprConverter().convert("<path></path>");
      final outFmt = DartFormatter().format('final x = [$out];');
    });

    test('polygon', () {
      final out = JasprConverter().convert("<polygon></polygon>");
      final outFmt = DartFormatter().format('final x = [$out];');
    });

    test('polyline', () {
      final out = JasprConverter().convert("<polyline></polyline>");
      final outFmt = DartFormatter().format('final x = [$out];');
    });

    test('button', () {
      final out = JasprConverter().convert("<button></button>");
      final outFmt = DartFormatter().format('final x = [$out];');
    });

    test('form', () {
      final out = JasprConverter().convert("<form></form>");
      final outFmt = DartFormatter().format('final x = [$out];');
    });

    test('input', () {
      final out = JasprConverter().convert("<input></input>");
      final outFmt = DartFormatter().format('final x = [$out];');
    });

    test('label', () {
      final out = JasprConverter().convert("<label></label>");
      final outFmt = DartFormatter().format('final x = [$out];');
    });

    test('datalist', () {
      final out = JasprConverter().convert("<datalist></datalist>");
      final outFmt = DartFormatter().format('final x = [$out];');
    });

    test('legend', () {
      final out = JasprConverter().convert("<legend></legend>");
      final outFmt = DartFormatter().format('final x = [$out];');
    });

    test('meter', () {
      final out = JasprConverter().convert("<meter></meter>");
      final outFmt = DartFormatter().format('final x = [$out];');
    });

    test('progress', () {
      final out = JasprConverter().convert("<progress></progress>");
      final outFmt = DartFormatter().format('final x = [$out];');
    });

    test('optgroup', () {
      final out = JasprConverter().convert("<optgroup></optgroup>");
      final outFmt = DartFormatter().format('final x = [$out];');
    });

    test('option', () {
      final out = JasprConverter().convert("<option></option>");
      final outFmt = DartFormatter().format('final x = [$out];');
    });

    test('select', () {
      final out = JasprConverter().convert("<select></select>");
      final outFmt = DartFormatter().format('final x = [$out];');
    });

    test('fieldset', () {
      final out = JasprConverter().convert("<fieldset></fieldset>");
      final outFmt = DartFormatter().format('final x = [$out];');
    });

    test('textarea', () {
      final out = JasprConverter().convert("<textarea></textarea>");
      final outFmt = DartFormatter().format('final x = [$out];');
    });

    test('details', () {
      final out = JasprConverter().convert("<details></details>");
      final outFmt = DartFormatter().format('final x = [$out];');
    });

    test('dialog', () {
      final out = JasprConverter().convert("<dialog></dialog>");
      final outFmt = DartFormatter().format('final x = [$out];');
    });

    test('summary', () {
      final out = JasprConverter().convert("<summary></summary>");
      final outFmt = DartFormatter().format('final x = [$out];');
    });

    test('link', () {
      final out = JasprConverter().convert("<link></link>");
      final outFmt = DartFormatter().format('final x = [$out];');
    });

    test('script', () {
      final out = JasprConverter().convert("<script></script>");
      final outFmt = DartFormatter().format('final x = [$out];');
    });

    test('article', () {
      final out = JasprConverter().convert("<article></article>");
      final outFmt = DartFormatter().format('final x = [$out];');
    });

    test('aside', () {
      final out = JasprConverter().convert("<aside></aside>");
      final outFmt = DartFormatter().format('final x = [$out];');
    });

    test('body', () {
      final out = JasprConverter().convert("<body></body>");
      final outFmt = DartFormatter().format('final x = [$out];');
    });

    test('footer', () {
      final out = JasprConverter().convert("<footer></footer>");
      final outFmt = DartFormatter().format('final x = [$out];');
    });

    test('head', () {
      final out = JasprConverter().convert("<head></head>");
      final outFmt = DartFormatter().format('final x = [$out];');
    });

    test('header', () {
      final out = JasprConverter().convert("<header></header>");
      final outFmt = DartFormatter().format('final x = [$out];');
    });

    test('html', () {
      final out = JasprConverter().convert("<html></html>");
      final outFmt = DartFormatter().format('final x = [$out];');
    });

    test('h1', () {
      final out = JasprConverter().convert("<h1></h1>");
      final outFmt = DartFormatter().format('final x = [$out];');
    });

    test('h2', () {
      final out = JasprConverter().convert("<h2></h2>");
      final outFmt = DartFormatter().format('final x = [$out];');
    });

    test('h3', () {
      final out = JasprConverter().convert("<h3></h3>");
      final outFmt = DartFormatter().format('final x = [$out];');
    });

    test('h4', () {
      final out = JasprConverter().convert("<h4></h4>");
      final outFmt = DartFormatter().format('final x = [$out];');
    });

    test('h5', () {
      final out = JasprConverter().convert("<h5></h5>");
      final outFmt = DartFormatter().format('final x = [$out];');
    });

    test('h6', () {
      final out = JasprConverter().convert("<h6></h6>");
      final outFmt = DartFormatter().format('final x = [$out];');
    });

    test('nav', () {
      final out = JasprConverter().convert("<nav></nav>");
      final outFmt = DartFormatter().format('final x = [$out];');
    });

    test('section', () {
      final out = JasprConverter().convert("<section></section>");
      final outFmt = DartFormatter().format('final x = [$out];');
    });

    test('blockquote', () {
      final out = JasprConverter().convert("<blockquote></blockquote>");
      final outFmt = DartFormatter().format('final x = [$out];');
    });

    test('div', () {
      final out = JasprConverter().convert("""
<div class="aspect-[1108/632] w-[69.25rem] flex-none bg-gradient-to-r from-[#80caff] to-[#4f46e5] opacity-20" style="clip-path: polygon(73.6% 51.7%, 91.7% 11.8%, 100% 46.4%, 97.4% 82.2%, 92.5% 84.9%, 75.7% 64%, 55.3% 47.5%, 46.5% 49.4%, 45% 62.9%, 50.3% 87.2%, 21.3% 64.1%, 0.1% 100%, 5.4% 51.1%, 21.4% 63.9%, 58.9% 0.2%, 73.6% 51.7%)"></div>
</div>
""");
      assert(out.contains('Styles.raw'));
      final outFmt = DartFormatter().format('final x = [$out];');
    });

    test('ul', () {
      final out = JasprConverter().convert("<ul></ul>");
      final outFmt = DartFormatter().format('final x = [$out];');
    });

    test('ol', () {
      final out = JasprConverter().convert("<ol></ol>");
      final outFmt = DartFormatter().format('final x = [$out];');
    });

    test('li', () {
      final out = JasprConverter().convert("<li></li>");
      final outFmt = DartFormatter().format('final x = [$out];');
    });

    test('hr', () {
      final out = JasprConverter().convert("<hr></hr>");
      final outFmt = DartFormatter().format('final x = [$out];');
    });

    test('p', () {
      final out = JasprConverter().convert("<p></p>");
      final outFmt = DartFormatter().format('final x = [$out];');
    });

    test('pre', () {
      final out = JasprConverter().convert("<pre></pre>");
      final outFmt = DartFormatter().format('final x = [$out];');
    });
  });
}
