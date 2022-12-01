const express = require("express");
const userRouter = express.Router();
const auth = require("../middlewares/auth");
const Order = require("../models/order");
const {Prescription} = require("../models/prescription");
// const Prescription = require("../models/prescription");
const { Product } = require("../models/product");
const User = require("../models/user");

userRouter.post("/api/add-to-cart", auth, async (req, res) => {
  try {
    const { id } = req.body;
    const product = await Product.findById(id);
    let user = await User.findById(req.user);

    if (user.cart.length == 0) {
      user.cart.push({ product, quantity: 1 });
    } else {
      let isProductFound = false;
      for (let i = 0; i < user.cart.length; i++) {
        if (user.cart[i].product._id.equals(product._id)) {
          isProductFound = true;
        }
      }

      if (isProductFound) {
        let producttt = user.cart.find((productt) =>
          productt.product._id.equals(product._id)
        );
        producttt.quantity += 1;
      } else {
        user.cart.push({ product, quantity: 1 });
      }
    }
    user = await user.save();
    res.json(user);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

userRouter.delete("/api/remove-from-cart/:id", auth, async (req, res) => {
  try {
    const { id } = req.params;
    const product = await Product.findById(id);
    let user = await User.findById(req.user);

    for (let i = 0; i < user.cart.length; i++) {
      if (user.cart[i].product._id.equals(product._id)) {
        if (user.cart[i].quantity == 1) {
          user.cart.splice(i, 1);
        } else {
          user.cart[i].quantity -= 1;
        }
      }
    }
    user = await user.save();
    res.json(user);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

// save user address
userRouter.post("/api/save-user-address", auth, async (req, res) => {
  try {
    const { address } = req.body;
    let user = await User.findById(req.user);
    user.address = address;
    user = await user.save();
    res.json(user);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});
userRouter.post("/api/save-user-contactno", auth, async (req, res) => {
  try {
    const { contactno } = req.body;
    let user = await User.findById(req.user);
    user.contactno = contactno;
    user = await user.save();
    res.json(user);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});


userRouter.post("/api/save-user-age", auth, async (req, res) => {
  try {
    const { age } = req.body;
    let user = await User.findById(req.user);
    user.age = age;
    user = await user.save();
    res.json(user);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});
// order product
userRouter.post("/api/order", auth, async (req, res) => {
  try {
    const { cart, totalPrice, address } = req.body;
    let products = [];

    for (let i = 0; i < cart.length; i++) {
      let product = await Product.findById(cart[i].product._id);
      if (product.quantity >= cart[i].quantity) {
        product.quantity -= cart[i].quantity;
        products.push({ product, quantity: cart[i].quantity });
        await product.save();
      } else {
        return res
          .status(400)
          .json({ msg: `${product.name} is out of stock!` });
      }
    }

    let user = await User.findById(req.user);
    user.cart = [];
    user = await user.save();

    let order = new Order({
      products,
      totalPrice,
      address,
      userId: req.user,
      orderedAt: new Date().getTime(),
    });
    order = await order.save();
    res.json(order);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

userRouter.get("/api/orders/me", auth, async (req, res) => {
  try {
    const orders = await Order.find({ userId: req.user });
    res.json(orders);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

userRouter.get("/api/prescription/me", auth, async (req, res) => {
  try {
    const prescription = await Prescription.find({ userId: req.user });
    res.json(prescription);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});


// Add prescription
userRouter.post("/api/add-prescription", auth, async (req, res) => {
  try {
    const { name, description, images, age } = req.body;
    let prescription = new Prescription({
      userId:req.user,
      name,
      description,
      images,
      age,
    });
    prescription = await prescription.save();
    res.json(prescription);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});
// userRouter.post("api/prescription")

userRouter.get("/api/get-prescription", auth, async (req, res) => {
  try {
    // const pres = Prescription
    const prescriptions = await Prescription.find({});
    res.json(prescriptions);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

userRouter.get("/api/prescription/me", auth, async(req, res)=>{
  try {
    const prescription = await Prescription.find({userId:req.user})
res.json(prescription);
    
  } catch (error) {
    return 
    res.status(500).json({error: error.message});
    
  }
  
});

userRouter.post("/api/delete-prescription", auth, async (req, res) => {
  try {
    const { id } = req.body;
    let prescription = await Prescription.findByIdAndDelete(id);
    res.json(prescription);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});


userRouter.post("/api/delete-order", auth, async (req, res) => {
  try {
    const { id } = req.body;
    let order = await Order.findByIdAndDelete(id);
    res.json(order);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});















// For User
userRouter.post("/api/add-to-prescription", auth, async (req, res) => {
  try {
    const { id } = req.body;
    const prescription = await Prescription.findById(id);
    let user = await User.findById(req.user);

    if (user.prescription.length == 0) {
      user.prescription.push({ prescription});
    } else {
      // let isPrescriptionFound = false;
      for (let i = 0; i < user.prescription.length; i++) {
        // compare moonge id and mongo id so not using == sign and 
        if (user.prescription[i].prescripton._id.equals(prescription._id)) {
          // isPrescriptionFound = true;
        }
      }

      // if (isPrescriptionFound) {
        // let producttt = user.prescription.find((productt) =>
      //     productt.prescription._id.equals(prescription._id)
      //   );
      //   producttt.quantity += 1;
      // } else {
        // prescription.push({ prescription });
      // }
    }
    user = await user.save();
    res.json(user);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});










userRouter.post("/api/add-to-prescription", auth, async (req, res) => {
  try {
    const { id } = req.body;
    const prescription = await Prescription.findById(id);
    let user = await User.findById(req.user);

    if (user.prescription.length == 0) {
      user.prescription.push({ prescription});
    } else {
      // let isPrescriptionFound = false;
      for (let i = 0; i < user.prescription.length; i++) {
        // compare moonge id and mongo id so not using == sign and 
        if (user.prescription[i].prescripton._id.equals(prescription._id)) {
          // isPrescriptionFound = true;
        }
      }

      // if (isPrescriptionFound) {
        // let producttt = user.prescription.find((productt) =>
      //     productt.prescription._id.equals(prescription._id)
      //   );
      //   producttt.quantity += 1;
      // } else {
        // prescription.push({ prescription });
      // }
    }
    user = await user.save();
    res.json(user);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

userRouter.delete("/api/remove-from-prescription/:id", auth, async (req, res) => {
  try {
   
    const { id } = req.params;
    const prescription = await Prescription.findById(id);
    let user = await User.findById(req.user);

    for (let i = 0; i < user.prescription.length; i++) {
      if (user.prescription[i].prescription._id.equals(prescription._id)) {
        if (user.prescription[i].quantity == 1) {
          user.prescription.splice(i, 1);
        } else {
          user.prescription[i].quantity -= 1;
        }
      }
    }
    user = await user.save();
    res.json(user);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

// save user address
userRouter.post("/api/save-user-address", auth, async (req, res) => {
  try {
    const { address } = req.body;
    let user = await User.findById(req.user);
    user.address = address;
    user = await user.save();
    res.json(user);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});



module.exports = userRouter;
