

function addcart(pid, pname, pprice) {
    let cart = localStorage.getItem("cart");
    if (cart === null) {
//      no cart

        let products = [];
        let product = {productid: pid, productname: pname, productquntity: 1, productprice: pprice};
        products.push(product);
        localStorage.setItem("cart", JSON.stringify(products));

//        console.log("product added successfully at first time")
        showtost("product added successfully!! ");
    } else {

//      cart is already exit

        let pcart = JSON.parse(cart);
        let oldproduct = pcart.find((item) => item.productid == pid);


        if (oldproduct) {
//      quantity increase

            oldproduct.productquntity = oldproduct.productquntity + 1;
            pcart.map((item) => {
                if (item.productid === oldproduct.productid) {
                    item.productquntity = oldproduct.productquntity;
                }

            })
            localStorage.setItem("cart", JSON.stringify(pcart));
//            console.log("Quantity Increased ");
              showtost("  Quantity Increased Successfully !!   Quantity= "+oldproduct.productquntity);
        } else {
            let product = {productid: pid, productname: pname, productquntity: 1, productprice: pprice};
            pcart.push(product);
            localStorage.setItem("cart", JSON.stringify(pcart));
//            console.log("Quantity Increased ");
              showtost(" Product Added successfully !! ");
                
        }

    }
    updatecart();
}



function updatecart() {
    let cartString = localStorage.getItem("cart");
    let cart = JSON.parse(cartString);
    if (cart === null || cart.length === 0) {
        console.log("cart Empty");
        $(".cart-item").html("( 0 )");
        $(".cart-body").html("<h3> No Available any Item in Cart</h3>");
      $('.checkout-btn').attr('disabled',true);
        console.log("removed");


    } else {
        console.log(cart);
        $(".cart-item").html(`(${cart.length})`);
        let table = `
 
<table class='table'>
<thead class='thead-light'>
        <tr>
        <th>Item Name </th>
        <th>Price</th>
        <th>Quantity</th>
        <th> Total Price</th>
        <th>Action</th>
      

</tr>


</thead>



`;
        let totalprice=0;
        
        cart.map((item) => {
            table+=`
            <tr>

            <td>${item.productname}</td>
             <td> ${item.productprice}</td>
     
             <td>${item.productquntity} </td>
             <td>${item.productquntity*item.productprice}</td>
             <td><button class='btn btn-danger btn-sm' onclick='deleteitem(${item.productid})' >Remove</button></td>
            </tr>

`
            totalprice+=item.productprice*item.productquntity;
        })
        table=table+`
<tr><td colspan='5' class='text-right font-weight-bold '>Total Price : ${totalprice} </td></tr>

</table> `
         $(".cart-body").html(table);
         $('.checkout-btn').attr('disabled',false);
          console.log("removed");
          
        
    }
}
  
//<button onclick='incs(${item.productid})' ><i class="fa fa-minus-circle" aria-hidden="true"></i></button>
//<button onclick='incs(${item.productid})' > <i class="fa fa-plus-circle"></i></button>-->
function  deleteitem(pid){
    
    let cart=JSON.parse(localStorage.getItem('cart'));
   let newcart= cart.filter((item) => item.productid !=pid)
    localStorage.setItem('cart',JSON.stringify(newcart));
    updatecart();
      showtost("Item Removed Successfully !! ");
}


$(document).ready(function () {
    updatecart();
})

 function showtost(contents){
                $("#tostmsg").addClass("actions");
                $("#tostmsg").html(contents);
            setTimeout( () => {
                $("#tostmsg").removeClass("actions");
            },1000)
            }
            
  function tocheckout(){
      window.location="check.jsp";
  }      
  
 
