const mongoose = require('mongoose');
var schema = new mongoose.Schema({
    first_name: "String",
    last_name: "String",
    email: "String",
    mobileno: "String",
    password: "String"
});
var schema1 = new mongoose.Schema({meal_name: "string", meal_info: "string", price: "string", type: "string"});
var User = mongoose.model("User", schema);
var Meal = mongoose.model("Meal", schema1);
module.exports = {User, Meal};
