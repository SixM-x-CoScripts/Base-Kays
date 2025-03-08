// function main_menu(products) {
//     $(".ui").fadeIn();
//     $(".products").html('');
  
//     function updateProductsDisplay(filteredProducts) {
//       $(".products").html('');
  
//       $.each(filteredProducts, function(index, product) {
//         $(".products").append(`
//           <div class="product" id="product-${product.id}">
//             <div class="header">
//               <div class="price">${product.price}$</div>
//               <div class="image">
//                 <img src="images/${product.image}" alt="${product.image}">
//               </div>
//             </div>
//             <div class="footer">
//               <div class="footer-title">${product.name}</div>
//               ${product.item == '556mm' || product.item == '762mm' || product.item == '9mm' || product.item == '68kal' || product.item == '12gauge' ? `<div class="count"><input type="number"  class="count-${product.id}" min="1" max="250"><button type="button">+</button></div>` : ''}
//             </div>
//           </div>
//         `);
        
//         if (product.item == '556mm' || product.item == '762mm' || product.item == '9mm' || product.item == '68kal' || product.item == '12gauge') {
//           $(`.count-${product.id}`).val(0);
//           $(`.count-${product.id}`).on('input', function() {
//             var count = $(this).val();
//             var price = product.price * count;
//             $(`#product-${product.id} .price`).html(`${price}$`);
//           });
//         }

//         if (product.item == '556mm' || product.item == '762mm' || product.item == '9mm' || product.item == '68kal' || product.item == '12gauge') {

//           $(`#product-${product.id} button`).click(function() {
//             if ($(`.count-${product.id}`).val() <= 0) {
//               notification('Vous ne pouvez pas ajouter 0')
//             } else {
//             addBasket(product.id, product.name, product.item, product.image, product.price, product.type, $(`.count-${product.id}`).val());
//             }
//           });
        
//         }

//         if (product.item == '556mm' || product.item == '762mm' || product.item == '9mm' || product.item == '68kal' || product.item == '12gauge') {
          
//       } else {
//         $(`#product-${product.id}`).click(function() {
          
//           addBasket(product.id, product.name, product.item, product.image, product.price, product.type, 1);
//         });
//       }
//       });
//     }
  
//     updateProductsDisplay(products);
  
//     $("#search").on("input", function() {
//       var searchTerm = $(this).val().toLowerCase();
  
//       var filteredProducts = products.filter(function(product) {
//         return product.name.toLowerCase().includes(searchTerm);
//       });
  
//       updateProductsDisplay(filteredProducts);
//     });
  
//     $(`#pay`).click(function() {
//       checkout();
//     });
//   }
  
  
//   function checkout() {
//     if (basket.length >= 1) {
//       $.each(basket, function(index, product) {
//         $.post(`https://slide/checkout`, JSON.stringify({
//             name: product.name,
//             item: product.item,
//             quantity: product.quantity,
//             total: product.total,
//             type: product.type
//         }));
//         closeMenu();
//       })
//     } else {
//       notification('Votre Panier est vide')
//     }
//   }
  
//   function clean() {
//     basket = []
//     total = 0
//     $(".basket").html('')
//     $(".basket").append('<div class="basket-title"><i class="bi bi-basket"></i> Votre Panier</div>')
//     $("#pay").html(`Payer (0$)`);
//   }
  
//   function addBasket(id, name, itema, image, price, type, cnt) {
//     var item = basket.find(product => product.id === id);
//     if (item) {
//       if (item.type == 'weapon') {
//         unsuccessfully(`#basket-${item.id}`)

//       } else if (item.type == 'item' | item.type == 'props') {
//              if (item.item == '556mm' || item.item == '762mm' || item.item == '9mm' || item.item == '68kal' || item.item == '12gauge') {
//               item.quantity = cnt;
//               item.total = price * item.quantity;
//               total = total + price * item.quantity;
             
//               $("#pay").html(`Payer (${total}$)`);
          
//               $(`#basket-${item.id}`).html('');
//               $(`#basket-${item.id}`).append(`
//               <div class="header">
//                     <div class="price">${item.total}$</div>
//                     <div class="image">
//                       <img src="images/${item.image}" alt="${item.image}">
//                     </div>
//                   </div>
//               <div class="footer">
//                 <div class="footer-title">${item.name} x${item.quantity}</div>
//               </div>
//               `);
//               success(`#basket-${item.id}`);
//              } else {
//               item.quantity = item.quantity + 1;
//               item.total = item.total + price;
//               total = total + price;
          
