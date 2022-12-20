import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_widget_sample/src/bloc/sample_bloc.dart';

class BlocBuilderPage extends StatefulWidget {
  const BlocBuilderPage({super.key});

  @override
  State<BlocBuilderPage> createState() => _BlocBuilderPageState();
}

class _BlocBuilderPageState extends State<BlocBuilderPage> {
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
      body: Center(
        child: BlocBuilder<SampleBloc, int>(
          buildWhen: (previous, current) => current < 5,
          builder: (context, state) {
            return Text(
              state.toString(),
              style: const TextStyle(fontSize: 70),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<SampleBloc>().add(AddSampleEvent());
        },
      ),
    );
  }
}
