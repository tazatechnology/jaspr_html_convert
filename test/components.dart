// ignore_for_file: unused_local_variable

import 'package:dart_style/dart_style.dart';
import 'package:test/test.dart';

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
      final out = JasprConverter().convert("""
<object data="index.html" height="300"></object>
""");
      assert(
        out == "[object([],data: 'index.html',height: 300,),]",
      );
      final outFmt = DartFormatter().format('final x = [$out];');
    });

    test('source', () {
      final out = JasprConverter().convert("<source></source>");
      final outFmt = DartFormatter().format('final x = [$out];');
    });

    test('svg', () {
      final out = JasprConverter().convert("""
<svg x="50%" y="-1" viewBox="-60 -60 60 60" xmlns="http://www.w3.org/2000/svg" width="200px" height="600" version="1.1">
   <path fill="red" stroke="#0000FF" stroke-width="3" d="M -0.1552523 -50.822140300000001"/>
</svg>
""");

      // Ensure name is updated to safe name
      assert(out.contains('strokeWidth'));
      // Ensure that the width and height are converted to jasper units
      assert(out.contains('width: Unit.pixels(200)'));
      assert(out.contains('height: Unit.pixels(600)'));
      assert(out.contains("fill: Color.named('red')"));
      assert(out.contains("stroke: Color.hex('#0000FF')"));
      // Ensure that the x and y are added to attributes map
      assert(out.contains("'x': '50%','y': '-1'"));
      final outFmt = DartFormatter().format('final x = [$out];');
    });

    test('rect', () {
      final out = JasprConverter().convert("<rect></rect>");
      final outFmt = DartFormatter().format('final x = [$out];');
    });

    test('circle', () {
      final out = JasprConverter().convert("""
<circle cx="100" cy="100" r="100" fill="#1fa3ec"></circle>
""");
      assert(
        out ==
            "[circle([],cx: '100',cy: '100',r: '100',fill: Color.hex('#1fa3ec'),),]",
      );
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
      final out = JasprConverter().convert("""
<button type="submit" value="Submit">Submit</button>
<button type="reset" value="Reset">Reset</button>
<button type="button" value="Button">Button</button>
""");
      assert(out.contains('ButtonType.submit'));
      assert(out.contains('ButtonType.reset'));
      assert(out.contains('ButtonType.button'));
      final outFmt = DartFormatter().format('final x = [$out];');
    });

    test('form', () {
      final out = JasprConverter().convert("<form></form>");
      final outFmt = DartFormatter().format('final x = [$out];');
    });

    test('input', () {
      final out = JasprConverter().convert("""
<input id="email-address" name="email" type="email" autocomplete="email" required class="min-w-0 flex-auto rounded-md border-0 px-3.5 py-2 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6" placeholder="Enter your email">
<input type="submit" value="<input type=submit>">
<input type="button" value="<input type=button>">
<input type="reset" value="<input type=reset>">
<input type="submit" value="<input disabled>" disabled>
<input type="datetime" id="idt" value="1970-01-01T00:00:00Z">
<input type="datetime-local" id="idtl" value="1970-01-01T00:00">
""");
      // Ensure that the x and y are added to attributes map
      assert(out.contains("id: 'email-address'"));
      assert(out.contains("'placeholder': 'Enter your email'"));
      assert(out.contains("InputType.submit"));
      assert(out.contains("InputType.button"));
      assert(out.contains("InputType.reset"));
      assert(out.contains("InputType.date"));
      assert(out.contains("InputType.dateTimeLocal"));
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
      final out = JasprConverter().convert("""
<meter value="2" min="0" max="10">2 out of 10</meter>
""");
      assert(
        out == "[meter([text('2 out of 10'),],value: 2,min: 0,max: 10,),]",
      );
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
      final out = JasprConverter().convert("""
<ul><li>List Item 1<li>List Item 2<ul><li>List Item 1<li>List Item 2<ul><li>List Item 1<li>List Item 2<ul><li>List Item 1<li>List Item 2<ul><li>List Item 1<li>List Item 2<li>List Item 3</ul><li>List Item 3</ul><li>List Item 3</ul><li>List Item 3</ul><li>List Item 3</ul>
""");
      final outFmt = DartFormatter().format('final x = [$out];');
    });

    test('ol', () {
      final out = JasprConverter().convert("""
<ol type=1><li>List Item 1<li>List Item 2<ol type=A><li>List Item 1<li>List Item 2<ol type=a><li>List Item 1<li>List Item 2<ol type=I><li>List Item 1<li>List Item 2<ol type=i><li>List Item 1<li>List Item 2<li>List Item 3</ol><li>List Item 3</ol><li>List Item 3</ol><li>List Item 3</ol><li>List Item 3</ol>
""");
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
      final out = JasprConverter().convert("""
<pre>P R E F O R M A T T E D T E X T
  ! " # \$ % &amp; ' ( ) * + , - . /
  0 1 2 3 4 5 6 7 8 9 : ; &lt; = &gt; ?
  @ A B C D E F G H I J K L M N O
  P Q R S T U V W X Y Z [ \\ ] ^ _
  ` a b c d e f g h i j k l m n o
  p q r s t u v w x y z { | } ~
</pre>
""");
      assert(out.contains('text'));
      assert(out.contains(r'\$'));
      assert(out.contains(r'\\'));
      assert(out.contains(r"\'"));
      final outFmt = DartFormatter().format('final x = [$out];');
    });
  });
}
