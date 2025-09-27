import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ValueNotifier<bool> isCardTapped = ValueNotifier(false);

  @override
  void dispose() {
    isCardTapped.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ValueListenableBuilder<bool>(
          valueListenable: isCardTapped,
          builder: (context, tapped, _) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  _CardBox(isCardTapped: isCardTapped),

                  // Smooth expand/collapse + fade for transaction details
                  AnimatedSwitcher(
                    duration: const Duration(milliseconds: 500),
                    transitionBuilder: (child, animation) {
                      return SizeTransition(
                        sizeFactor: animation,
                        child: FadeTransition(opacity: animation, child: child),
                      );
                    },
                    child: tapped
                        ? const SizedBox.shrink()
                        : const _TransactionDetails(),
                  ),
                ],
              ),
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
        height: isCardTapped.value ? size.height * 0.4 : size.height * 0.2,
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
  const _TransactionDetails();

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.blueGrey.shade50,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: List.generate(
          5,
          (i) => ListTile(
            leading: const Icon(Icons.shopping_bag),
            title: Text("Transaction ${i + 1}"),
            subtitle: const Text("Some description here"),
            trailing: Text("-\$${(i + 1) * 20}"),
          ),
        ),
      ),
    );
  }
}
