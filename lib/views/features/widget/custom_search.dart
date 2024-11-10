import 'package:apps_kulineran/views/globals/theme.dart';
import 'package:flutter/material.dart';

class Search extends StatelessWidget {
  final String title;
  final TextEditingController? controller;
  final bool isShowTitle;
  final TextInputType? keyboardType;

  const Search ({
    super.key,
    required this.title,
    this.controller,
    this.isShowTitle = true,
    this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (isShowTitle)
          Text(
            title,
            style: greenTextStyle.copyWith(
              fontSize: 16,
              fontWeight: bold,
            ),
          ),
        if (isShowTitle)
          const SizedBox(
            height: 2,
          ),
        TextFormField(
          obscureText: false,
          controller: controller,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            hintText: !isShowTitle ? title : null,
            suffixIcon: toggleSearch(),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(22),
            ),
            contentPadding: const EdgeInsets.all(16),
          ),
        ),
      ],
    );
  }
}

Widget toggleSearch() {
  return GestureDetector(
    onTap: () {},
    child: const Image(
      image: AssetImage('assets/images/img/ic_search.png'),
    ),
  );
}
