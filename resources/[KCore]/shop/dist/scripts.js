window.addEventListener('load', (event) => {
    const container = document.querySelector('.menu');
    container.style.visibility = 'hidden';
    window.items = []; 

    window.addEventListener('message', (event) => {
        let data = event.data;
        if (data.action === 'open') {
            container.style.visibility = 'visible';

            clearCart();

            window.items = data.items;

            updateCategories(data.shopType);

            const firstCategoryButton = document.querySelector('.category-btn');
            if (firstCategoryButton) {
                firstCategoryButton.classList.add('active');
                filterItemsByCategory(firstCategoryButton.id);
            }
        } else if (data.action === 'close') {
            container.style.visibility = 'hidden';
        }
    });

    window.addEventListener('keydown', (event) => {
        if (event.key === 'Escape') {
            fetch('https://shop/closeall');
        }
    });

    document.querySelector('#exit').addEventListener('click', (event) => {
        fetch('https://shop/close');
    });

    function displayItems(items) {
        let itemsContainer = document.querySelector('.items');
        itemsContainer.innerHTML = ''; 

        items.forEach(item => {
            let itemElement = `
                <button class="item" data-item-name="${item.name}" data-item-type="${item.type}">
                    <div class="item-price">$${item.price}</div>
                    <img src="${item.image}" alt="${item.name}">
                    <div class="item-name">${item.label}</div>
                </button>
            `;
            itemsContainer.innerHTML += itemElement;
        });

        document.querySelectorAll('.item').forEach(itemButton => {
            itemButton.addEventListener('click', (event) => {
                const itemName = itemButton.getAttribute('data-item-name');
                const itemType = itemButton.getAttribute('data-item-type');
                const itemLabel = itemButton.querySelector('.item-name').textContent;
                const itemPrice = parseInt(itemButton.querySelector('.item-price').textContent.replace('$', ''));
                addItemToCart(itemName, itemType, itemLabel, itemPrice);
            });
        });
    }

    function updateCategories(shopType) {
        console.log('Shop Type:', shopType); // Debugging line
        const categoriesContainer = document.querySelector('.sidebar');
        categoriesContainer.innerHTML = ''; // Clear existing categories
    
        if (shopType === 'shop') {
            categoriesContainer.innerHTML += `
                <button class="category-btn" id="food">
                    <img src="assets/aaa.png" alt="Food Logo" class="category-logo">
                    Nourriture
                </button>
                <button class="category-btn" id="divers">
                    <img src="assets/aaa.png" alt="Divers Logo" class="category-logo">
                    Divers
                </button>
            `;
        } else if (shopType === 'ammunation') {
            categoriesContainer.innerHTML += `
                <button class="category-btn" id="armes">
                    <img src="assets/aaa.png" alt="Armes Logo" class="category-logo">
                    Armes
                </button>
                <button class="category-btn" id="munitions">
                    <img src="assets/aaa.png" alt="Munitions Logo" class="category-logo">
                    Munitions
                </button>
            `;
        } else if (shopType === 'ikea') {
            console.log('Setting up IKEA categories');
            categoriesContainer.innerHTML += `
                <button class="category-btn" id="props">
                    <img src="assets/aaa.png" alt="Props Logo" class="category-logo">
                    Props
                </button>
            `;
        }
    
        categoriesContainer.innerHTML += `
            <button id="exit" class="quit-btn">
                <img src="assets/quit.png" alt="Quit Logo" class="quit-logo">
                Quitter
            </button>
        `;
    
        document.querySelector('#exit').addEventListener('click', (event) => {
            fetch('https://shop/close');
        });
    
        document.querySelectorAll('.category-btn').forEach(categoryButton => {
            categoryButton.addEventListener('click', (event) => {
                document.querySelectorAll('.category-btn').forEach(btn => btn.classList.remove('active'));
                categoryButton.classList.add('active');
                filterItemsByCategory(categoryButton.id);
            });
        });
    }

    function filterItemsByCategory(category) {
        let filteredItems = window.items.filter(item => item.categorie === category);
        displayItems(filteredItems);
    }

    const searchBar = document.querySelector('.search-bar');
    searchBar.addEventListener('input', (event) => {
        const query = event.target.value.toLowerCase();
        
        if (query) {
            const filteredItems = window.items.filter(item => item.label.toLowerCase().includes(query));
            displayItems(filteredItems);
        } else {
            const activeCategory = document.querySelector('.category-btn.active');
            if (activeCategory) {
                filterItemsByCategory(activeCategory.id);
            }
        }
    });

    function addItemToCart(itemName, itemType, itemLabel, itemPrice) {
        let cartItem = document.querySelector(`.cart-item[data-item-name="${itemName}"]`);
        
        if (cartItem) {
            let quantitySpan = cartItem.querySelector('.item-quantity');
            let newQuantity = parseInt(quantitySpan.textContent) + 1;
            quantitySpan.textContent = newQuantity;
    
            let priceSpan = cartItem.querySelector('.cart-item-price');
            priceSpan.textContent = `$${itemPrice * newQuantity}`;
        } else {
            let cartContainer = document.querySelector('.cart .cart-items-container');
            let cartItemElement = document.createElement('div');
            cartItemElement.classList.add('cart-item');
            cartItemElement.setAttribute('data-item-name', itemName);
            cartItemElement.setAttribute('data-item-type', itemType); 
    
            cartItemElement.innerHTML = `
                <span>${itemLabel}</span>
                <div class="quantity-controls">
                    <button class="quantity-btn" onclick="updateCart('${itemName}', '${itemType}', -1)">-</button>
                    <span class="item-quantity">1</span>
                    <button class="quantity-btn" onclick="updateCart('${itemName}', '${itemType}', 1)">+</button>
                    <span class="cart-item-price" data-price="${itemPrice}">$${itemPrice}</span>
                </div>
                <button class="remove-btn" onclick="removeItem('${itemName}')">X</button>
            `;
    
            cartContainer.appendChild(cartItemElement);
        }
    
        updateTotalPrice();
    }
    

    window.updateCart = function(itemName, itemType, change) {
        let cartItem = document.querySelector(`.cart-item[data-item-name="${itemName}"]`);
        let quantitySpan = cartItem.querySelector('.item-quantity');
        let newQuantity = parseInt(quantitySpan.textContent) + change;

        if (newQuantity <= 0) {
            removeItem(itemName);
        } else {
            quantitySpan.textContent = newQuantity;
            let price = parseInt(cartItem.querySelector('.cart-item-price').dataset.price);
            cartItem.querySelector('.cart-item-price').textContent = `$${price * newQuantity}`;
        }

        updateTotalPrice();
    }

    window.removeItem = function(itemName) {
        let cartItem = document.querySelector(`.cart-item[data-item-name="${itemName}"]`);
        if (cartItem) {
            cartItem.remove();
        }

        updateTotalPrice();
    }

    function updateTotalPrice() {
        let total = 0;
        document.querySelectorAll('.cart-item').forEach(cartItem => {
            let price = parseInt(cartItem.querySelector('.cart-item-price').textContent.replace('$', ''));
            total += price;
        });
        document.querySelector('.total span').textContent = `Total : $${total}`;
    }

    function clearCart() {
        let cartContainer = document.querySelector('.cart');
        cartContainer.innerHTML = `
            <h3>Panier</h3>
            <div class="cart-items-container">
                <!-- Cart items will go here -->
            </div>
            <div class="total">
                <img src="assets/sac.png" alt="Total Logo">
                <span>Total : $0</span>
            </div>
            <button id="totalid" class="checkout-btn">
                <img src="assets/wallet.png" alt="Checkout Logo">
                Payer
            </button>
        `;

        document.querySelector('.checkout-btn').addEventListener('click', (event) => {
            handleCheckout();
        });
    }

    function handleCheckout() {
        let cartItems = document.querySelectorAll('.cart-item');
        let items = [];
    
        cartItems.forEach(cartItem => {
            let itemName = cartItem.getAttribute('data-item-name');
            let itemType = cartItem.getAttribute('data-item-type');
            let itemLabel = cartItem.querySelector('span').textContent; 
            let quantity = parseInt(cartItem.querySelector('.item-quantity').textContent);
    
            items.push({ itemName: itemName, label: itemLabel, type: itemType, quantity: quantity });
        });
    
        let total = parseInt(document.querySelector('.total span').textContent.replace('Total : $', ''));
    
        fetch(`https://${GetParentResourceName()}/checkMoney`, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json; charset=UTF-8',
            },
            body: JSON.stringify({ total: total, items: items })
        }).then(resp => resp.json()).then(data => {
            if (data.success) {
                clearCart();
                fetch('https://shop/close');
            } else {
                clearCart();
                fetch('https://shop/close'); 
            }
        });
    }
    
});
