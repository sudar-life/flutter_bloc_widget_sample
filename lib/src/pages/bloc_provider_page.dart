import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_widget_sample/src/bloc/sample_bloc.dart';

class BlocProviderPage extends StatefulWidget {
  const BlocProviderPage({super.key});

  @override
  State<BlocProviderPage> createState() => _BlocProviderPageState();
}

class _BlocProviderPageState extends State<BlocProviderPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SampleBloc(),
      lazy: false,
      child: SamplePage(),
    );
  }
}

class SamplePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Text('Bloc Provider Sample'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<SampleBloc>().add(SampleEvent());
        },
      ),
    );
  }
}
