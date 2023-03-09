
import 'package:flutter/material.dart';
import 'package:mofa/theme/theme.dart';

class WalletCard extends StatefulWidget {

  const WalletCard({super.key, required this.title, required this.balance, required this.bgColor});

  final String title;
  final String balance;
  final Color bgColor;

  @override
  State<StatefulWidget> createState() => _WalletCardState();
  
}

class _WalletCardState extends State<WalletCard> {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 234,
      margin: const EdgeInsets.fromLTRB(16, 16, 16, 0),
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(18))
      ),
      child: Container(
        color: widget.bgColor,
        padding: EdgeInsets.all(26),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.title, style: TextStyle(fontSize: 24, color: Colors.white)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                circleMark(),
                Text(widget.balance, style: TextStyle(fontSize: 40, color: Colors.white))
              ],
            )
          ],
        ),
      ),
    );
  }

Widget circleMark() {
    return SizedBox(
      height: 50,
      width: 50,
      child: Stack(
        children: [
          Positioned(
            top: 10,
            left: 15,
            width: 30,
            height: 30,
            child: Container(
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15)
              ),
              child: ColoredBox(color: AppTheme.white.withAlpha(127)),
            ),
          ),
          Positioned(
            width: 30,
            height: 30,
            child: Container(
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15)
              ),
              child: ColoredBox(color: AppTheme.white.withAlpha(127)),
            ),
          )
        ],
      ),
    );
  }

}