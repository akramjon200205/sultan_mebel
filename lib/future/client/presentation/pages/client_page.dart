import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:sultan_mebel/common/app_colors.dart';
import 'package:sultan_mebel/common/app_text_styles.dart';
import 'package:sultan_mebel/common/components/app_bar_widget.dart';
import 'package:sultan_mebel/common/enums/bloc_status.dart';
import 'package:sultan_mebel/common/utills/extensions.dart';
import 'package:sultan_mebel/future/client/presentation/bloc/client_bloc.dart';
import 'package:sultan_mebel/future/client/presentation/widgets/information.dart';
import 'package:sultan_mebel/future/client/presentation/widgets/scheduled_debt.dart';
import 'package:sultan_mebel/future/client/presentation/widgets/summa_accept.dart';
import 'package:sultan_mebel/future/clients_page/presentation/bloc/clients_bloc_bloc.dart';

// ignore: must_be_immutable
class ClientPage extends StatefulWidget {
  String? clientName;
  int? clientId;
  ClientPage({
    Key? key,
    this.clientName,
    this.clientId,
  }) : super(key: key);

  @override
  State<ClientPage> createState() => _ClientPageState();
}

class _ClientPageState extends State<ClientPage> {
  TextEditingController controller = TextEditingController();
  double summa = 100000;

  @override
  void initState() {
    super.initState();
    context.read<ClientBloc>().add(
          ClientEvent(
            widget.clientId,
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: CustomAppBarWidget(
            arrowBackIcon: true,
          ),
        ),
        body: BlocConsumer<ClientBloc, ClientState>(
          listener: (context, state) {
            if (context.read<ClientsBloc>().state.clientsList == BlocStatus.inProgress) {
              context.read<ClientsBloc>().emit(context.read<ClientsBloc>().state);
              const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
          builder: (context, state) {
            if (state.statusGetClient == BlocStatus.inProgress || state.clientPatch == BlocStatus.inProgress) {
              return const Center(
                child: CircularProgressIndicator(
                  color: AppColors.white,
                ),
              );
            }
            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: EdgeInsets.zero.copyWith(bottom: 25, top: 25),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "${state.clientGet?.firstName} ${state.clientGet?.lastName}",
                      style: AppTextStyles.body22w5.copyWith(
                        color: AppColors.white,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    AcceptSummWidgetContainer(textEditingController: controller),
                    const SizedBox(
                      height: 20,
                    ),
                    const ScheduletDebt(),
                    const SizedBox(
                      height: 20,
                    ),
                    const InformationContainer(),
                    const SizedBox(
                      height: 20,
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        "Umumiy qarz: ${state.clientGet?.loan.toString().formatAsNumber()}",
                        style: AppTextStyles.body18w4.copyWith(
                          color: AppColors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
