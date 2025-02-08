import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mersal/core/local_storage/model/ComprehensiveExtras.dart';
import 'package:mersal/core/local_storage/model/Extras.dart';
import 'package:mersal/core/local_storage/model/cart_product.dart';
import 'package:mersal/core/local_storage/model/cart_product_size.dart';
import 'package:mersal/features/business_screen/model/Product.dart';
import 'package:mersal/features/business_screen/model/Sizes.dart';
import 'package:mersal/features/business_screen/model/product_comp_extra.dart';
import 'package:mersal/features/business_screen/model/product_extra.dart';

import 'addons_state.dart';

class AddonsCubit extends Cubit<AddonsState> {
  AddonsCubit() : super(AddonsInitial());

  late List<List<num>> extrasIdList;
  late List<List<Extras>> extrasList;

  late List<ComprehensiveExtras> compList;

  List<Map> reqIndexGroups=[];

  late Size selectedSize;
  late num selectedSizeId;

  bool addToCartClicked= false;
  bool canAddToCart= false;

  num addonsSum = 0;
  num total = 0;
  int count = 1;

  calcSheetLen({required int optionLen, required int titlesLen,required Product product}){
    for(var i in product.groups!){
      titlesLen++;
      for(var x in i.extras!){
        optionLen++;
      }
    }
    for(var i in product.comprehensiveExtras!){
      optionLen++;
    }
    if(product.sizes!.length>1){
      titlesLen++;
      for(var i in product.sizes!){
        optionLen++;
      }
    }
    return {0:optionLen,1:titlesLen};
  }

  //----------------- count -------------------------

  changeCount({required bool add}){
    if(add){
      count++;
    }else{
      if(count!=1) count--;
    }
    emit(AddonsInitial());
  }

  //----------------- extras fun ---------------------

  generateExtrasList(Product product){
    extrasIdList = List.generate(product.groups!.length, (index)=>[]);
    extrasList = List.generate(product.groups!.length, (index)=>
        List.generate(product.groups![index].extras!.length,(i)=>
            Extras(groupId: product.groups![index].id,extraId: product.groups![index].extras![i].id,quantity: 0,extraPrice: product.groups![index].extras![i].price,name: product.groups![index].extras![i].name),
        )
    );
  }

  updateExtrasList({required bool val, required int groupIndex, required int extraIndex, required ProductExtras extra,}){
    if(val){
      extrasIdList[groupIndex].add(extra.id!);
      extrasList[groupIndex][extraIndex].quantity=1;
      addonsSum+=extrasList[groupIndex][extraIndex].extraPrice!;
    }else{
      extrasIdList[groupIndex].remove(extra.id!);
      addonsSum-= extrasList[groupIndex][extraIndex].extraPrice! * extrasList[groupIndex][extraIndex].quantity!;
      extrasList[groupIndex][extraIndex].quantity=0;
    }
    emit(AddonsInitial());
  }

  updateExtraCount({required int groupIndex,required int extraIndex,required bool add}){
    if(add){
      if(extrasList[groupIndex][extraIndex].quantity!<2){
        extrasList[groupIndex][extraIndex].quantity = extrasList[groupIndex][extraIndex].quantity!+1;
        addonsSum += extrasList[groupIndex][extraIndex].extraPrice!;
      }
    }else{
      extrasList[groupIndex][extraIndex].quantity = extrasList[groupIndex][extraIndex].quantity!-1;
      addonsSum -= extrasList[groupIndex][extraIndex].extraPrice!;
    }
    emit(AddonsInitial());
  }

  //---------------- comp fun ----------------------

  generateCompList(Product product){
    compList = List.generate(product.comprehensiveExtras!.length,(index)=>ComprehensiveExtras(name: product.comprehensiveExtras![index].name));
  }

  updateCompList({required bool val, required int compIndex,  required ProductCompExtra compExtra,}){
    if(val){
      compList[compIndex].extraId=compExtra.id;
    }else{
      compList[compIndex].extraId=null;
    }
  }

  //-------------- Size ---------------------

  setStartedSize(Product pro){
    selectedSize = pro.sizes![0];
    selectedSizeId = pro.sizes![0].id!;
  }

  setNewSize(Size size){
    selectedSize = size;
    selectedSizeId = size.id!;
    emit(AddonsInitial());
  }

  //----------------- reqIndexGroup // checkAddToCart -----------------

  generateAndResetReqIndexGroup(Product product){
    reqIndexGroups.clear();
    for(int i=0; i<product.groups!.length;i++){
      if(product.groups![i].isRequired!) reqIndexGroups.add({'index':i,'done':false});
    }
  }

  setReqIndexGroupMap(){
    addToCartClicked=true;
    for(Map i in reqIndexGroups){
      for (var ex in extrasList[i['index']]) {
        if(ex.quantity!=0) {
          i['done'] = true;
        }
      }
    }
    emit(AddonsInitial());
  }

  check(){
    canAddToCart = true;
    if(reqIndexGroups.isEmpty){}else{
      for(var map in reqIndexGroups){
        if(!map['done']) canAddToCart=false;
      }
    }
  }

  //----------------------------------
  CartProduct setCartProduct(Product pro){
    List<Extras> exList=[];
    List<ComprehensiveExtras> mainsList=[];
    for(var list in extrasList){
      for(var extra in list){
        if(extra.quantity!=0) {
          exList.add(extra);
        }
      }
    }

    for(var x in compList){
      if(x.extraId!=null) mainsList.add(x);
    }
    // print(pro.id);
    // print(mainsList);
    // print(exList);
    // print(selectedSizeId);
    // print(count);

    // print(mainsList);
    // print(exList);
    return CartProduct(
      addonsSum: addonsSum,
      productId: pro.id,
      name: pro.name,
      comprehensiveExtras: mainsList,
      extras: exList,
      sizeId: selectedSizeId,
      selectedSize: CartProductSize(name: selectedSize.name,id: selectedSize.id,price: selectedSize.price,discount: selectedSize.discount),
      quantity: count,
      image: pro.images![0].image??'',
      note: ''
    );
  }
}
