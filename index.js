// index.js
// where your node app starts

// init project
var express = require('express');
var app = express();

// enable CORS (https://en.wikipedia.org/wiki/Cross-origin_resource_sharing)
// so that your API is remotely testable by FCC 
var cors = require('cors');
app.use(cors({optionsSuccessStatus: 200}));  // some legacy browsers choke on 204

// http://expressjs.com/en/starter/static-files.html
app.use(express.static('public'));

// http://expressjs.com/en/starter/basic-routing.html
app.get("/", function (req, res) {
  res.sendFile(__dirname + '/views/index.html');
});


// your first API endpoint... 
app.get("/api/hello", function (req, res) {
  res.json({greeting: 'hello API'});
});
app.get("/api/:date?",function(req,res)
{
  const dateParam = req.params.date;

  // Create a new Date object based on the date parameter
  let date;
  if (!isNaN(dateParam)) {
      // If the date parameter is a valid number (Unix timestamp)
      date = new Date(parseInt(dateParam));
  } else {
      // If the date parameter is a valid date string
      date = new Date(dateParam);
  }

  // Check if the date object is valid
  if (!isNaN(date.getTime())) {
      // If the date object is valid, construct the response
      const unixTime = date.getTime();
      const utcTime = date.toUTCString();
      res.json({ unix: unixTime, utc: utcTime });
  } else {
      // If the date object is invalid, return an error message
      res.json({ error: 'Invalid date' });
  }
})



// Listen on port set in environment variable or default to 3000
var listener = app.listen(process.env.PORT || 3000, function () {
  console.log('Your app is listening on port ' + listener.address().port);
});
