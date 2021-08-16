import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qrreader/src/core/providers/scan_provider.dart';
import 'package:qrreader/src/core/widgets/acp_list_builder.dart';

class MapsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ACPListBuilder('geo');
  }
}
