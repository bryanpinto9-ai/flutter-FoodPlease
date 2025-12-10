import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/data_provider.dart';
import '../../models/product_model.dart';
// import 'package:uuid/uuid.dart'; // Using timestamp for ID

class EditProductScreen extends StatefulWidget {
  final Product? product; // Null if creating new

  const EditProductScreen({Key? key, this.product}) : super(key: key);

  @override
  State<EditProductScreen> createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<EditProductScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  late TextEditingController _descController;
  late TextEditingController _priceController;
  late TextEditingController _stockController;
  bool _isAvailable = true;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.product?.name ?? '');
    _descController = TextEditingController(text: widget.product?.description ?? '');
    _priceController = TextEditingController(text: widget.product?.price.toString() ?? '');
    _stockController = TextEditingController(text: widget.product?.stock.toString() ?? '100');
    _isAvailable = widget.product?.isAvailable ?? true;
  }

  void _saveProduct() {
    if (!_formKey.currentState!.validate()) return;

    final data = Provider.of<DataProvider>(context, listen: false);
    final name = _nameController.text;
    final desc = _descController.text;
    final price = double.parse(_priceController.text);
    final stock = int.parse(_stockController.text);

    if (widget.product != null) {
      // Update
      final updatedProduct = Product(
        id: widget.product!.id,
        name: name,
        description: desc,
        price: price,
        imageUrl: '',
        isAvailable: _isAvailable,
        stock: stock,
      );
      data.updateProduct(widget.product!.id, updatedProduct);
    } else {
      // Create
      final newProduct = Product(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        name: name,
        description: desc,
        price: price,
        imageUrl: '',
        isAvailable: _isAvailable,
        stock: stock,
      );
      data.addProduct(newProduct);
    }

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.product == null ? 'Agregar' : 'Editar'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: const Color(0xFF2c2c2c),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Nombre'),
                validator: (v) => v!.isEmpty ? 'Requerido' : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _descController,
                decoration: const InputDecoration(labelText: 'Descripción'),
                maxLines: 3,
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _priceController,
                      decoration: const InputDecoration(labelText: 'Precio (\$)'),
                      keyboardType: TextInputType.number,
                      validator: (v) => v!.isEmpty ? 'Requerido' : null,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: TextFormField(
                      controller: _stockController,
                      decoration: const InputDecoration(labelText: 'Stock'),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              SwitchListTile(
                title: const Text('Producto Disponible'),
                value: _isAvailable,
                onChanged: (v) => setState(() => _isAvailable = v),
              ),
              const SizedBox(height: 32),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _saveProduct,
                  child: Text(widget.product == null ? 'Guardar Producto' : 'Actualizar'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
