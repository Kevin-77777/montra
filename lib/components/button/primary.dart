import 'package:flutter/material.dart';
import 'package:montra/themes/theme.dart';

class MontraButton extends StatefulWidget {
  final double? width;
  final double? height;
  final Color backgroundColor;
  final String? text;
  final Color? textColor;
  final Widget? icon;
  final Function()? onPressed;

  const MontraButton({
    super.key,
    this.width,
    this.height,
    this.text,
    required this.backgroundColor,
    this.textColor,
    this.onPressed,
    this.icon,
  });

  MontraButton.primary({
    super.key,
    this.width,
    this.height,
    this.text,
    this.onPressed,
    this.icon,
  })  : backgroundColor = theme.color.violet100,
        textColor = theme.color.light80;

  MontraButton.secondary({
    super.key,
    this.width,
    this.height,
    this.text,
    this.onPressed,
    this.icon,
  })  : backgroundColor = theme.color.violet20,
        textColor = theme.color.violet100;

  @override
  State<MontraButton> createState() => _MontraButtonState();
}

class _MontraButtonState extends State<MontraButton> {
  Widget? get content {
    List<Widget> children = [];
    if (widget.icon != null) {
      children.add(widget.icon!);
      children.add(
        const SizedBox(width: 16),
      );
    }

    if (widget.text != null) {
      children.add(
        Text(
          widget.text!,
          style: theme.font.title3.copyWith(color: widget.textColor),
        ),
      );
    }

    if (children.isEmpty) {
      return null;
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: children,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: TextButton(
        onPressed: widget.onPressed,
        style: ButtonStyle(
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          padding: WidgetStateProperty.all(
            const EdgeInsets.symmetric(horizontal: 48, vertical: 16),
          ),
          backgroundColor: WidgetStateProperty.resolveWith<Color?>(
              (Set<WidgetState> states) {
            return widget.backgroundColor;
          }),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16), side: BorderSide.none),
          ),
          splashFactory: NoSplash.splashFactory,
          minimumSize: WidgetStateProperty.all(const Size(164, 56)),
        ),
        child: content ?? const SizedBox.shrink(),
      ),
    );
  }
}