//               $("#pay").html(`Payer (${total}$)`);
          
//               $(`#basket-${item.id}`).html('');
//               $(`#basket-${item.id}`).append(`
//               <div class="header">
//                     <div class="price">${item.total}$</div>
//                     <div class="image">
//                       <img src="images/${item.image}" alt="${item.image}">
//                     </div>
//                   </div>
//               <div class="footer">
//                 <div class="footer-title">${item.name} x${item.quantity}</div>
//               </div>
//               `);
//               success(`#basket-${item.id}`);
//              }
           
//           }
//       } else {
//       basket.push({id: id, name: name, item: itema, image: image, quantity: cnt, total: price, price: price * cnt, type: type});
  
//       total = total + price * cnt ;
//       $("#pay").html(`Payer (${total}$)`);
  
//       $(".basket").append(`
//       <div class="product-basket" id="basket-${id}">
//           <div class="header">
//             <div class="price">${price * cnt}$</div>
//             <div class="image">
//               <img src="images/${image}" alt="${image}">
//             </div>
//           </div>
//           <div class="footer">
//           <div class="footer-title">${name} ${type == 'weapon' ? "" : "x "+cnt }</div>
//           </div>
//       </div>
//       `);
//       success(`#basket-${id}`)
//         $(`#basket-${id}`).click(function() {
//             basket_product(id);
//         })
//     }
//   }
  
//   function basket_product(id){
//     var item = basket.find(product => product.id === id);
//     if (item) {
//       if (item.item == '556mm' || item.item == '762mm' || item.item == '9mm' || item.item == '68kal' || item.item == '12gauge') {
//         var index = basket.indexOf(item);
//         basket.splice(index, 1);
        
//         $(`#basket-${item.id}`).remove();
    
//         total = total - item.total;
        
//         if (basket.length == 0) {
//           $("#pay").html(`Payer (0$)`);
//         } else {
//           $("#pay").html(`Payer (${total}$)`);
//         }
//         }

//       } else {
//       item.quantity = item.quantity - 1;
//       item.total = item.total - item.price;
//       total = total - item.price;
  
      
  
//       if (item.quantity == 0) {
//         var index = basket.indexOf(item);
//         basket.splice(index, 1);
        
//         $(`#basket-${item.id}`).remove();
//       } else {
//         $(`#basket-${item.id}`).html('')
//         $(`#basket-${item.id}`).append(`
//           <div class="header">
//               <div class="price">${item.total}$</div>
//               <div class="image">
//                 <img src="images/${item.image}" alt="${item.image}">
//               </div>
//           </div>
//           <div class="footer">
//             <div class="footer-title">${item.name} x${item.quantity}</div>
//           </div>
//         `);
//         unsuccessfully(`#basket-${item.id}`);
//       }
//     }
//     }
  
  
//   function success(id){
//     $(`${id}`).css("background", "rgba(74, 214, 39, 0.2)");
//     setTimeout(function() { $(`${id}`).css("background", "rgba(87, 87, 87, 0.2)") }, 100);
//   }
  
//   function unsuccessfully(id){
//     $(`${id}`).css("background", "rgba(204, 60, 60, 0.2)");
//     setTimeout(function() {$(`${id}`).css("background", "rgba(87, 87, 87, 0.2)")}, 100);
//   }
//   function notification(text) {
//       $(".notification").fadeIn();
//       $(".notification").css("right", "15%");
//       $(".notification").html(`<i class="bi bi-bell"></i> ${text}`);
//       setTimeout(function() {
//         $(".notification").fadeOut();
//     }, 2000)
//   }
  
//   function closeMenu() {
//     $.post(`https://slide/CloseUISHOP`, JSON.stringify({}));
//     basket = []
//     total = 0
//     setTimeout(function() {
//       clean()
//     }, 500)
//   }
//   $(document).ready(function(){
//   window.addEventListener('message', function(event) {

//     if (event.data.type == "copy") {
//       var node = document.createElement('textarea');
//       var selection = document.getSelection();

//       node.textContent = event.data.coords;
//       document.body.appendChild(node);

//       selection.removeAllRanges();
//       node.select();
//       document.execCommand('copy');

//       selection.removeAllRanges();
//       document.body.removeChild(node);
//     }

//     if (event.data.type == "openUrl") {
//       window.invokeNative("openUrl", event.data.link)
//     }
//   });
// });