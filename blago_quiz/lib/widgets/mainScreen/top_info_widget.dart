import 'package:blago_quiz/widgets/profile/profile_screen_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TopInfoWidget extends StatelessWidget {
  const TopInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Row(
            children: const [
              NicknameWidget(),
              SizedBox(width: 8),
              DiamondsCountWidget(),
            ],
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Container(
          color: Colors.black,
          height: 1.4,
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
          border: Border.all(width: 1.4),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 8),
          child: Text(User.name),
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
    return ValueListenableBuilder(
      valueListenable: User.balance,
      builder: (context, value, _) {
        return Expanded(
          flex: 1,
          child: Container(
            height: 22,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(width: 1.4),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 8),
              child: Row(
                children: [
                  Text(User.balance.value.toString()),
                  const Icon(
                    Icons.diamond_outlined,
                    color: Colors.blue,
                    size: 15,
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
