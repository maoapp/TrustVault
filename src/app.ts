import express from 'express';

const app = express();

app.use(express.json());

// TODO: Add deposit route

const PORT = 3000;
app.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}`);
});
