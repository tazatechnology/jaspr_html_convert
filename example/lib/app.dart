import 'dart:html';

import 'package:jaspr/jaspr.dart';
import 'package:jaspr_html_convert/jaspr_html_convert.dart';
import 'package:jaspr_riverpod/jaspr_riverpod.dart';
import 'package:jaspr_tailwind_ui/jaspr_tailwind_ui.dart';

import 'package:jaspr_html_convert_app/components/input_area.dart';
import 'package:jaspr_html_convert_app/components/options.dart';
import 'package:jaspr_html_convert_app/components/render_area.dart';
import 'package:jaspr_html_convert_app/providers.dart';

class App extends StatefulComponent {
  const App({
    super.key,
  });

  @override
  AppState createState() => AppState();
}

class AppState extends State<App> {
  /// Get the input area
  TextAreaElement get inputArea =>
      window.document.querySelector('#input-area') as TextAreaElement;

  // ------------------------------------------
  // METHOD: convert
  // ------------------------------------------

  void convert() {
    final rawInput = context.read(inputProvider);
    if (rawInput.trim().isEmpty) {
      return;
    }
    setState(() {
      final c = JasprConverter(
        classesAsList: context.read(classAsListProvider),
      );

      context.read(outputProvider.notifier).state = c.convert(rawInput);
    });
  }

  // ------------------------------------------
  // METHOD: build
  // ------------------------------------------

  @override
  Iterable<Component> build(BuildContext context) sync* {
    final githubLink = a(
      [
        span(
          [
            span(
              [],
              classes: [
                'fa-fw',
                'fa-brands',
                'fa-github',
              ].join(' '),
            ),
          ],
          classes: [
            'w-7',
            'h-7',
            'mr-2',
            'rounded',
            'border',
            'opacity-75',
            'border-slate-200',
            'hover:border-slate-600',
            'inline-flex',
            'items-center',
            'justify-center',
            'text-[18px]',
          ].join(' '),
        ),
      ],
      href: 'https://github.com/tazatechnology/jaspr_html_convert',
    );

    yield div(
      [
        div(
          [
            h3(
              [
                img(
                  src: 'img/jaspr-64.png',
                  classes: 'h-7 pr-3',
                ),
                githubLink,
                text('Jaspr HTML Converter'),
              ],
              classes: [
                'md:text-md',
                'sm:text-lg',
                'font-bold',
                'leading-6',
                'inline-flex',
                'items-center',
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
                      'shadow-sm text-white bg-indigo-600 hover:bg-indigo-500 text-xs md:text-sm w-18 md:w-24',
                ),
                SecondaryButton(
                  label: 'Clear',
                  size: ButtonSize.lg,
                  onClick: () {
                    setState(() {
                      context.read(inputProvider.notifier).state = '';
                      context.read(outputProvider.notifier).state = '';
                      inputArea.value = '';
                    });
                  },
                  classes:
                      'ml-3 ring-1 ring-inset ring-gray-100 text-xs md:text-sm w-18 md:w-24',
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
            'flex',
            'items-center',
            'justify-between',
          ].join(' '),
        ),
        div(
          [
            ConverterOptions(),
          ],
          classes: [
            'pt-4',
          ].join(' '),
        ),
        div(
          [
            DartInputArea(
              input: context.watch(inputProvider),
              onInput: (value) {
                context.read(inputProvider.notifier).state = value;
              },
            ),
            JasprRenderArea(
              output: context.watch(outputProvider),
            ),
          ],
          classes: 'grid grid-cols-0 md:grid-cols-2 gap-2 pt-5 h-full',
        )
      ],
      classes: 'h-screen w-screen p-5 overflow-scroll',
    );
  }
}
