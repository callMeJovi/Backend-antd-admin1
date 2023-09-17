const jwt = require("jsonwebtoken");
const { jwtSecret } = require("../config");

function validIsLogin(req, res, next) {
  const authToken = req.headers["authorization"];
  jwt.verify(authToken, jwtSecret, function (err, decode) {
    if (err) {
      res.send({ code: "102", message: "Please log in first." });
    } else {
      req.authData = decode;
      next();
    }
  });
}

module.exports = [validIsLogin];
