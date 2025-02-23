import 'package:montra/themes/color.dart';
import 'package:montra/themes/font.dart';

MontraTheme theme = Classic();

abstract class MontraTheme {
  final MontraColor color;
  final MontraFont font;

  const MontraTheme({
    required this.color,
    required this.font,
  });
}

class Classic extends MontraTheme {
  Classic() : super(color: ClassicColor(), font: ClassicFont());
}
