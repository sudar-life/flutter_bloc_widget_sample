import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_widget_sample/src/bloc/sample_bloc.dart';
import 'package:flutter_bloc_widget_sample/src/bloc/sample_second_bloc.dart';

class MultiBlocProviderPage extends StatefulWidget {
  const MultiBlocProviderPage({super.key});

  @override
  State<MultiBlocProviderPage> createState() => _MultiBlocProviderPageState();
}

class _MultiBlocProviderPageState extends State<MultiBlocProviderPage> {
  @override
  Widget build(BuildContext context) {
    // return BlocProvider(
    //   create: (context) => SampleBloc(),
    //   child: BlocProvider(
    //     create: (context) => SampleSecondsBloc(),
    //     child: SamplePage(),
    //   ),
    // );
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: ((context) => SampleBloc())),
        BlocProvider(create: ((context) => SampleSecondsBloc())),
      ],
      child: SamplePage(),
    );
  }
}

class SamplePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Center(
              child: Text('Bloc Provider Sample'),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () {
                      context.read<SampleBloc>().add(SampleEvent());
                    },
                    child: Text('+')),
                const SizedBox(width: 15),
                ElevatedButton(
                    onPressed: () {
                      context
                          .read<SampleSecondsBloc>()
                          .add(SampleSecondsEvent());
                    },
                    child: Text('-')),
              ],
            )
          ],
        ),
      ),
    );
  }
}
