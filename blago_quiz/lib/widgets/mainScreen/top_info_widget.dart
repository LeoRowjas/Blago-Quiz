import 'package:flutter/material.dart';

class TopInfoWidget extends StatelessWidget {
  const TopInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Row(
          children: const [
            NicknameWidget(),
            SizedBox(width: 8),
            DiamondsCountWidget(),
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        Container(
          color: Colors.black,
          height: 1,
          width: double.infinity,
        ),
      ],
    );
  }
}

class NicknameWidget extends StatelessWidget {
  const NicknameWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Container(
        height: 22,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(),
        ),
        child: const Padding(
          padding: EdgeInsets.symmetric(vertical: 1, horizontal: 8),
          child: Text("Лёнька Лох"),
        ),
      ),
    );
  }
}

class DiamondsCountWidget extends StatelessWidget {
  const DiamondsCountWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        height: 22,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 8),
          child: Row(
            children: const [
              Text("1000"),
              Icon(
                Icons.diamond_outlined,
                color: Colors.blue,
                size: 15,
              )
            ],
          ),
        ),
      ),
    );
  }
}
