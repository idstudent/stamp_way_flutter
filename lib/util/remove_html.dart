import 'package:html/parser.dart' as html_parser;

String removeHtmlTags(String? htmlString) {
  if (htmlString == null || htmlString.isEmpty) return '';

  final document = html_parser.parse(htmlString);
  return document.body?.text ?? htmlString;
}