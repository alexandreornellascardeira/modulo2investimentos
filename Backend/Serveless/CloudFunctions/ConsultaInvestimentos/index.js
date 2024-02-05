/**
 * ORNELLAS         				04/02/2024 20:51				"ENDPOINT" para integração genêrica "Investiments" ( testes com o React )...
 */
'use strict';
const cors = require('cors')({ origin: true });

const { Pool } = require('pg');

// Configure the PostgreSQL connection parameters
const pool = new Pool({
  user: process.env.DB_USER,
  host: process.env.DB_HOST,
  database: process.env.DB_NAME,
  password: process.env.DB_PASS 
});

	
exports.getData = async (req, res) => {

  // Use the cors middleware to handle CORS headers
  cors(req, res, () => {
     doQuery(req,res);
 });

}

const   doQuery = async (req , res) => {

// Get the Authorization header from the request
  const authorizationHeader = req.headers['authorization'];

  // Check if the Authorization header is present
  if (!authorizationHeader) {
    return res.status(401).send('Unauthorized: No Authorization header');
  }

  // Assuming the Authorization header follows the format "Bearer <token>"
  const [bearer, token] = authorizationHeader.split(' ');

  // Check if the Authorization header starts with "Bearer"
  if (bearer !== 'Bearer' || !token) {
    return res.status(401).send('Unauthorized: Invalid Authorization header format');
  }

  // Now, 'token' contains the actual token that you can use in your function
  //console.log('Token:', token);
  
  
   if (token !== process.env.TOKEN) {
    
      const data = createMessage("NOK", "Autorização inválida!") ;
      res.send(data);
      
     return;
   }
  


  const denomSocial = req.body.investimento;
  const dtComptc = req.body.data


  if(process.env.VERBOSE_MODE==1){

	console.log(`Params: ${denomSocial} - ${dtComptc}`);

  }

  try {
    // Acquire a client from the connection pool
    const client = await pool.connect();

    // Begin a transaction
    await client.query('BEGIN');

    // Insert the JSON data into the PostgreSQL table
    const selectQuery = {
      text: `select * from cvm.get_perfil_mensal_fi(
			 $1,
			 $2);`,
      values: [
			 denomSocial,
			 dtComptc
		 ],
    };

    const result=await client.query(selectQuery);

    
  	if(process.env.VERBOSE_MODE==1){
  		console.log(result);
  	}


    // Convert the result to JSON
    const resultJson = result.rows.map(row => ({
      investimento: row.denom_social,
      data: row.dt_comptc,
      variacao_dia: parseFloat(row.pr_variacao_diaria_pl_ibovespa),
      variacao_ano: parseFloat(row.pr_variacao_diaria_pl_taxa_anual),
    }));


  	if(process.env.VERBOSE_MODE==1){
      console.log('Resultado da consulta:');
  		console.log(resultJson);
  	}


// Set the Content-Type header to indicate JSON response
    res.set('Content-Type', 'application/json');
    
     // Set CORS headers in the response
    res.set('Access-Control-Allow-Origin', '*');
    res.set('Access-Control-Allow-Methods', 'GET, POST, OPTIONS');
    res.set('Access-Control-Allow-Headers', 'Content-Type, Authorization');
    
    res.json(resultJson);

    // Commit the transaction
    await client.query('COMMIT');

    // Release the client back to the pool
    client.release();
 

  } catch (error) {
    res.status(500).json({ exception: error });
  }


	

};

