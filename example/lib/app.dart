import 'package:jaspr/jaspr.dart';
import 'package:jaspr_html_convert_app/components/input_area.dart';
import 'package:jaspr_html_convert_app/components/render_area.dart';
import 'package:jaspr_html_convert/jaspr_html_convert.dart';
import 'package:jaspr_html_convert_app/adapters/hljs.dart' as hljs;
import 'package:jaspr_html_convert_app/providers.dart';
import 'package:jaspr_riverpod/jaspr_riverpod.dart';
import 'package:jaspr_tailwind_ui/jaspr_tailwind_ui.dart';

class App extends StatefulComponent {
  const App({
    super.key,
  });

  @override
  AppState createState() => AppState();
}

class AppState extends State<App> {
  // ------------------------------------------
  // METHOD: convert
  // ------------------------------------------

  void convert() {
    final rawInput = context.read(inputProvider);
    if (rawInput.isEmpty) {
      return;
    }
    setState(() {
      context.read(outputProvider.notifier).state =
          JasprConverter().convert(rawInput);
      context.binding.addPostFrameCallback(() {
        hljs.highlightAll();
      });
    });
  }

  // ------------------------------------------
  // METHOD: build
  // ------------------------------------------

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield div(
      [
        div(
          [
            h3(
              [
                text('Jaspr HTML Converter'),
              ],
              classes: [
                'text-base',
                'font-semibold',
                'leading-6',
                'text-gray-900',
              ].join(' '),
            ),
            div(
              [
                PrimaryButton(
                  label: 'Convert',
                  size: ButtonSize.lg,
                  onClick: convert,
                  classes:
                      'shadow-sm text-white font-medium bg-indigo-600 hover:bg-indigo-500 w-24',
                ),
                SecondaryButton(
                  label: 'Reset',
                  size: ButtonSize.lg,
                  onClick: () {
                    setState(() {
                      context.read(inputProvider.notifier).state =
                          DEFAULT_INPUT;
                      context.read(outputProvider.notifier).state = '';
                    });
                  },
                  classes: 'ml-3 ring-1 ring-inset ring-gray-100 w-24',
                ),
              ],
              classes: [
                'mt-3',
                'sm:ml-4',
                'sm:mt-0',
              ].join(' '),
            ),
          ],
          classes: [
            'border-b',
            'border-gray-200',
            'pb-5',
            'sm:flex',
            'sm:items-center',
            'sm:justify-between',
          ].join(' '),
        ),
        div(
          [
            DartInputArea(
              key: UniqueKey(),
              input: context.watch(inputProvider),
              onInput: (value) {
                context.read(inputProvider.notifier).state = value;
              },
            ),
            JasprRenderArea(
              output: context.watch(outputProvider),
            ),
          ],
          classes: 'grid grid-cols-2 gap-2 pt-5 h-5/6',
        )
      ],
      classes: 'h-screen w-screen p-5',
    );
  }
}
