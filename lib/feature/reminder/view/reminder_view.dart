import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:medication_reminder_app/core/extension/context_extension.dart';
import 'package:medication_reminder_app/core/init/app/constants/language_constants.dart';
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
  const ReminderView({Key? key, required this.selectDate}) : super(key: key);
  final DateTime selectDate;
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
          title: LocaleKeys.reminder_addreminder.tr(),
          subtitle: context
              .watch<ReminderViewModel>()
              .subtitle(context.locale.toString(), selectDate),
          preferredSize: 0.03,
        ),
        body: Column(
          children: [
            Expanded(flex: 1, child: _buildImage(context)),
            Expanded(
              flex: 2,
              child: Container(
                height: context.h,
                decoration: BoxDecoration(
                    color: AppThemeLight.instance.colorSchemeLight?.washMe
                        .withOpacity(0.5),
                    borderRadius:
                        const BorderRadius.vertical(top: Radius.circular(30))),
                child: Padding(
                  padding: context.paddingHorizontal(0.02),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        context.emptySizedHeightBox(0.1),
                        Row(
                          children: [
                            Expanded(flex: 4, child: _nameTextField(viewModel)),
                            const Spacer(),
                            Expanded(
                                flex: 2, child: _amountTextField(viewModel)),
                          ],
                        ),
                        context.emptySizedHeightBox(0.05),
                        Row(
                          children: [
                            Expanded(
                                flex: 4, child: _repeatTextField(viewModel)),
                            const Spacer(),
                            Expanded(
                                flex: 2,
                                child: _timeButton(context, viewModel)),
                          ],
                        ),
                        context.emptySizedHeightBox(0.05),
                        _imageButtonList(context, viewModel),
                        context.emptySizedHeightBox(0.1),
                        _addReminderButton(viewModel, context),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImage(BuildContext context) {
    return Image.asset(
      'medicine'.toPng,
      height: context.isKeyboradOpen ? 0 : context.height(0.1),
      width: context.width(0.4),
    );
  }

  ITextField _nameTextField(ReminderViewModel viewModel) {
    return ITextField(
      title: '${LocaleKeys.reminder_medicinename.tr()}*',
      hint: LocaleKeys.reminder_medicine.tr(),
      controller: viewModel.nameController,
    );
  }

  ITextField _amountTextField(ReminderViewModel viewModel) {
    return ITextField(
      title: LocaleKeys.reminder_amount.tr(),
      hint: LocaleKeys.reminder_mg_ml.tr(),
      controller: viewModel.amountController,
      icon: Icons.category_rounded,
    );
  }

  ITextField _repeatTextField(ReminderViewModel viewModel) {
    return ITextField(
      title: '${LocaleKeys.reminder_repeat.tr()}*',
      hint: LocaleKeys.reminder_day.tr(),
      keyboardType: TextInputType.number,
      controller: viewModel.repeatController,
    );
  }

  Widget _timeButton(BuildContext context, ReminderViewModel viewModel) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          LocaleKeys.reminder_time.tr(),
          style: context.textTheme.labelLarge!
              .copyWith(fontWeight: FontWeight.w600, color: Colors.black54),
        ),
        context.emptySizedHeightBox(0.01),
        OutlinedButton(
            onPressed: () {
              context
                  .read<ReminderViewModel>()
                  .getTimeUser(context, _showTimePicker(context, viewModel));
            },
            child: Icon(
              Icons.timer_sharp,
              size: 36,
              color: AppThemeLight.instance.colorSchemeLight?.ultraRed,
            )),
      ],
    );
  }

  _showTimePicker(BuildContext context, ReminderViewModel viewModel) {
    return showTimePicker(
        initialEntryMode: TimePickerEntryMode.dial,
        builder: (_, child) {
          return MediaQuery(
              data: MediaQuery.of(context).copyWith(
                  alwaysUse24HourFormat:
                      LanguageConstants.instance.trLocale.toString() ==
                              context.locale.toString()
                          ? true
                          : false),
              child: child!);
        },
        context: context,
        initialTime: TimeOfDay(
            hour: int.parse(viewModel.startTime.split(":")[0]),
            minute: int.parse(viewModel.startTime.split(":")[1].split('')[0])));
  }

  Column _imageButtonList(BuildContext context, ReminderViewModel viewModel) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('${LocaleKeys.reminder_type.tr()}*',
            style: Theme.of(context)
                .textTheme
                .labelLarge!
                .copyWith(fontWeight: FontWeight.w600, color: Colors.black54)),
        Padding(
          padding: context.paddingTop(0.02),
          child: SizedBox(
            height: context.height(0.12),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: PillEnum.pillNames.length,
              itemBuilder: (_, int index) {
                context.watch<ReminderViewModel>().selectImage;
                return Padding(
                  padding: context.paddingRight(0.01),
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
      child: Image.asset(
        PillEnum.pillNames[index].toPng,
        width: context.width(0.17),
        fit: BoxFit.scaleDown,
      ),
    );
  }

  Widget _addReminderButton(ReminderViewModel viewModel, BuildContext context) {
    return MyElevatedButton(
        onPressed: () {
          if (viewModel.nameController!.text.isNotEmpty &&
              viewModel.selectedImage.isNotEmpty &&
              viewModel.repeatController!.text.isNotEmpty) {
            int? repeatDay = int.parse(viewModel.repeatController!.text);

            if (repeatDay >= 0) {
              for (var i = 0; i < repeatDay; i++) {
                var reminder = PillModel.create(
                  title: viewModel.nameController!.text,
                  amount: viewModel.amountController!.text,
                  pillImage:
                      Provider.of<ReminderViewModel>(context, listen: false)
                          .selectedImage,
                  time: Provider.of<ReminderViewModel>(context, listen: false)
                      .startTime,
                  date: Provider.of<HomeViewModel>(context, listen: false)
                      .selectDate
                      .add(Duration(days: i)),
                );

                context
                    .read<ReminderViewModel>()
                    .addReminder(reminder, context);

                viewModel.scheduleNotification(
                    dateFormat:
                        LanguageConstants.instance.trLocale == context.locale
                            ? 'HH:mm'
                            : 'HH:mm a',
                    item: reminder);
              }
            }

            Navigator.pop(context);
          } else {
            final snackBar = SnackBar(
              content: const Text('Error!'),
              action: SnackBarAction(
                label: 'Lütfen, zorunlu alanları doldurun! (*)',
                onPressed: () {},
              ),
            );

            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }
        },
        child: Padding(
          padding: context.paddingVertical(0.025),
          child: Center(child: Text(LocaleKeys.reminder_addreminder.tr())),
        ));
  }
}
