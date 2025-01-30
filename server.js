const express = require('express');
const path = require('path');
const app = express();
const port = process.env.PORT || 8080;

// Serve static files from the "public" directory
app.use(express.static(path.join(__dirname, 'public')));

// Set the view engine to EJS
app.set('view engine', 'ejs');

// Route to display the login page
app.get('/', (req, res) => {
  res.render('login');
});

// Listen for incoming requests
app.listen(port, () => {
  console.log(`Server running at http://localhost:${port}`);
});
