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
                i(
                  [],
                  classes: copyInProgress
                      ? 'fa-solid fa-check-circle w-4'
                      : 'fa-regular fa-clipboard w-4',
                ),
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
