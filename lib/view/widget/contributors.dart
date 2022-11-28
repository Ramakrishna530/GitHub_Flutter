import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/http/api_response.dart';
import '../../provider/contributor.dart';
import '../../provider/contributors_provider.dart';
import 'app_error_widget.dart';
import 'loading_widget.dart';

class ContributorsWidget extends StatefulWidget {
  const ContributorsWidget({required this.repositoryFullName, super.key});
  final String repositoryFullName;

  @override
  State<ContributorsWidget> createState() => _ContributorsWidgetState();
}

class _ContributorsWidgetState extends State<ContributorsWidget> {
  @override
  void initState() {
    // TODO: implement initState
    Future.delayed(
      const Duration(seconds: 1),
      () {
        context.read<ContributorsProvider>().getContributorsDetail(repositoryFullName: widget.repositoryFullName);
      },
    );
    super.initState();
  }

  CarouselSlider _createCarouselSlider({
    required List<Contributor> contributors,
  }) =>
      CarouselSlider(
        options: CarouselOptions(
          autoPlay: false,
          enlargeCenterPage: true,
          pageSnapping: true,
          onPageChanged: (position, reason) {
            print(reason);
            print(CarouselPageChangedReason.controller);
          },
          enableInfiniteScroll: true,
        ),
        items: contributors
            .map<Widget>(
              (contributor) => Builder(
                builder: (BuildContext context) => Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.purple),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10),
                    ),
                    image: DecorationImage(
                      image: NetworkImage(contributor.avatarUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            )
            .toList(),
      );

  @override
  Widget build(BuildContext context) {
    final contributorProvider = context.watch<ContributorsProvider>();
    switch (contributorProvider.contributors.status) {
      case ApiStatus.loading:
        return const LoadingWidget();
      case ApiStatus.error:
        return AppErrorWidget(contributorProvider.contributors.message!);
      case ApiStatus.completed:
        return _createCarouselSlider(contributors: contributorProvider.contributors.data!);
    }
  }
}
