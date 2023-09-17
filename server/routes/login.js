const express = require("express");
const router = express.Router();
const sqlFn = require("../mysql");
const CryptoJs = require("crypto-js");
const jwt = require("jsonwebtoken");
const { jwtSecret } = require("../config");

router.post("", function (req, res, next) {
  const sql = "select * from user where `account`=? and `password`=?";
  const password = CryptoJs.AES.decrypt(req.body.password, "12345678").toString(
    CryptoJs.enc.Utf8
  );
  console.log(password);
  sqlFn(sql, [req.body.account, password], function (err, data) {
    if (err) {
      next(err);
      return;
    }
    console.log(data);
    if (data && data.length) {
      const token = jwt.sign(
        {
          account: data[0].account,
        },
        jwtSecret
      );
      res.send({ code: "00000", success: true, token });
    } else {
      res.send({
        code: "-1",
        message: "Username or password is not correct !",
      });
    }
  });
});
module.exports = router;
