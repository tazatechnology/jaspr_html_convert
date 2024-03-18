import 'dart:html' show window;

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
  bool copyInProgress = false;

  // ------------------------------------------
  // METHOD: copyToClipboard
  // ------------------------------------------

  void copyToClipboard() {
    setState(() {
      copyInProgress = true;
    });
    window.navigator.clipboard?.writeText(component.output);
    Future.delayed(const Duration(milliseconds: 1000), () {
      setState(() {
        copyInProgress = false;
      });
    });
  }

  // ------------------------------------------
  // METHOD: build
  // ------------------------------------------

  @override
  Iterable<Component> build(BuildContext context) sync* {
    /// Ensure that the code is highlighted after the component is rendered.
    context.binding.addPostFrameCallback(() {
      if (component.output.isNotEmpty) {
        hljs.highlightAll();
      }
    });

    final copySvg = svg(
      [
        path(
          [],
          d: 'M12.9975 10.7499L11.7475 10.7499C10.6429 10.7499 9.74747 11.6453 9.74747 12.7499L9.74747 21.2499C9.74747 22.3544 10.6429 23.2499 11.7475 23.2499L20.2475 23.2499C21.352 23.2499 22.2475 22.3544 22.2475 21.2499L22.2475 12.7499C22.2475 11.6453 21.352 10.7499 20.2475 10.7499L18.9975 10.7499',
          strokeWidth: '1.5',
          fill: Colors.transparent,
        ),
        path(
          [],
          d: 'M17.9975 12.2499L13.9975 12.2499C13.4452 12.2499 12.9975 11.8022 12.9975 11.2499L12.9975 9.74988C12.9975 9.19759 13.4452 8.74988 13.9975 8.74988L17.9975 8.74988C18.5498 8.74988 18.9975 9.19759 18.9975 9.74988L18.9975 11.2499C18.9975 11.8022 18.5498 12.2499 17.9975 12.2499Z',
          strokeWidth: '1.5',
          fill: Colors.transparent,
        ),
        path(
          [],
          d: 'M13.7475 16.2499L18.2475 16.2499',
          strokeWidth: '1.5',
        ),
        path(
          [],
          d: 'M13.7475 19.2499L18.2475 19.2499',
          strokeWidth: '1.5',
        ),
      ],
      classes:
          'h-6 w-6 stroke-slate-100 transition group-hover:rotate-[-4deg] group-hover:stroke-slate-600',
      viewBox: '0 0 32 32',
    );

    final checkSvg = span([text('✓')], classes: 'px-1.5 py-0.5');

    yield div(
      [
        label(
          [
            text('Jaspr Component Code:'),
          ],
          classes: [
            'block',
            'text-md',
            'font-bold',
            'leading-6',
            'text-gray-900',
          ].join(' '),
          htmlFor: 'render-area',
        ),
        div(
          [
            button(
              [
                text('Copy Code'),
                copyInProgress ? checkSvg : copySvg,
              ],
              classes: [
                'inline-flex',
                'items-center',
                'gap-x-1.5',
                'rounded-md',
                if (component.output.isEmpty) ...[
                  'cursor-not-allowed',
                  'bg-gray-300',
                ],
                if (component.output.isNotEmpty) ...[
                  'cursor-pointer',
                  if (copyInProgress) 'bg-green-600' else 'bg-indigo-600',
                ],
                'text-white',
                'text-sm',
                'px-2',
                'py-0.5',
                'pl-4',
                'rounded',
              ].join(' '),
              type: ButtonType.button,
              onClick: copyToClipboard,
            ),
          ],
          classes: ['py-2', 'space-x-3'].join(' '),
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
