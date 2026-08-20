import express from "express";
import { inputCleaner, inputValidator } from "./middleware.js";

const app = express();

app.use(express.urlencoded({ extended: true }));

app.get("/", (req, res) => {
  res.redirect("/form");
});

app.get("/form", (req, res) => {
  res.sendFile("index.html", { root: "./public" });
});

app.post(
  "/submit",
  inputCleaner,
  inputValidator,
  (req, res) => {
    res.send(`
      Username: ${req.body.username}
      Comment: ${req.body.comment}
    `);
  }
);

app.listen(3000, () => {
  console.log("Server running at http://localhost:3000");
});
