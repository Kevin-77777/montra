import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:montra/states/index.dart';
import 'package:montra/themes/theme.dart';
import 'package:montra/utils/index.dart';
import 'package:montra/views/home/controller.dart';

class TitleCard extends StatefulWidget {
  const TitleCard({super.key});

  @override
  State<TitleCard> createState() => _TitleCardState();
}

class _TitleCardState extends State<TitleCard> {
  HomeController get controller => appState.get<HomeController>();

  Widget get avatar {
    return Container(
      width: 36,
      height: 36,
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: theme.color.violet100, width: 1),
      ),
      child: SvgPicture.asset(
        "assets/images/user.svg",
      ),
    );
  }

  Widget get month {
    return Row(
      children: [
        SvgPicture.asset(
          "assets/images/arrow-down-2.svg",
          colorFilter: ColorFilter.mode(theme.color.violet100, BlendMode.srcIn),
        ),
        const SizedBox(width: 4),
        Text(
          DateFormat.MMMM().format(DateTime.now()),
          style: theme.font.body3.copyWith(color: theme.color.dark50),
        ),
      ],
    );
  }

  Widget get notification {
    return SvgPicture.asset(
      "assets/images/notifiaction.svg",
      width: 32,
      height: 32,
      colorFilter: ColorFilter.mode(theme.color.violet100, BlendMode.srcIn),
    );
  }

  Widget get title {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 64,
      child: Row(
        children: [
          avatar,
          const Spacer(),
          month,
          const Spacer(),
          notification,
        ],
      ),
    );
  }

  Widget get balance {
    return Text(
      Utils.i18n(context, "home.accountBalance"),
      style: theme.font.regular3.copyWith(
        color: theme.color.light20,
        height: null,
      ),
    );
  }

  Widget get balanceValue {
    return Text(
      "\$9400",
      style: theme.font.title2.copyWith(
        color: theme.color.dark75,
        fontSize: 40,
        height: null,
      ),
    );
  }

  Widget get income {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28),
        color: theme.color.green100,
      ),
      margin: EdgeInsets.only(
          left:
              (MediaQuery.of(context).size.width - 164 * 2 - 16 * 2 - 16) / 2),
      padding: const EdgeInsets.all(16),
      width: 164,
      height: 80,
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: theme.color.light80,
            ),
            padding: const EdgeInsets.all(8),
            child: SvgPicture.asset(
              "assets/images/Frame 27.svg",
              colorFilter:
                  ColorFilter.mode(theme.color.green100, BlendMode.srcIn),
            ),
          ),
          const SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                Utils.i18n(context, "home.income"),
                style: theme.font.regular3.copyWith(
                  color: theme.color.light80,
                  height: null,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                "\$5000",
                style: theme.font.title2.copyWith(
                  color: theme.color.light80,
                  fontSize: 22,
                  height: null,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget get expense {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28),
        color: theme.color.red100,
      ),
      padding: const EdgeInsets.all(16),
      width: 164,
      height: 80,
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: theme.color.light80,
            ),
            padding: const EdgeInsets.all(8),
            child: SvgPicture.asset(
              "assets/images/Frame 26.svg",
              colorFilter:
                  ColorFilter.mode(theme.color.red100, BlendMode.srcIn),
            ),
          ),
          const SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                Utils.i18n(context, "home.expenses"),
                style: theme.font.regular3.copyWith(
                  color: theme.color.light80,
                  height: null,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                "\$1200",
                style: theme.font.title2.copyWith(
                  color: theme.color.light80,
                  fontSize: 22,
                  height: null,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget get buttons {
    return Row(
      children: [
        income,
        const SizedBox(width: 16),
        expense,
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 332,
      width: MediaQuery.of(context).size.height,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(32),
          bottomRight: Radius.circular(32),
        ),
        gradient: LinearGradient(
          colors: [
            Color(0xFFFFF6E5),
            Color(0xFFF8EDD8),
          ],
        ),
      ),
      padding: const EdgeInsets.all(16),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            title,
            balance,
            const SizedBox(height: 12),
            balanceValue,
            const SizedBox(height: 28),
            buttons,
          ],
        ),
      ),
    );
  }
}
