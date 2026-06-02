import 'package:flutter/material.dart';
import 'package:product_catelog_app/main.export.dart';

class NavigationRoot extends HookConsumerWidget {
  const NavigationRoot(this.child, {super.key});
  final Widget child;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final rootPath = context.routeState.uri.pathSegments.first;

    final Map<RPath, _NavDest> destinations = {
      RPaths.products: const _NavDest(icon: LIcons.shoppingBag, text: 'Home'),
      RPaths.favorites: const _NavDest(icon: LIcons.heart, text: 'Favorites'),
      RPaths.config: const _NavDest(icon: LIcons.cog, text: 'Config'),
    };

    final getIndex = destinations.keys.map((e) => e.name).toList().indexOf(rootPath);

    final index = useState(0);

    useEffect(() {
      index.value = getIndex;
      return null;
    }, [rootPath]);

    return Scaffold(
      bottomNavigationBar: NavigationBar(
        selectedIndex: index.value,
        onDestinationSelected: (v) {
          index.value = v;
          destinations.keys.elementAt(v).go(context);
        },

        destinations: [
          for (final dest in destinations.values) NavigationDestination(icon: Icon(dest.icon), label: dest.text),
        ],
      ),

      body: child,
    );
  }
}

class _NavDest {
  const _NavDest({required this.text, required this.icon});

  final String text;
  final IconData icon;
}
