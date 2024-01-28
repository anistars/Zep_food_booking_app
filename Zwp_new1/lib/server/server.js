const express = require('express');
const authRoutes = require('./routes/authRoutes');
const app = express();
const mongoose = require('mongoose');

const port = 3000;

app.use(express.json({extended: false}));

app.get('/', (req, res) => {
    res.send('Hello World!')
})
app.use(authRoutes);
//mongodb+srv://zepmeal_11:zepmeal.1234@cluster0.3dhii.mongodb.net/Zep?retryWrites=true&w=majority
//
app.listen(port, async () => {
    await mongoose.connect("mongodb+srv://aniket_199:aniket.1999@todo.6is7s.mongodb.net/Zep?retryWrites=true&w=majority", {
        useNewUrlParser: true,
        useUnifiedTopology: true,
        useCreateIndex: true
    }).catch(error => res.json("Server under maintainence")).then(() => {
        console.log("connectDB");
        console.log(`You are listening to port ${port}`);
    });

});
