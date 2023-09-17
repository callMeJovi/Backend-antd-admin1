const express = require("express");
const app = express();
const menu = require("./routes/menu");
const main = require("./routes/main");
const area = require("./routes/area");
const user = require("./routes/user");
const upload = require("./routes/upload");
const login = require("./routes/login");
const product = require("./routes/product");
const overview = require("./routes/overview");
const bodyParser = require("body-parser");
const validIsLogin = require("./middleware");

app.use(express.static("./data"));
app.use(bodyParser.json());
app.use("/api/login", login);
app.use(validIsLogin);
app.use("/api/menu", menu);
app.use("/api/main", main);
app.use("/api/area", area);
app.use("/api/user", user);
app.use("/api/upload", upload);
app.use("/api/product", product);
app.use("/api/overview", overview);

app.use(function (err, req, res, next) {
  console.info(err.stack);
  res.status("500").send("Server Error");
});

app.listen("3030", function () {
  console.log("Server is connected to port 3030");
});
