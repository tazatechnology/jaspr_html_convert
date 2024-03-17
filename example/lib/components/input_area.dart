import 'package:jaspr/jaspr.dart';
import 'package:jaspr_html_convert_app/providers.dart';
import 'package:jaspr_riverpod/jaspr_riverpod.dart';
import 'package:jaspr_tailwind_ui/jaspr_tailwind_ui.dart';

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
  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield div(
      [
        div(
          [
            label(
              [
                text('Raw HTML:'),
              ],
              classes: [
                'block',
                'text-sm',
                'font-bold',
                'leading-6',
                'text-gray-900',
              ].join(' '),
              htmlFor: 'input-area',
            ),
            div([
              SecondaryButton(
                label: 'Example 1',
                size: ButtonSize.xs,
                onClick: () {
                  context.read(inputProvider.notifier).state = EXAMPLE_1.trim();
                },
                classes: 'ml-3 ring-1 ring-inset ring-gray-300 w-20 mr-0.5',
              ),
              SecondaryButton(
                label: 'Example 2',
                size: ButtonSize.xs,
                onClick: () {
                  context.read(inputProvider.notifier).state = EXAMPLE_2.trim();
                },
                classes: 'ml-3 ring-1 ring-inset ring-gray-300 w-20 mr-0.5',
              ),
              SecondaryButton(
                label: 'Example 3',
                size: ButtonSize.xs,
                onClick: () {
                  context.read(inputProvider.notifier).state = EXAMPLE_3.trim();
                },
                classes: 'ml-3 ring-1 ring-inset ring-gray-300 w-20 mr-5',
              ),
            ])
          ],
          classes: [
            'sm:flex',
            'sm:items-center',
            'sm:justify-between',
          ].join(' '),
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
