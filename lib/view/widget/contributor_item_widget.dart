import 'package:flutter/material.dart';

class ContributorItem extends StatelessWidget {
  const ContributorItem({
    required this.id,
    required this.name,
    required this.avatarUrl,
    required this.contributionsCount,
    required this.followers,
    super.key,
  });

  final int id;
  final String name;
  final String avatarUrl;
  final int contributionsCount;
  final int followers;

  Text _createTextWidget({required String text}) => Text(
        text,
        style: const TextStyle(
          backgroundColor: Colors.black54,
          color: Colors.white,
          fontSize: 16.0,
          overflow: TextOverflow.ellipsis,
        ),
        maxLines: 1,
      );
  @override
  Widget build(BuildContext context) => Container(
        margin: const EdgeInsets.all(5.0),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(10.0)),
          child: Stack(
            children: <Widget>[
              Image.network(
                avatarUrl,
                fit: BoxFit.cover,
                width: double.infinity,
                errorBuilder: (context, object, stackTrace) => const Image(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/images/img_error.png"),
                ),
              ),
              Positioned(
                bottom: 10.0,
                left: 10.0,
                right: 10.0,
                child: Row(
                  children: [
                    _createTextWidget(text: name),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: _createTextWidget(text: "Contributions - $contributionsCount"),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
}
