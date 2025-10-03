import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_cases/zeta_interview/presentation/cubit/get_recent_transaction_cubit.dart';
import 'package:flutter_test_cases/zeta_interview/presentation/cubit/get_recent_transaction_state.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:get_it/get_it.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ValueNotifier<bool> isCardTapped = ValueNotifier(false);
  final ScrollController _scrollController = ScrollController();
  bool _isLoadingMore = false;
  @override
  void initState() {
    super.initState();

    context.read<GetRecentTransactionCubit>().getRecentTransaction(results: 10);

    // listen for scroll to bottom -> trigger loadMore

    _scrollController.addListener(() {
      if (!_isLoadingMore &&
          _scrollController.position.pixels >=
              _scrollController.position.maxScrollExtent - 100) {
        _isLoadingMore = true;
        context.read<GetRecentTransactionCubit>().loadMore(results: 10).then((
          _,
        ) {
          _isLoadingMore = false;
        });
      }
    });
  }

  @override
  void dispose() {
    isCardTapped.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ValueListenableBuilder<bool>(
          valueListenable: isCardTapped,
          builder: (context, tapped, _) {
            return Column(
              children: [
                _CardBox(isCardTapped: isCardTapped),

                // Smooth expand/collapse + fade for transaction details
                Expanded(
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 500),
                    transitionBuilder: (child, animation) {
                      return SizeTransition(
                        sizeFactor: animation,
                        child: FadeTransition(opacity: animation, child: child),
                      );
                    },
                    child: tapped
                        ? const SizedBox.shrink()
                        : _TransactionDetails(
                            key: const ValueKey('transaction'),
                            scrollController: _scrollController,
                          ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class _CardBox extends StatelessWidget {
  final ValueNotifier<bool> isCardTapped;
  const _CardBox({required this.isCardTapped});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () => isCardTapped.value = !isCardTapped.value,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
        width: isCardTapped.value ? size.width : size.width * 0.6,
        height: isCardTapped.value ? size.height * 0.6 : size.height * 0.4,
        margin: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}

class _TransactionDetails extends StatelessWidget {
  final ScrollController scrollController;
  const _TransactionDetails({required this.scrollController, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetRecentTransactionCubit, GetRecentTransactionState>(
      builder: (context, state) {
        if (state.isLoading && state.data.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state.data.isEmpty) {
          return const Center(child: Text("No transactions found"));
        }

        return ListView.builder(
          physics: AlwaysScrollableScrollPhysics(),
          controller: scrollController,
          itemCount: state.data.length + (state.isLoadingMore ? 1 : 0),
          itemBuilder: (context, index) {
            if (index >= state.data.length) {
              // loader for pagination
              return const Padding(
                padding: EdgeInsets.all(16.0),
                child: Center(child: CircularProgressIndicator()),
              );
            }

            final result = state.data[index];
            return ListTile(
              leading: CircleAvatar(
                backgroundImage: CachedNetworkImageProvider(
                  result.picture.thumbnail,
                ),
              ),
              title: Text("${result.name.first} ${result.name.last}"),
              subtitle: Text(result.email),
              trailing: Text(result.phone),
            );
          },
        );
      },
    );
  }
}
