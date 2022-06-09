var express = require('express');
var mysql = require('mysql');

var app = express(); 

app.use(express.json());

var con = mysql.createConnection({
    host: "localhost",
    user: "root",
    password: "",
    database: "ourmoney",
    multipleStatements: true
});

con.connect((err) => {
    if(err)
        throw err;
    console.log("mysql connected");

});

app.post('/login', (req, res) => {

    let table = "users";

    console.log("request")
    console.log(req.body);

    let email = req.body.email;
    let password = req.body.password;

    let query = "SELECT * FROM ?? WHERE email = ? AND password = ?";

    con.query(query, [table, email, password], (err, result) => {

        if(err) throw err;

        if(result != null){
            console.log("response");
            console.log(JSON.stringify(result[0]));
            res.status(200).send(JSON.stringify(result[0]));

        } else{
            res.status(404).send()
        }

    });

});

app.get('/th/:id', (req, res) => {

    let tables = "transactions";
    let key = req.params.id;

    let query = "SELECT * FROM ?? WHERE transaction_id = ?" 

    con.query(query, [tables, key], (err, result) => {

        if(err) throw err;

        if(result != null){

            let year = result[0].transaction_date.getFullYear().toString();
            let month = result[0].transaction_date.getMonth().toString().padStart(2, '0');
            let day = result[0].transaction_date.getDate().toString().padStart(2, '0');
            
            result[0].transaction_date = day + '/' + month + '/' + year;

            console.log("transaction header response");
            console.log(JSON.stringify(result[0]));
            res.status(200).send(JSON.stringify(result[0]));
        } else{
            res.status(404).send();
        }

    });

});

app.get('/th/payed/:id', (req, res) => {

    let tables = "transactions";
    let key = req.params.id;

    let query = "SELECT * FROM ?? WHERE user_id = ? AND payed = 1" 

    con.query(query, [tables, key], (err, results) => {

        if(err) throw err;

        if(results != null){

            for(let result of results){
                let year = result.transaction_date.getFullYear().toString();
                let month = result.transaction_date.getMonth().toString().padStart(2, '0');
                let day = result.transaction_date.getDate().toString().padStart(2, '0');
                
                result.transaction_date = day + '/' + month + '/' + year;
            }

            console.log("transaction header response");
            console.log(JSON.stringify(results));
            res.status(200).send(JSON.stringify(results));
        } else{
            res.status(404).send();
        }

    });

});

app.get('/td/:id', (req, res) => {

    let tables = "transaction_details";
    let sortColumn = "item_id"
    let key = req.params.id;

    let query = "SELECT * FROM ?? WHERE transaction_id = ? ORDER BY ?? ASC";

    con.query(query, [tables, key, sortColumn],(err, results) => {

        if(err) throw err;

        if(results != null){
            console.log("transaction detail search response");
            console.log(JSON.stringify(results))
            res.status(200).send(JSON.stringify(results));
        } else{
            res.status(404).send();
        }

    });

});

app.get('/it/:id', (req, res) => {

    let tables = "items";
    let key = req.params.id;

    let query = "SELECT * FROM ?? WHERE item_id = ?";

    con.query(query, [tables, key] ,(err, result) => {

        if(err) throw err;

        if(result != null){
            console.log("item search result response");
            console.log(JSON.stringify(result[0]));
            res.status(200).send(JSON.stringify(result[0]));
        } else{
            res.status(404).send();
        }

    });

});

app.get('/topup/user/:id', (req, res) => {

    let tables = "topup";
    let id = req.params.id;

    let query = "SELECT * FROM ?? WHERE user_id = ?";

    con.query(query, [tables, id] ,(err, results) => {

        if(err) throw err;

        if(results != null){
            console.log("top up by user_id response");
            console.log(JSON.stringify(results));
            res.status(200).send(JSON.stringify(results));
        } else{
            res.status(404).send();
        }

    });

});

app.post('/pay', (req, res) => {

    let tables = "transactions";
    let trans_key = req.body.trans_id;
    let query1 = "UPDATE ?? SET payed = 1 WHERE transaction_id = ?; ";

    let query2table = "users";
    let newBalance =  req.body.new_balance;
    let user_id = req.body.user_id;
    let query2 = "UPDATE ?? SET user_balance = ? WHERE user_id = ?;";

    let query = query1 + query2;

    con.query(query, [tables, trans_key, query2table, newBalance, user_id], (err, results) => {

        if(err) throw err;

        if(results[0].length != 0 && results[1].length){
            console.log("update successful");
            res.status(200).send("transaction status and user balance updated");
        } else{
            res.status(204).send("error occured");
        }

    });
});

app.get('/canteens/:id', (req, res) => {

    let table = "canteens";
    let canteen_id = req.params.id;
    let query = "SELECT * FROM ?? WHERE canteen_id = ?";

    con.query(query, [table, canteen_id], (err, result) => {

        if(err) throw err;

        if(result != null){
            console.log("canteen response");
            console.log(JSON.stringify(result[0]));
            res.status(200).send(JSON.stringify(result[0]));
        } else{
            res.status(204).send();
        }

    });

});


app.listen(8000, () => {
    console.log('listening on port 8000');
});