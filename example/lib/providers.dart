// ignore_for_file: constant_identifier_names

import 'package:jaspr_riverpod/jaspr_riverpod.dart';

final inputProvider = StateProvider<String>((ref) {
  return DEFAULT_INPUT;
});

final outputProvider = StateProvider<String>((ref) {
  return '';
});

const DEFAULT_INPUT = '<div><h1>Hello, World!</h1></div>';

const EXAMPLE_1 = """
<div class="bg-white">
  <div class="px-6 py-24 sm:px-6 sm:py-32 lg:px-8">
    <div class="mx-auto max-w-2xl text-center">
      <h2 class="text-3xl font-bold tracking-tight text-gray-900 sm:text-4xl">Boost your productivity.<br>Start using our app today.</h2>
      <p class="mx-auto mt-6 max-w-xl text-lg leading-8 text-gray-600">Incididunt sint fugiat pariatur cupidatat consectetur sit cillum anim id veniam aliqua proident excepteur commodo do ea.</p>
      <div class="mt-10 flex items-center justify-center gap-x-6">
        <a href="#" class="rounded-md bg-indigo-600 px-3.5 py-2.5 text-sm font-semibold text-white shadow-sm hover:bg-indigo-500 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600">Get started</a>
        <a href="#" class="text-sm font-semibold leading-6 text-gray-900">Learn more <span aria-hidden="true">→</span></a>
      </div>
    </div>
  </div>
</div>
""";

const EXAMPLE_2 = """
<div class="bg-white px-6 py-24 sm:py-32 lg:px-8">
  <div class="mx-auto max-w-2xl text-center">
    <h2 class="text-4xl font-bold tracking-tight text-gray-900 sm:text-6xl">Support center</h2>
    <p class="mt-6 text-lg leading-8 text-gray-600">Anim aute id magna aliqua ad ad non deserunt sunt. Qui irure qui lorem cupidatat commodo. Elit sunt amet fugiat veniam occaecat fugiat aliqua.</p>
  </div>
</div>
""";

const EXAMPLE_3 = """
<div class="bg-white py-16 sm:py-24 lg:py-32">
  <div class="mx-auto grid max-w-7xl grid-cols-1 gap-10 px-6 lg:grid-cols-12 lg:gap-8 lg:px-8">
    <div class="max-w-xl text-3xl font-bold tracking-tight text-gray-900 sm:text-4xl lg:col-span-7">
      <h2 class="inline sm:block lg:inline xl:block">Want product news and updates?</h2>
      <p class="inline sm:block lg:inline xl:block">Sign up for our newsletter.</p>
    </div>
    <form class="w-full max-w-md lg:col-span-5 lg:pt-2">
      <div class="flex gap-x-4">
        <label for="email-address" class="sr-only">Email address</label>
        <input id="email-address" name="email" type="email" autocomplete="email" required class="min-w-0 flex-auto rounded-md border-0 px-3.5 py-2 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6" placeholder="Enter your email">
        <button type="submit" class="flex-none rounded-md bg-indigo-600 px-3.5 py-2.5 text-sm font-semibold text-white shadow-sm hover:bg-indigo-500 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600">Subscribe</button>
      </div>
      <p class="mt-4 text-sm leading-6 text-gray-900">We care about your data. Read our <a href="#" class="font-semibold text-indigo-600 hover:text-indigo-500">privacy&nbsp;policy</a>.</p>
    </form>
  </div>
</div>
""";
