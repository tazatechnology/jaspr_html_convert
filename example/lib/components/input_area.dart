import 'dart:html';

import 'package:jaspr/jaspr.dart';
import 'package:jaspr_riverpod/jaspr_riverpod.dart';
import 'package:jaspr_tailwind_ui/jaspr_tailwind_ui.dart';

import 'package:jaspr_html_convert_app/providers.dart';

// ==========================================
// CLASS: DartInputArea
// ==========================================

class DartInputArea extends StatefulComponent {
  const DartInputArea({
    super.key,
    required this.input,
    required this.onInput,
  });
  final String input;
  final ValueChanged<String> onInput;

  @override
  DartInputAreaState createState() => DartInputAreaState();
}

class DartInputAreaState extends State<DartInputArea> {
  /// Get the input area
  TextAreaElement get inputArea =>
      window.document.querySelector('#input-area') as TextAreaElement;

  // ------------------------------------------
  // METHOD: build
  // ------------------------------------------

  @override
  Iterable<Component> build(BuildContext context) sync* {
    final btnClasses = 'ring-1 ring-inset ring-gray-200 w-22';

    yield div(
      [
        label(
          [
            text('Raw HTML:'),
          ],
          classes: [
            'block',
            'text-md',
            'font-bold',
            'leading-6',
            'text-gray-900',
          ].join(' '),
          htmlFor: 'input-area',
        ),
        div(
          [
            SecondaryButton(
              label: 'Hello World',
              size: ButtonSize.sm,
              classes: btnClasses,
              onClick: () {
                inputArea.value = DEFAULT_INPUT;
                context.read(inputProvider.notifier).state = DEFAULT_INPUT;
              },
            ),
            SecondaryButton(
              label: 'Example 1',
              size: ButtonSize.sm,
              classes: btnClasses,
              onClick: () {
                inputArea.value = EXAMPLE_1;
                context.read(inputProvider.notifier).state = EXAMPLE_1;
              },
            ),
            SecondaryButton(
              label: 'Example 2',
              size: ButtonSize.sm,
              classes: btnClasses,
              onClick: () {
                inputArea.value = EXAMPLE_2;
                context.read(inputProvider.notifier).state = EXAMPLE_2;
              },
            ),
            SecondaryButton(
              label: 'Example 3',
              size: ButtonSize.sm,
              classes: btnClasses,
              onClick: () {
                inputArea.value = EXAMPLE_3;
                context.read(inputProvider.notifier).state = EXAMPLE_3;
              },
            ),
          ],
          classes: ['py-2', 'space-x-3'].join(' '),
        ),
        div(
          [
            textarea(
              [
                text(component.input),
              ],
              classes: [
                'resize-none',
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
              name: 'input-area',
              id: 'input-area',
              onInput: component.onInput,
              required: true,
              placeholder: 'Enter raw HTML here...',
            ),
          ],
          classes: [
            'mt-2',
            'h-full',
          ].join(' '),
        ),
      ],
      classes: 'h-full',
    );
  }
}
