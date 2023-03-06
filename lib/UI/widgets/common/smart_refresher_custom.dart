// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class SmartRefresherCustom extends StatefulWidget {
  const SmartRefresherCustom({
    super.key,
    required this.child,
    this.onRefresh,
    this.onLoading,
    required this.refreshController,
    this.enablePullDown,
    this.enablePullUp,
  });

  final Widget child;
  final Function()? onRefresh;
  final Function()? onLoading;
  final RefreshController refreshController;
  final bool? enablePullDown, enablePullUp;

  @override
  State<SmartRefresherCustom> createState() => _SmartRefresherCustomState();
}

class _SmartRefresherCustomState extends State<SmartRefresherCustom> {
  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
      enablePullDown: widget.enablePullDown ?? false,
      enablePullUp: widget.enablePullUp ?? false,
      header: WaterDropHeader(),
      controller: widget.refreshController,
      onRefresh: widget.onRefresh,
      onLoading: widget.onLoading,
      footer: CustomFooter(
        loadStyle: LoadStyle.ShowWhenLoading,
        builder: (context, mode) {
          Widget body = Text('No more Data');
          if (mode == LoadStatus.idle) {
            body = CupertinoActivityIndicator();
          }
          if (mode == LoadStatus.loading) {
            body = CupertinoActivityIndicator();
          }
          if (mode == LoadStatus.failed) {
            body = Text('Load Failed!Click retry!');
          }
          if (mode == LoadStatus.canLoading) {
            body = Text('Release to load more');
          }

          return SizedBox(
            height: 55.0,
            child: Center(child: body),
          );
        },
      ),
      child: widget.child,
    );
  }
}
