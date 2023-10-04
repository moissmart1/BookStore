const express = require('express');
const config = require('./config.js');
const fs = require('fs');
const path = require('path');
const { send } = require('express/lib/response.js');
const app = express();
let router = express.Router();

app.use(express.json()); // body-parser middleware

router.post('/', (request,response) => {

    let username = request.body.username.toLowerCase();
    let password = request.body.password.toLowerCase();
    let confirmp = request.body.confirm_password.toLowerCase();
    let user_address = request.body.address.toLowerCase();
    let user_billing_address = request.body.billing_address.toLowerCase();
    var a;
    var b;

    if(username == ""){
        response.status(401).send("Not valid user");
    }
    else if(request.body.password == ""){
        response.status(401).send("Not valid");
    }
    else if(password !== confirmp){
        response.status(401).send("Wrong password");
    }
    
    else{
        config.query('SELECT U_id,U_name,U_password From users Where U_name=\''+username+"\'", (err,res)=>{
            console.log(err,res)
            if(err) throw err;
            if(res.rows.length < 0){
                console.log("401")
                response.status(401).send("Username taken");
                return;
                                 
            }

            else if(res.rows.length == 0){      
                 config.query("SELECT A_ID FROM address WHERE address=\'"+user_billing_address+"\'", (e,resulter)=>{
                    if(e) throw e;
                        config.query("INSERT INTO address(address) VALUES (\'"+user_billing_address+"\')", (error_bb,create_b)=>{
                            
                            config.query("SELECT A_ID FROM address WHERE address=\'"+user_billing_address+"\'", (error_id,res_id)=>{
                                if(error_id) throw error_id;
                                b=res_id.rows[0].a_id;
                                if(resulter.rows.length > 0){
                                    b=resulter.rows[0].a_id;
                                }
                                config.query("SELECT A_ID FROM address WHERE address=\'"+user_address+"\'", (erro,r)=>{
                    
                                    if(erro) throw erro;
                                        config.query("INSERT INTO address(address) VALUES (\'"+user_address+"\')", (error_b_,create_b_)=>{
                                            config.query("SELECT A_ID FROM address WHERE address=\'"+user_address+"\'", (error_id_,res_id_)=>{
                                                if(error_id_) throw error_id_;
                                                a=res_id_.rows[0].a_id;
                                                if(r.rows.length > 0){
                                                    a=r.rows[0].a_id;}
                                                config.query("INSERT INTO users(U_name,billing_address,address,U_password,Admin_privilege) VALUES (\'"+username+"\',\'"+b+"\',\'"+a+"\',\'"+password+"\',FALSE)", (error_b,ress)=>{
                                                    if(error_b) throw error_b;
                                                    console.log("200")
                                                    response.status(200).send();
                                                });
                                            }); 
                                        });
                        
                                })
                            });
                                
                        });

                    


                })


            }else{
                console.log("401")
                response.status(401).send("Username taken");
                return;
             }


});


    }
});

module.exports = router;
