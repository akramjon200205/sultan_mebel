import 'package:flutter/material.dart';
import 'package:sultan_mebel/common/app_colors.dart';
import 'package:sultan_mebel/future/history/presentation/widgets/history_custom_widget.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: SizedBox(
          child: ListView.separated(
            shrinkWrap: true,
            padding: EdgeInsets.zero.copyWith(bottom: 25, top: 35),
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return const HistoryCustomWidget();
            },
            separatorBuilder: (context, index) => const SizedBox(
              height: 20,
            ),
            itemCount: 3,
          ),
        ),
      ),
    );
  }
}
