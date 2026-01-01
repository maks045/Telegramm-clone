import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:telegramm_app/app/profile/settings/business/widgets/plan_card.dart';
import 'package:telegramm_app/app/profile/settings/business/widgets/telegram_business_container.dart';
import 'package:telegramm_app/core/theme/app_colors.dart';

class TelegramBusinessScreen extends StatefulWidget {
  const TelegramBusinessScreen({super.key});

  @override
  State<TelegramBusinessScreen> createState() => _TelegramBusinessScreenState();
}

class _TelegramBusinessScreenState extends State<TelegramBusinessScreen> {
  String selected = "annual";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
          backgroundColor: AppColors.backgroundcolor,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              ))),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              SizedBox(
                  width: 200, child: Lottie.asset('assets/emoji/money.json')),
              Text(
                'Telgram Business',
                style: TextTheme.of(context).titleLarge,
              ),
              SizedBox(
                height: 12,
              ),
              Text(
                'Turn your account into a business page with these\n additional features.',
                textAlign: TextAlign.center,
              ),
              Text(
                'The benefits of Telegram Business are temporarily\n included with Telgram Premium.',
                textAlign: TextAlign.center,
              ),
              Padding(
                padding: const EdgeInsets.all(14.0),
                child: Column(
                  children: [
                    PlanCard(
                      title: "Annual",
                      discount: "-39%",
                      price: "\$2.41/month  (\$28.99/year)",
                      selected: selected == "annual",
                      onTap: () => setState(() => selected = "annual"),
                    ),
                    PlanCard(
                      title: "Monthly",
                      price: "\$3.99/month",
                      selected: selected == "monthly",
                      onTap: () => setState(() => selected = "monthly"),
                    ),
                  ],
                ),
              ),
              TelegramBusinessContainer(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Check the section later for new business features.',
                  style: TextStyle(color: AppColors.grey),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.purple,
                      borderRadius: BorderRadius.circular(6)),
                  alignment: Alignment.center,
                  child: Text('Subscribe for 28.99 per year'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
