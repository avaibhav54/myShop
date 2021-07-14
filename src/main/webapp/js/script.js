function add_to_cart(pid,price,pname)
{
let cart=localStorage.getItem("cart");
if(cart==null)
{
let products=[];
let product={productId:pid, productName:pname,productQuantity:1,productPrice:price};
products.push(product);
localStorage.setItem("cart",JSON.stringify(products));
console.log("product added first time");
}
else
{
let pcart=JSON.parse(cart);
let op=pcart.find((item)=>item.productId==pid);

if(op)
{
op.productQuantity=op.productQuantity+1;
pcart.map((item)=>
{
if(item.productId==op.productId)
{
item.productQuantity=op.productQuantity;
}
})

localStorage.setItem("cart",JSON.stringify(pcart));
console.log("product quantity increased");
}
else
{
let product={productId:pid, productName:pname,productQuantity:1,productPrice:price};
pcart.push(product);

localStorage.setItem("cart",JSON.stringify(pcart));
console.log("new product added");
}
}

updateCart()

}
function updateCart()
{

console.log("hiiiii");
let cartString=localStorage.getItem("cart");
let cart = JSON.parse(cartString);
if(cart==null || cart.length==0)
{
console.log("cart is empty");

$(".cart-items").html("( 0 )");
$(".cart-body").html("<h3>Cart is Empty</h3>");
$(".checkout-btn").addClass('disabled');

}
else
{

$(".checkout-btn").removeClass('disabled');
$(".cart-items").html( ` (${cart.length}) ` );

let table=`

<table class='table'>

<thead class='thead-light'>
<tr>
<th>Item Name</th>
<th>Item Price</th>
<th>Item Quantity</th>
<th>Total Price</th>

<th>Action</th>
</tr>
</thead>
`;
let totalPrice=0;

cart.map((item)=>{
table+=`

<tr>
<td>${item.productName}</td>
<td>${item.productPrice}</td>
<td>${item.productQuantity}</td>
<td>${item.productQuantity*item.productPrice}</td>
<td><button onclick='deleteItem(${item.productId})' class="btn btn-danger" >Remove</button></td>

</tr>
`
totalPrice+=item.productQuantity*item.productPrice;

})
table=table+`<tr><td colspan='5' class="font-weight-bold m-5  text-right">Total Price :  ${totalPrice}</td></tr></table>`

$(".cart-body").html(table);
}

}

//delete item
function deleteItem(pid)
{
let cart=JSON.parse(localStorage.getItem('cart'));
let newCart=cart.filter((item)=>item.productId!=pid)


localStorage.setItem("cart",JSON.stringify(newCart));
updateCart();
}


$(document).ready(function(){


updateCart();
})








