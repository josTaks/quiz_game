import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class WelcomeContent extends StatelessWidget {
  final Function bouton;

  const WelcomeContent({
    Key? key,
    required this.bouton,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/quiz-logo.png',
            height: 220,
            color: const Color.fromARGB(132, 255, 255, 255),
          ),
          const Gap(16 * 4),
          const Text(
            'Bienvenue Sur mon Quiz',
            style: TextStyle(
              color: Colors.white,
              fontSize: 25,
            ),
          ),
          const Gap(16 * 2),
          OutlinedButton(
            onPressed: (){
              bouton();
            },
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
              side: const BorderSide(
                color: Colors.blue,
                width: 1.5,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 16,
                horizontal: 16 * 2,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Text('COMMENCER'),
                  Gap(16),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 15,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
