import express from "express";

const app = express();

app.use(express.json());

app.get("/", (_, response) => {
  return response.status(200).json({ message: "Hello World" });
});

export default app;
