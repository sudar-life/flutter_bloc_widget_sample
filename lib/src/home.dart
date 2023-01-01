import 'package:flutter/material.dart';
import 'package:flutter_bloc_widget_sample/src/pages/bloc_builder_page.dart';
import 'package:flutter_bloc_widget_sample/src/pages/bloc_consumer_page.dart';
import 'package:flutter_bloc_widget_sample/src/pages/bloc_listener_page.dart';
import 'package:flutter_bloc_widget_sample/src/pages/multi_repository_provider_page.dart';
import 'package:flutter_bloc_widget_sample/src/pages/bloc_provider_page.dart';
import 'package:flutter_bloc_widget_sample/src/pages/bloc_selector_page.dart';
import 'package:flutter_bloc_widget_sample/src/pages/multi_bloc_provider_page.dart';
import 'package:flutter_bloc_widget_sample/src/pages/repository_provider_page.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const BlocProviderPage()),
              );
            },
            child: const Text('BlocProvider'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => const MultiBlocProviderPage()),
              );
            },
            child: const Text('MultiBlocProvider'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const BlocBuilderPage()),
              );
            },
            child: const Text('BlocBuilder'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => const RepositoryProviderPage()),
              );
            },
            child: const Text('RepositoryProvider'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => const MultiRepositoryProviderPage()),
              );
            },
            child: const Text('MultiRepositoryProvider'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const BlocSelectorPage()),
              );
            },
            child: const Text('BlocSelector'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const BlocListenerPage()),
              );
            },
            child: const Text('BlocListener'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const BlocConsumerPage()),
              );
            },
            child: const Text('BlocConsumer'),
          ),
        ]),
      ),
    );
  }
}
