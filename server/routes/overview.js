const express = require("express");
const router = express.Router();
const sqlFn = require("../mysql");

router.get("/statistic", function (req, res, next) {
  const sql = "select * from statistics";
  sqlFn(sql, [], function (err, data) {
    if (err) {
      next(err);
      return;
    }
    res.send({ code: "00000", record: data[0] });
  });
});

router.get("/product", function (req, res, next) {
  //producttypesales
  const sql = "select * from product";
  sqlFn(sql, [], function (err, data) {
    if (err) {
      next(err);
      return;
    }
    res.send({ code: "00000", records: data });
  });
});
router.get("/mapsales", function (req, res, next) {
  const sql = "select * from mapsales";
  sqlFn(sql, [], function (err, data) {
    if (err) {
      next(err);
      return;
    }
    res.send({ code: "00000", records: data });
  });
});
router.get("/salestop10", function (req, res, next) {
  const sql = "select * from salestop10";
  sqlFn(sql, [], function (err, data) {
    if (err) {
      next(err);
      return;
    }
    res.send({ code: "00000", records: data });
  });
});
router.get("/volumetop10", function (req, res, next) {
  const sql = "select * from volumetop10";
  sqlFn(sql, [], function (err, data) {
    if (err) {
      next(err);
      return;
    }
    res.send({ code: "00000", records: data });
  });
});

router.get("/salestrend", function (req, res, next) {
  const sql = "select * from salestrend where `type`=?";
  sqlFn(sql, [req.query.type], function (err, data) {
    if (err) {
      next(err);
      return;
    }
    res.send({ code: "00000", records: data });
  });
});
router.get("/trending", function (req, res, next) {
  const sql = "select * from trending ";
  sqlFn(sql, [], function (err, data) {
    if (err) {
      next(err);
      return;
    }
    res.send({ code: "00000", records: data });
  });
});
module.exports = router;
