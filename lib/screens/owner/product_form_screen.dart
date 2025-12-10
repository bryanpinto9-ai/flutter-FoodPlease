import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/app_provider.dart';
import '../../models/product.dart';
import '../../theme/sketchy_theme.dart';
import '../../widgets/sketchy_button.dart';
import '../../widgets/sketchy_input.dart';

class ProductFormScreen extends StatefulWidget {
  const ProductFormScreen({super.key});

  @override
  State<ProductFormScreen> createState() => _ProductFormScreenState();
}

class _ProductFormScreenState extends State<ProductFormScreen> {
  final _nameController = TextEditingController();
  final _descController = TextEditingController();
  final _priceController = TextEditingController();
  final _stockController = TextEditingController();
  
  Product? _editingProduct;
  bool _isInit = true;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_isInit) {
      final args = ModalRoute.of(context)?.settings.arguments;
      if (args != null && args is Product) {
        _editingProduct = args;
        _nameController.text = _editingProduct!.name;
        _descController.text = _editingProduct!.description;
        _priceController.text = _editingProduct!.price.toString();
        _stockController.text = _editingProduct!.stock.toString();
      }
      _isInit = false;
    }
  }

  void _saveProduct() {
     final name = _nameController.text;
     final desc = _descController.text;
     final price = double.tryParse(_priceController.text) ?? 0.0;
     final stock = int.tryParse(_stockController.text) ?? 0;

     if (name.isEmpty || price <= 0) return;

     final provider = Provider.of<AppDataProvider>(context, listen: false);

     if (_editingProduct != null) {
       // Update
       final updated = Product(
         id: _editingProduct!.id,
         name: name,
         description: desc,
         price: price,
         stock: stock,
         imageUrl: _editingProduct!.imageUrl,
       );
       provider.updateProduct(updated);
     } else {
       // Create
        final newProduct = Product(
         id: DateTime.now().millisecondsSinceEpoch.toString(),
         name: name,
         description: desc,
         price: price,
         stock: stock,
       );
       provider.addProduct(newProduct);
     }
     Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
           children: [
             // Header
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
              child: Row(
                children: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text('← Volver', style: SketchyTheme.textStyle.copyWith(color: SketchyTheme.primaryColor)),
                  ),
                  const Spacer(),
                  Text(_editingProduct != null ? 'Editar' : 'Agregar', style: SketchyTheme.titleStyle),
                  const Spacer(),
                  const SizedBox(width: 60),
                ],
              ),
            ),
            const Divider(color: SketchyTheme.textPrimary, thickness: 2),

            Expanded(
               child: SingleChildScrollView(
                 padding: const EdgeInsets.all(24),
                 child: Column(
                   children: [
                      SketchyInput(label: 'Nombre', controller: _nameController),
                      const SizedBox(height: 15),
                      SketchyInput(label: 'Descripción', controller: _descController, maxLines: 3),
                      const SizedBox(height: 15),
                      // Image picker placeholder
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           Text('Subir Imagen', style: SketchyTheme.textStyle),
                           const SizedBox(height: 5),
                           Container(
                             width: double.infinity,
                             padding: const EdgeInsets.all(12),
                             decoration: SketchyTheme.inputDecoration,
                             child: Text('Seleccionar archivo...', style: SketchyTheme.textStyle.copyWith(color: Colors.grey)),
                           ),
                         ],
                      ),
                      const SizedBox(height: 15),
                      Row(
                        children: [
                          Expanded(child: SketchyInput(label: 'Precio (\$)', controller: _priceController, keyboardType: TextInputType.number)),
                          const SizedBox(width: 15),
                          Expanded(child: SketchyInput(label: 'Stock', controller: _stockController, keyboardType: TextInputType.number)),
                        ],
                      ),
                      const SizedBox(height: 30),
                      SketchyButton(
                        text: _editingProduct != null ? 'Actualizar' : 'Guardar Producto',
                        isPrimary: true,
                        width: double.infinity,
                        onPressed: _saveProduct,
                      ),
                   ],
                 ),
               ),
            ),
           ],
        ),
      ),
    );
  }
}
