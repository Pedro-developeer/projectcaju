import 'package:flutter/material.dart';
import 'package:projectcaju/modules/common/views/widgets/tiker_flag.dart';

class CardNews extends StatelessWidget {
  const CardNews({
    super.key,
    required this.title,
    required this.date,
    required this.tickerTitle,
    this.onTap,
  });

  final String title;
  final String date;
  final String tickerTitle;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 100,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            children: [
              ListTile(
                title: Text(
                  title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                trailing: Icon(Icons.arrow_forward_ios, color: Colors.black),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [TickerFlag(title: tickerTitle), Text(date)],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
