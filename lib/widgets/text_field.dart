import 'package:flutter/material.dart';
import 'package:test_task/utils/size_config.dart';


class AppTextField extends StatelessWidget {
  final TextEditingController? controller;
  final Function(String)? onChanged;
  const AppTextField({super.key, this.controller, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return PrimaryContainer(
      radius: 10,
      child: TextFormField(
        onChanged: onChanged,
        style: const TextStyle(fontSize: 12, color: Colors.black),
        controller: controller??TextEditingController(),
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(left: 20, right: 20, bottom: 3),
          hintText: 'Search',
          hintStyle: const TextStyle(fontSize: 14, color: Colors.grey),
          prefixIcon: const Icon(Icons.search, color: Colors.black),

          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: const BorderSide(color: Colors.black, width: 1.5),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: const BorderSide(color: Colors.black, width: 1.5),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: const BorderSide(color: Colors.black, width: 1.5),
          ),
        ),
      ),
    );
  }
}

class PrimaryContainer extends StatelessWidget {
  final Widget child;
  final double? radius;
  const PrimaryContainer({super.key, this.radius, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.heightMultiplier * 4.5,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius ?? 5),
      ),
      child: child,
    );
  }
}
