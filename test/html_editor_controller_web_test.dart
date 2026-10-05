@TestOn('browser')
library;

import 'dart:convert';
import 'dart:js_interop';

import 'package:flutter_test/flutter_test.dart';
import 'package:html_editor_enhanced/html_editor.dart';
import 'package:web/web.dart' as web;

void main() {
  test('setText sends a JavaScript string with processed HTML', () async {
    final message = web.window.onMessage.firstWhere((event) {
      final data = jsonDecode(event.data.dartify() as String);
      return data['type'] == 'toIframe: setText';
    });
    HtmlEditorController().setText('<p>Hello</p>\n');
    final data = jsonDecode((await message).data.dartify() as String);
    expect(data['text'], '<p>Hello</p>');
  });

  test('getText decodes the JavaScript response and normalizes empty HTML',
      () async {
    final subscription = web.window.onMessage.listen((event) {
      final data = jsonDecode(event.data.dartify() as String);
      if (data['type'] == 'toIframe: getText') {
        web.window.postMessage(
          jsonEncode({'type': 'toDart: getText', 'text': '<p><br></p>'}).toJS,
          '*'.toJS,
        );
      }
    });
    addTearDown(subscription.cancel);
    expect(await HtmlEditorController().getText(), '');
  });

  test('selected HTML is read through the JavaScript message bridge', () async {
    final subscription = web.window.onMessage.listen((event) {
      final data = jsonDecode(event.data.dartify() as String);
      if (data['type'] == 'toIframe: getSelectedTextHtml') {
        web.window.postMessage(
          jsonEncode({
            'type': 'toDart: getSelectedText',
            'text': '<strong>Selected</strong>',
          }).toJS,
          '*'.toJS,
        );
      }
    });
    addTearDown(subscription.cancel);
    expect(await HtmlEditorController().getSelectedTextWeb(withHtmlTags: true),
        '<strong>Selected</strong>');
  });
}
