import 'package:anora/core/core.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

@RoutePage()
class PaywallPage extends StatefulWidget {
  const PaywallPage({super.key});

  @override
  State<PaywallPage> createState() => _PaywallPageState();
}

class _PaywallPageState extends State<PaywallPage> {
  @override
  Widget build(BuildContext context) {
    final benefits = [
      '5GB+ Storage on Anora Spaces',
      'Unlimited Access for Interactions',
      'Unlimited Knowledge Bases',
      'Offline Access and Data Sync',
      'Priority Support',
    ];
    return AnoraPage(
      //appBar: AppBar(title: const Text('Upgrade Package')),
      child: Column(
        children: [
          54.vGap,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ShadButton.ghost(
                text: const HeroIcon(HeroIcons.xMark),
                onPressed: () {
                  context.router.maybePop();
                },
              ),
              ShadButton.ghost(
                text: const Text('Restore'),
                onPressed: () {},
              ),
            ],
          ),
          14.vGap,
          Text('Anora Premium Benefits 💎', style: context.header),
          Text(
            'Upgrading to Anora AI Premium will allow to unlock amazing benefits and up to 5GB+ of storage in Anora Spaces',
            style: context.desc,
          ),
          14.vGap,
          ...benefits.map(
            (benefit) => Row(
              children: [
                HeroIcon(
                  HeroIcons.checkCircle,
                  color: context.colorScheme.primary,
                ),
                8.hGap,
                Text(benefit, style: context.paragraph),
              ],
            ),
          ),
          24.vGap,
          const PricingPlan(
            title: 'Monthly ✨',
            desc: 'Stander offer, billed every month',
            amount: 'XAF 1,500',
            saved: '0',
          ),
          14.vGap,
          const PricingPlan(
            title: 'Bi-Annually ⚡️',
            desc: 'Save up to 18% on this plan',
            amount: 'XAF 8,000',
            saved: '1',
          ),
          14.vGap,
          const PricingPlan(
            title: 'Annually 🚀',
            desc: 'Save up to 30% on this plan',
            amount: 'XAF 14,500',
            saved: '2',
          ),
          34.vGap,
          Text(
            'We ensure your payment is secure and your data is safe with us. You can cancel your subscription at any time',
            style: context.desc,
          ),
          24.vGap,
          Container(
            width: context.width,
            height: 64,
            decoration: BoxDecoration(
              color: context.colorScheme.primary,
              borderRadius: BorderRadius.circular(18),
            ),
            child: Center(
              child: Text('Upgrade To Premium', style: context.title),
            ),
          ),
        ],
      ),
    );
  }
}

final savedListener = ValueNotifier<String>('1');

class PricingPlan extends StatelessWidget {
  const PricingPlan({
    required this.title,
    required this.desc,
    required this.amount,
    required this.saved,
    super.key,
  });
  final String title;
  final String desc;
  final String amount;
  final String saved;
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: savedListener,
      builder: (context, index, child) {
        return GestureDetector(
          onTap: () {
            savedListener.value = saved;
          },
          child: Container(
            width: context.width,
            height: 88,
            decoration: BoxDecoration(
              color: index == saved
                  ? context.colorScheme.primary
                  : context.colorScheme.secondary,
              borderRadius: BorderRadius.circular(18),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: context.head),
                    Text(
                      desc,
                      style: context.desc,
                    ),
                  ],
                ),
                Text(amount, style: context.title),
              ],
            ).hPadding.vPadding,
          ),
        );
      },
    );
  }
}
