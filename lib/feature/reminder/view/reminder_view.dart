import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:medication_reminder_app/core/extension/context_extension.dart';
import 'package:medication_reminder_app/product/init/lang/locale_keys.g.dart';
import 'package:medication_reminder_app/product/init/theme/app_theme_light.dart';
import 'package:provider/provider.dart';

import '../../../core/extension/image_extension.dart';
import '../../../core/init/app/base/view/base_view.dart';
import '../../../product/widget/field/custom_text_field.dart';
import '../model/pill_model.dart';

import 'package:medication_reminder_app/feature/home/viewModel/home_view_model.dart';
import 'package:medication_reminder_app/feature/reminder/viewModel/reminder_view_nodel.dart';
import 'package:medication_reminder_app/product/constants/enum/pill_enum.dart';
import 'package:medication_reminder_app/product/widget/appBar/custom_app_bar.dart';
import 'package:medication_reminder_app/product/widget/button/custom_elevated_button.dart';

class ReminderView extends StatelessWidget {
  const ReminderView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<ReminderViewModel>(
      viewModel: ReminderViewModel(),
      onModelReady: (model) {
        model.cacheManager;
      },
      onPageBuilder: (BuildContext context, ReminderViewModel viewModel) =>
          Scaffold(
        appBar: CustomAppBar(
          context,
          isLeading: true,
          title: LocaleKeys.newReminder.tr(),
          subtitle: context
              .watch<ReminderViewModel>()
              .subtitle(context.locale.toString()),
          preferredSize: context.isKeyboradOpen ? 0 : 0.22,
          child: _buildImage(context),
        ),
        body: SafeArea(
          child: Padding(
            padding: context.paddingTop(0.06),
            child: Container(
              height: context.h,
              decoration: BoxDecoration(
                  color: AppThemeLight.instance.colorSchemeLight?.cloudBreak,
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(30))),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      context.emptySizedHeightBox(0.1),
                      _nameTextField(viewModel),
                      context.emptySizedHeightBox(0.1),
                      Row(
                        children: [
                          _amountTextField(viewModel),
                          _timeButton(context, viewModel),
                        ],
                      ),
                      context.emptySizedHeightBox(0.1),
                      _imageButtonList(context, viewModel),
                      context.emptySizedHeightBox(0.1),
                      _addReminderButton(viewModel, context),
                      context.emptySizedHeightBox(0.05),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _addReminderButton(ReminderViewModel viewModel, BuildContext context) {
    return MyElevatedButton(
        onPressed: () {
          if (viewModel.nameController!.text.isNotEmpty &&
              viewModel.selectedImage.isNotEmpty) {
            var reminder = PillModel.create(
              title: viewModel.nameController!.text,
              amount: viewModel.amountController!.text,
              pillImage: Provider.of<ReminderViewModel>(context, listen: false)
                  .selectedImage,
              alarmTime: Provider.of<ReminderViewModel>(context, listen: false)
                  .startTime,
              time:
                  Provider.of<HomeViewModel>(context, listen: false).selectDate,
            );
            context.read<ReminderViewModel>().addReminder(reminder, context);

            Navigator.pop(context);
          } else {
            showAboutDialog(context: context);
          }
        },
        child: Center(child: Text(LocaleKeys.addReminder.tr())));
  }

  Column _imageButtonList(BuildContext context, ReminderViewModel viewModel) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(LocaleKeys.type.tr(),
            style: Theme.of(context)
                .textTheme
                .labelLarge!
                .copyWith(fontWeight: FontWeight.w600, color: Colors.black54)),
        Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: SizedBox(
            height: context.height(0.1),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: PillEnum.pillNames.length,
              itemBuilder: (_, int index) {
                context.watch<ReminderViewModel>().selectImage;
                return Padding(
                  padding: const EdgeInsets.only(
                    right: 10.0,
                  ),
                  child: _imageButton(context, index, viewModel),
                );
              },
            ),
          ),
        ),
      ],
    );
  }

  MyElevatedButton _imageButton(
      BuildContext context, int index, ReminderViewModel viewModel) {
    return MyElevatedButton(
      color: context.watch<ReminderViewModel>().selectedImage ==
              PillEnum.pillNames[index].toPng
          ? AppThemeLight.instance.theme.colorScheme.primary
          : Colors.white,
      onPressed: () {
        context.read<ReminderViewModel>().selectImageChange(
            viewModel.selectedImage = PillEnum.pillNames[index].toPng);
      },
      child: SizedBox(
        width: context.height(0.07),
        child: Image.asset(
          PillEnum.pillNames[index].toPng,
        ),
      ),
    );
  }

  Expanded _timeButton(BuildContext context, ReminderViewModel viewModel) {
    return Expanded(
        child: IconButton(
            onPressed: () {
              context
                  .read<ReminderViewModel>()
                  .getTimeUser(context, _showTimePicker(context, viewModel));
            },
            icon: const Icon(Icons.timer_sharp)));
  }

  _showTimePicker(BuildContext context, ReminderViewModel viewModel) {
    return showTimePicker(
        initialEntryMode: TimePickerEntryMode.dial,
        builder: (_, child) {
          return MediaQuery(
              data: MediaQuery.of(context).copyWith(
                  alwaysUse24HourFormat:
                      'tr_TR' == context.locale.toString() ? true : false),
              child: child!);
        },
        
        context: context,
        initialTime: TimeOfDay(
            hour: int.parse(viewModel.startTime.split(":")[0]),
            minute: int.parse(viewModel.startTime.split(":")[1].split('')[0])));
  }

  Expanded _amountTextField(ReminderViewModel viewModel) {
    return Expanded(
      flex: 2,
      child: ITextField(
        title: LocaleKeys.amount,
        hint: 'mg/ml',
        controller: viewModel.amountController,
        icon: Icons.category_rounded,
      ),
    );
  }

  ITextField _nameTextField(ReminderViewModel viewModel) {
    return ITextField(
      title: LocaleKeys.medicineName,
      hint: 'Paracematol XL2',
      controller: viewModel.nameController,
    );
  }

  Widget _buildImage(BuildContext context) {
    return Image.asset(
      'medicine'.toPng,
      height: context.isKeyboradOpen ? 0 : context.height(0.17),
    );
  }
}
