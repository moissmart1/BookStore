const express = require('express');
const fs = require('fs');
const path = require('path');
const app = express();
let router = express.Router();
const config = require('./config.js');

app.use(express.json()); // body-parser middleware
router.post('/', (request,response) => {
    let search = request.body.search.toLowerCase();
    if(search == ''){console.log("401")
    response.status(401).send("Not found");
    return;
}
    
    let type = request.body.type.toLowerCase();
        //by ISBN
        if(type == "isbn" ){
            if (isNaN(search)){console.log("401")
            response.status(401).send("Not found");
            return;
        
        }
            else{
                config.query("SELECT * FROM books WHERE ISBN="+search, (err,res)=>{
                    if (err) throw err;
                    if(res.rows.length > 0){
                        console.log(200,JSON.stringify(res.rows))
                        response.status(200).send(JSON.stringify(res.rows));
                        return;
                    } else{
                        console.log("401")
                        response.status(401).send("Not found");
                        return;
                    }
                });
            }
        }
        //by author
        else if(type == "author" ){
        config.query("SELECT * FROM books WHERE position(\'"+search+"\' in books.author)>0", (err,res)=>{
            if (err) throw err;
            if(res.rows.length > 0){
                console.log(200,JSON.stringify(res.rows))
                response.status(200).send(JSON.stringify(res.rows));
                return;
            } else{
                console.log("401")
                response.status(401).send("Not found");
                return;
            }
        });
    }
        else if(type == "name" ){
        config.query("SELECT * FROM books WHERE position(\'"+search+"\' in books.b_name)>0", (err,res)=>{
            if (err) throw err;
            if(res.rows.length > 0){
                console.log(200,JSON.stringify(res.rows))
                response.status(200).send(JSON.stringify(res.rows));
                return;
            }
            else{
                console.log("401")
                response.status(401).send("Not found");
                return;
            }
        });
    }
        else if(type == "genre" ){
        config.query("SELECT books.ISBN,books.B_name,books.author,books.publisher_number,books.number_of_pages,books.price,books.number_in_stock,books.publisher_sale_percentage,books.date_published FROM genre NATURAL JOIN book_genre NATURAL JOIN books WHERE position(\'"+search+"\' in genre.g_name)>0", (err,res)=>{
            if (err) throw err;
            if(res.rows.length > 0){
                console.log(200,JSON.stringify(res.rows))
                response.status(200).send(JSON.stringify(res.rows));
                return;
            } else{
                console.log("401")
                response.status(401).send("Not found");
                return;
            }
        });
    }

});

router.post( "/admin", (request,response) => {
    let book = request.body.bookname.toLowerCase();
    let author = request.body.author.toLowerCase();
    console.log(request);
        if(book != '' && author != '')
        config.query("SELECT * FROM books", (err,res)=>{
            if (err) throw err;
            if(res.rows.length > 0){
                response.send(JSON.stringify(res.rows));
                return;
            } else{
                console.log("401")
                response.status(401).send("Not found");
                return;
            }
        });
                //by author
                if(book == '' && author != ''){
                    config.query("SELECT * FROM books WHERE position(\'"+author+"\' in books.author)>0", (err,res)=>{
                        if (err) throw err;
                        if(res.rows.length > 0){
                            console.log(200,JSON.stringify(res.rows))
                            response.status(200).send(JSON.stringify(res.rows));
                            return;
                        } else{
                            console.log("401")
                            response.status(401).send("Not found");
                            return;
                        }
                    });
                }
                if(book != '' && author == ''){
                    config.query("SELECT * FROM books WHERE position(\'"+book+"\' in books.b_name)>0", (err,res)=>{
                        if (err) throw err;
                        if(res.rows.length > 0){
                            console.log(200,JSON.stringify(res.rows))
                            response.status(200).send(JSON.stringify(res.rows));
                            return;
                        }
                        else{
                            console.log("401")
                            response.status(401).send("Not found");
                            return;
                        }
                    });
                }
                if(book == '' && author == ''){
                    config.query("SELECT * FROM books WHERE position(\'"+book+"\' in books.b_name)>0 AND position(\'"+author+"\' in books.author)>0", (err,res)=>{
                        if (err) throw err;
                        if(res.rows.length > 0){
                            console.log(200,JSON.stringify(res.rows))
                            response.status(200).send(JSON.stringify(res.rows));
                            return;
                        } else{
                            console.log("401")
                            response.status(401).send("Not found");
                            return;
                        }
                    });
                }

});

module.exports = router;