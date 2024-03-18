import 'package:jaspr/jaspr.dart';
import 'package:jaspr_riverpod/jaspr_riverpod.dart';

import 'package:jaspr_html_convert_app/providers.dart';

// ==========================================
// CLASS: ConverterOptions
// ==========================================

class ConverterOptions extends StatefulComponent {
  const ConverterOptions({
    super.key,
  });

  @override
  ConverterOptionsState createState() => ConverterOptionsState();
}

class ConverterOptionsState extends State<ConverterOptions> {
  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield label(
      [
        text('Converter Options:'),
      ],
      classes: [
        'block',
        'text-md',
        'font-bold',
        'leading-6',
        'text-gray-900',
        'pb-3',
      ].join(' '),
      htmlFor: 'input-area',
    );
    yield BoolConvertorOption();
  }
}

// ==========================================
// CLASS: BoolConvertorOption
// ==========================================

class BoolConvertorOption extends StatefulComponent {
  const BoolConvertorOption({
    super.key,
  });

  @override
  BoolConvertorOptionState createState() => BoolConvertorOptionState();
}

class BoolConvertorOptionState extends State<BoolConvertorOption> {
  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield span(
      [
        span(
          [
            input(
              [],
              classes:
                  'h-4 w-4 rounded border-gray-300 text-indigo-600 focus:ring-indigo-600',
              id: 'select-all',
              name: 'select-all',
              value: context.watch(classAsListProvider).toString(),
              type: InputType.checkbox,
              onChange: (value) {
                context.read(classAsListProvider.notifier).state =
                    value as bool;
              },
            ),
          ],
          classes:
              'inline-flex items-center rounded-l-md border border-gray-300 bg-white px-2 py-2',
        ),
        p(
          [
            text('Classes as List'),
          ],
          classes:
              '-ml-px block w-full rounded-l-none rounded-r-md border-0 bg-white py-1.5 pl-3 pr-3 text-gray-900 ring-1 ring-inset ring-gray-300 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6',
        ),
      ],
      classes: 'inline-flex rounded-md shadow-sm',
    );
  }
}
