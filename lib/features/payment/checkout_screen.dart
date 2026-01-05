import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test/models/cart_item.dart';
import 'package:test/providers/cart_provider.dart';

class CheckoutScreen extends ConsumerWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartItems = ref.watch(cartProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Checkout')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Order Summary', style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: 16),
            ...cartItems.map((item) => ListTile(
                  leading: Image.network(item.product.imageUrl, width: 50, height: 50, fit: BoxFit.cover),
                  title: Text(item.product.name),
                  subtitle: Text('Quantity: ${item.quantity}'),
                  trailing: Text('\$${(item.product.price * item.quantity).toStringAsFixed(2)}'),
                )),
            const Divider(),
            ListTile(
              title: Text('Total', style: Theme.of(context).textTheme.headlineSmall),
              trailing: Text(
                '\$${_calculateTotal(cartItems).toStringAsFixed(2)}',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
            const SizedBox(height: 32),
            Text('Shipping Information', style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: 16),
            const TextField(decoration: InputDecoration(labelText: 'Full Name', border: OutlineInputBorder())),
            const SizedBox(height: 16),
            const TextField(decoration: InputDecoration(labelText: 'Address', border: OutlineInputBorder())),
            const SizedBox(height: 16),
            const TextField(decoration: InputDecoration(labelText: 'City', border: OutlineInputBorder())),
            const SizedBox(height: 16),
            const TextField(decoration: InputDecoration(labelText: 'Postal Code', border: OutlineInputBorder())),
            const SizedBox(height: 32),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                   // TODO: Integrate with a payment gateway
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Order placed successfully!')),
                  );
                  Navigator.of(context).popUntil((route) => route.isFirst);
                },
                child: const Text('Place Order'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  double _calculateTotal(List<CartItem> cartItems) {
    double total = 0;
    for (var item in cartItems) {
      total += item.product.price * item.quantity;
    }
    return total;
  }
}
