import 'package:get/get.dart';
import 'package:loggy/loggy.dart';

import '../../domain/product.dart';

class ShoppingController extends GetxController {
  // lista de productos
  var entries = <Product>[].obs;
  // el valor total de la compra
  var total = 0.obs;

  @override
  void onInit() {
    super.onInit();
    // los dos elementos que vamos a tener en la tienda
    entries.add(Product(0, "Toy car", 10));
    entries.add(Product(1, "Toy house", 20));
  }

  void calcularTotal() {
    int newTotal = 0;
    entries.forEach((element) => newTotal += element.price * element.quantity);
    total.value = newTotal;
  }

  agregarProducto(id) {
    logInfo('agregarProducto $id');
    var producto=entries.firstWhere((Product product) => product.id == id);
    //var index=entries.indexOf(producto);
    producto.quantity = producto.quantity + 1;
    entries[entries.indexWhere((element) => element.id == id)]=producto;
    calcularTotal();
  }

  quitarProducto(id) {
    logInfo('quitarProducto $id');
    var producto=entries.firstWhere((Product product) => product.id == id);
    //var index=entries.indexOf(producto);
    
    if (producto.quantity > 0){
      producto.quantity = producto.quantity - 1;
      entries[entries.indexWhere((element) => element.id == id)]=producto;
    }
    calcularTotal();
  }
}
