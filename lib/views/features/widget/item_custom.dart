import 'package:apps_kulineran/views/globals/theme.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class Item_Content extends StatelessWidget {
  final String name;
  final String price;
  final String imgUrl;

  const Item_Content({
    super.key,
    required this.name,
    required this.price,
    required this.imgUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 20,
        left: 10,
        right: 10,
      ),
      child: Container(
        height: 353,
        width: 156,
        decoration: BoxDecoration(
          color: white,
          shape: BoxShape.rectangle,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(200),
            topRight: Radius.circular(200),
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 160,
                width: 160,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: primaryColor,
                ),
                child: Image.network(
                  imgUrl,
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                  loadingBuilder: (BuildContext context, Widget child,
                      ImageChunkEvent? loadingProgress) {
                    if (loadingProgress == null) {
                      return child;
                    }
                    return Center(
                      child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded /
                                loadingProgress.expectedTotalBytes!
                            : null,
                      ),
                    );
                  },
                  errorBuilder: (BuildContext context, Object exception,
                      StackTrace? stackTrace) {
                    return Text('Failed to load image');
                  },
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              // jarak dari lokasi
              Row(
                children: [
                  const Spacer(),
                  Text(
                    '1.2 km',
                    style: greenTextStyle.copyWith(
                      fontSize: 12,
                      fontWeight: semiBold,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                name,
                style: blackTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: bold,
                ),
              ),
              const SizedBox(
                height: 19,
              ),
              Text(
                price,
                style: greenTextStyle.copyWith(
                  fontSize: 17,
                  fontWeight: bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
