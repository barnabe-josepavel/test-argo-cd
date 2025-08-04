import express from 'express';

const app = express();

app.get('/secret', (req, res) => {
  res.send(process.env["my-secret"]);
});

app.listen(80, () => {
  console.log('Server is running on port 80');
});