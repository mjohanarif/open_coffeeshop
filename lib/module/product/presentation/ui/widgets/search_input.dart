import 'package:flutter/material.dart';
import 'package:open_coffeeshop/shared/app_colors.dart';

class SearchInput extends StatelessWidget {
  final TextEditingController controller;
  final Function(String value) onChanged;

  const SearchInput({
    super.key,
    required this.controller,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: TextFormField(
        controller: controller,
        onChanged: onChanged,
        textAlign: TextAlign.justify,
        decoration: InputDecoration(
          hintText: 'Cari di sini',
          prefixIcon: const Icon(
            Icons.search,
            color: AppColors.primary,
          ),
          contentPadding: const EdgeInsets.all(16.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: const BorderSide(color: Colors.grey),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: const BorderSide(color: Colors.grey),
          ),
          suffix: GestureDetector(
            onTap: () {
              controller.text = '';
              onChanged('');
            },
            child: const Icon(
              Icons.close,
              color: AppColors.primary,
            ),
          ),
        ),
      ),
    );
  }
}
