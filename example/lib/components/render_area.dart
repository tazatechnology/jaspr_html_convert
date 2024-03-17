import 'package:jaspr/jaspr.dart';
import 'package:jaspr_html_convert_app/adapters/hljs.dart' as hljs;

// ==========================================
// CLASS: JasprRenderArea
// ==========================================

class JasprRenderArea extends StatefulComponent {
  const JasprRenderArea({
    super.key,
    required this.output,
  });
  final String output;

  @override
  JasprRenderAreaState createState() => JasprRenderAreaState();
}

class JasprRenderAreaState extends State<JasprRenderArea> {
  @override
  Iterable<Component> build(BuildContext context) sync* {
    /// Ensure that the code is highlighted after the component is rendered.
    context.binding.addPostFrameCallback(() {
      if (component.output.isNotEmpty) {
        hljs.highlightAll();
      }
    });

    yield div(
      [
        label(
          [
            text('Jaspr Component Code:'),
          ],
          classes: [
            'block',
            'text-sm',
            'font-bold',
            'leading-6',
            'text-gray-900',
          ].join(' '),
          htmlFor: 'render-area',
        ),
        div(
          [
            pre(
              [
                code(
                  [text(component.output)],
                  classes: 'language-dart rounded-md',
                )
              ],
              classes: [
                'block',
                'w-full',
                'h-full',
                'rounded-md',
                'border-0',
                'p-3',
                'text-gray-900',
                'shadow-sm',
                'ring-1',
                'ring-inset',
                'ring-gray-300',
                'placeholder:text-gray-400',
                'focus:ring-2',
                'focus:ring-inset',
                'focus:ring-indigo-600',
                'font-mono',
                'text-sm',
              ].join(' '),
              id: 'render-area',
            ),
          ],
          classes: [
            'mt-2',
            'h-full',
          ].join(' '),
        ),
      ],
      classes: 'h-full',
      key: UniqueKey(),
    );
  }
}
