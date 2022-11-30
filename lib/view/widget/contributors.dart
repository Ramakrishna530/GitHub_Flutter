import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/http/api_response.dart';
import '../../provider/contributor.dart';
import '../../provider/contributors_provider.dart';
import 'app_error_widget.dart';
import 'contributor_item_widget.dart';
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
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ContributorsProvider>().getContributorsDetail(
            repositoryFullName: widget.repositoryFullName,
          );
    });
  }

  CarouselSlider _createCarouselSlider({
    required List<Contributor> contributors,
  }) =>
      CarouselSlider(
        options: CarouselOptions(
          autoPlay: true,
          enlargeCenterPage: true,
          pageSnapping: true,
          onPageChanged: (position, reason) {},
          enableInfiniteScroll: true,
        ),
        items: contributors
            .map<Widget>(
              (contributor) => Builder(
                builder: (BuildContext context) => ContributorItem(
                    id: contributor.id,
                    name: contributor.name ?? "${contributor.id}",
                    avatarUrl: contributor.avatarUrl,
                    contributionsCount: contributor.contributionsCount,
                    followers: contributor.followers),
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
