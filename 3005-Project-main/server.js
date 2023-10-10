const config = require('./config.js');
const express = require('express');
const app = express();
const path = require('path');
const PORT = process.env.PORT || 8000;
let router = express.Router();
const accountRouter = require("./account-router.js");
const loginRouter = require("./login-router.js");
const searchRouter = require("./search-router.js");
const signupRouter = require("./signup-router.js");

let user_id=0;



let db;
app.locals.db = db;
app.use(express.json()); // body-parser middleware

app.get(["/","/home"], (req,res)=> {
    res.format({
		'text/html': ()=> {
			res.set('Content-Type', 'text/html');
			res.sendFile(path.join(__dirname,'public','home.html'),(err) =>{
				if(err) res.status(500).send('500 Server error');
			});
		},
        'default' : ()=> {
            res.status(406).send('Not acceptable');
        }
    })
});


// MIDDLEWARE
app.use(express.static("public"));
app.use(express.json());
app.use(express.urlencoded({extended: true}));
app.use((req,_,next)=> {
    console.log(`${req.method}: ${req.url}`);
    if (Object.keys(req.body).length > 0){
        console.log('Body:');
        console.log(req.body);
    }
    next();
});

//Mount the fridge router to the path /fridges
//All requests starting with /fridges will be forwarded to this router
app.use("/login", loginRouter);
app.use("/search",searchRouter);
app.use("/signup", signupRouter);
app.use("/account",accountRouter);


config.connect((err)=>{
    if (err){
        console.log(err.message);
        return;
    }
    console.log("Database connected")

})
var username = 'owner'
// config.query('SELE", (err,res)=>{
//     console.log(err,res)

// })



app.listen(PORT, ()=> {
    console.log(`Server listening on http://localhost:${PORT}`)
    });

    config.query("SELECT * FROM users;", (err,res)=>{if(err)throw err;console.log(res);});

    config.query("SELECT * FROM publishers;", (err,res)=>{if(err)throw err;console.log(res);});

    config.query("SELECT * FROM orders;", (err,res)=>{if(err)throw err;console.log(res);});

    config.query("SELECT * FROM books;", (err,res)=>{if(err)throw err;console.log(res);});

    config.query("SELECT * FROM phone_numbers;", (err,res)=>{if(err)throw err;console.log(res);});

    config.query("SELECT * FROM cart;", (err,res)=>{if(err)throw err;console.log(res);});

    config.query("SELECT * FROM books_in_order;", (err,res)=>{if(err)throw err;console.log(res);});

    config.query("SELECT * FROM address;", (err,res)=>{if(err)throw err;console.log(res);});

    config.query("SELECT * FROM genre;", (err,res)=>{if(err)throw err;console.log(res);});

    config.query("SELECT * FROM book_genre;", (err,res)=>{if(err)throw err;console.log(res);});



process.on('SIGINT', function() {
    config.end(function () {
      console.log('Database disconnected through app termination');
      process.exit(0);
    });
  });