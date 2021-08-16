import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qrreader/src/core/helpers/acp_url_launcher.dart';
import 'package:qrreader/src/core/providers/scan_provider.dart';

class ACPListBuilder extends StatelessWidget {
  final String type;
  const ACPListBuilder(this.type);

  @override
  Widget build(BuildContext context) {
    final scanProvider = Provider.of<ScanProvider>(context);

    // To avoid a infinite loop, when the notifylistener on provider is fired draw al build method of subscribed widgets
    if (scanProvider.scans.isNotEmpty && scanProvider.scans.first.type != type)
      scanProvider.loadScansByType(type);

    final scans = scanProvider.scans;

    return ListView.builder(
        itemCount: scans.length,
        itemBuilder: (context, index) {
          final item = scans[index];

          return Dismissible(
            key: UniqueKey(),
            onDismissed: (direction) {
              scanProvider.deleteScanById(item.id!);
            },
            child: ListTile(
              leading: Icon(
                this.type == 'geo' ? Icons.map : Icons.home_outlined,
                color: Theme.of(context).primaryColor,
              ),
              title: Text(item.value),
              subtitle: Text(item.id.toString()),
              trailing: Icon(
                Icons.keyboard_arrow_right,
                color: Colors.grey,
              ),
              onTap: () => launchURL(context, item),
            ),
          );
        });
  }
}
