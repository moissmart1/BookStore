const express = require('express');
const fs = require('fs');
const path = require('path');
const app = express();
let router = express.Router();
const config = require('./config.js');

app.use(express.json()); // body-parser middleware

router.post('/cart', (request,response) => {
    let user = request.body.user
    let isbn = request.body.id;
    config.query("SELECT books.number_in_stock FROM books WHERE ISBN=\'"+isbn+"\'", (err,res)=>{
        if(err)throw err;
        if(res.rows[0].number_in_stock>0){
            config.query("UPDATE books SET number_in_stock = number_in_stock - 1 WHERE isbn ="+isbn, (e,r)=>{
                if(e)throw e;
                config.query("SELECT * FROM books WHERE ISBN=\'"+isbn+"\'", (er,re)=>{
                    if (er)throw er;
                    config.query("SELECT * FROM cart WHERE u_id=\'"+user+"\' AND isbn="+isbn, (erro,ress)=>{
                        if (erro)throw erro;
                        if (ress.rows.length<=0){
                            config.query("INSERT INTO cart(U_ID,ISBN,quantity) VALUES (\'"+user+"\',"+isbn+",1)",(errr,ree)=>{
                                if (errr)throw errr;
                        });

                        }
                        else{
                            config.query("UPDATE cart SET quantity = quantity+1 WHERE isbn =\'"+isbn+"\' AND u_id=\'"+user+"\'",(errr,ree)=>{
                                if (errr)throw errr;
                            });
                        }
                    });
                    console.log(re.rows,200)
                    response.status(200).send(re.rows[0])
                    return;
                });

            });
        }else{
            response.status(401).send("false");
            return;
        }

    });


    
});

module.exports = router;