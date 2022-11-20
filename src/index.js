const express = require('express');
const app = express();
const fs = require('fs');

// http://localhost:3000/
app.get('/', async (req, res)=>{
    try {
        msg = "Hello World";
        res.status(200).json({
            msg
        });        
        } 
    catch (error) {
        console.log(error);
        res.status(400).json({
            msg: 'error', error
        });
    }
});


// http://localhost:3000/phones
app.get('/phones', async (req, res)=>{
    try {
        phones = ["+380501234567", "+380501234568", "+380501234569"];
        res.status(200).json({
            phones
        });        
        } 
    catch (error) {
        console.log(error);
        res.status(400).json({
            msg: 'error', error
        });
    }
});


app.get('*', (req, res)=>{
    res.status(200).json({
        msg: "This Route is not Valid"
    });
});

app.listen(3000, ()=>{
    console.log('Server on port 3000')
})