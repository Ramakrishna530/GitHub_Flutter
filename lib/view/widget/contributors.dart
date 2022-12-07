import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import '../../core/http/api_response.dart';
import '../../models/contributors/contributor.dart';
import '../../state/actions.dart';
import '../../state/app_state.dart';
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
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      StoreProvider.of<AppState>(context).dispatch(
        GetContributorsLoadingAction(repositoryFullName: widget.repositoryFullName),
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
  Widget build(BuildContext context) => StoreConnector<AppState, ApiResponse<List<Contributor>>>(
      converter: (Store<AppState> store) => store.state.contributorsState,
      builder: (_, contributorsState) {
        switch (contributorsState.status) {
          case ApiStatus.loading:
            return LoadingWidget(message: contributorsState.message!);
          case ApiStatus.error:
            return AppErrorWidget(message: contributorsState.message!);
          case ApiStatus.completed:
            return _createCarouselSlider(contributors: contributorsState.data!);
        }
      });
}
