import express from 'express';

const app = express();

app.get('/secret', (req, res) => {
  res.send(`The secret is ${process.env.ENV_VAR}`);
});

app.listen(80, () => {
  console.log('Server is running on port 80');
});