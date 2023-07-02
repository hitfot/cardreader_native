import 'package:flutter/material.dart';
import '../../../colors.dart';

Widget studentCard(Map item, bool isActive) {
  return AnimatedContainer(
    margin: const EdgeInsets.only(bottom: 15.0),
    duration: const Duration(milliseconds: 300),
    decoration: BoxDecoration(
      color: isActive
          ? Colors.black
          : Colors.white70,
      borderRadius: BorderRadius.circular(12.0),
    ),
    padding: const EdgeInsets.all(16.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Row(
            children: [
              const Icon(
                Icons.person,
                color: Colors.black,
              ),
              Icon(
                Icons.check,
                color: isActive
                    ? Colors.black
                    : Colors.transparent,
              ),
            ],
          )
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              item["name"],
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 20.0,
                color: Constants.primaryColor,
              ),
            ),
            const SizedBox(
              height: 5.0,
            ),
            Text(
              item["description"],
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 12.0,
                color: Constants.primaryColor,
              ),
            )
          ],
        )
      ],
    ),
  );
}