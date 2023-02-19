import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';

class VersionText extends StatefulWidget {
  const VersionText({
    Key? key,
    this.textColor,
  }) : super(key: key);

  final Color? textColor;

  @override
  State<VersionText> createState() => _VersionTextState();
}

class _VersionTextState extends State<VersionText> {
  String version = '1.0.0';
  String buildNumber = '1';

  @override
  void initState() {
    super.initState();
    getVersion().then(
      (value) => setState(
        () {
          version = value;
        },
      ),
    );

    getBuildNumber().then(
      (value) => setState(
        () {
          buildNumber = value;
        },
      ),
    );
  }

  Future<String> getVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    String version = packageInfo.version;
    return version;
  }

  Future<String> getBuildNumber() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    String buildNumber = packageInfo.buildNumber;
    return buildNumber;
  }

  @override
  Widget build(BuildContext context) {
    print(buildNumber);
    return Text(
      'Version $version (build $buildNumber)',
      style: TextStyle(
        fontSize: 10,
        color: widget.textColor ?? Colors.white,
      ),
    );
  }
}
