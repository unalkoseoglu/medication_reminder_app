import 'package:flutter/material.dart';
import 'package:medication_reminder_app/core/extension/num_extension.dart';

import '../../../feature/reminder/model/pill_model.dart';

class CustomCard extends Card {
  CustomCard({
    Key? key,
    required PillModel reminder,
    required void Function()? onLongPress,
    required TextTheme textTheme,
  }) : super(
            key: key,
            child: InkWell(
              onLongPress: onLongPress,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: SizedBox(
                  height: 110.h,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        height: 80.h,
                        child: Image.asset(
                          reminder.pillImage ?? '',
                          height: 60.h,
                          width: 60.h,
                        ),
                      ),
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                reminder.name,
                                style: textTheme.headline6!.copyWith(
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black),
                              ),
                              Text(reminder.amount, style: textTheme.subtitle2),
                              Row(
                                children: [
                                  SizedBox(
                                    height: 25.h,
                                    width: 200.w,
                                    child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      physics: const BouncingScrollPhysics(),
                                      itemCount: 2,
                                      itemBuilder: (_, int index) {
                                        return Padding(
                                          padding: const EdgeInsets.only(
                                            right: 8.0,
                                          ),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              color: Colors.pink[50],
                                            ),
                                            width: 95.w,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Center(
                                                child: Text(
                                                  'Before Breakfast',
                                                  maxLines: 1,
                                                  style: textTheme.subtitle2!
                                                      .copyWith(
                                                          color: Colors.red,
                                                          fontSize: 10),
                                                ),
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      RotatedBox(
                        quarterTurns: -3,
                        child: Text(reminder.alarmTime,
                            style: textTheme.subtitle1!.copyWith(
                                fontWeight: FontWeight.w600,
                                color: Colors.black54)),
                      ),
                    ],
                  ),
                ),
              ),
            ));
}
