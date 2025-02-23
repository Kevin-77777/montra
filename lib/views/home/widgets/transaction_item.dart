import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:montra/themes/theme.dart';

class TransactionItem extends StatefulWidget {
  final Widget icon;
  final String title;
  final String detail;
  final DateTime time;
  final int cost;

  const TransactionItem({
    super.key,
    required this.icon,
    required this.title,
    required this.detail,
    required this.time,
    required this.cost,
  });

  @override
  State<TransactionItem> createState() => _TransactionItemState();
}

class _TransactionItemState extends State<TransactionItem> {
  Widget get title {
    return Row(
      children: [
        Text(
          widget.title,
          style: theme.font.regular1.copyWith(color: theme.color.dark25),
        ),
        const Spacer(),
        Text(
          "-\$${widget.cost}",
          style: theme.font.body1.copyWith(color: theme.color.red100),
        )
      ],
    );
  }

  Widget get detail {
    return Row(
      children: [
        Text(
          widget.detail,
          style: theme.font.small.copyWith(color: theme.color.light20),
        ),
        const Spacer(),
        Text(
          DateFormat.jm().format(widget.time),
          style: theme.font.small.copyWith(color: theme.color.light20),
        ),
      ],
    );
  }

  Widget get content {
    return Column(
      children: [
        title,
        const SizedBox(height: 12),
        detail,
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: theme.color.light80,
        borderRadius: BorderRadius.circular(24),
      ),
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          widget.icon,
          const SizedBox(width: 8),
          Expanded(child: content),
        ],
      ),
    );
  }
}
