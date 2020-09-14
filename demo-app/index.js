const express = require('express');

const app = express();
const port = 4000;

app.get('/liveness', (req, res, next) => {
  res.sendStatus(200);
});

app.get('/', (req, res, next) => {
  res.send('Hello, world!');
});

app.listen(port, () => console.log(`App started at http://localhost:${port}`));
