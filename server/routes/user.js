const express = require("express");
const router = express.Router();
const sqlFn = require("../mysql");
const remove = require("lodash/remove");
const { createPassword } = require("../utils");

router.post("/add", function (req, res, next) {
  const sql = "select * from user where locate(?,account)>0";
  sqlFn(sql, [req.body.account], function (err, data) {
    if (err) {
      next(err);
      return;
    }
    if (data && data.length) {
      res.send({ code: "-1", message: "User already exists" });
    } else {
      const sql = "insert into user values (null,?,?,?,?,?,?,?,?)";
      const { name, account, area, tel, email, picture, relatedMenus } =
        req.body;
      sqlFn(
        sql,
        [
          name,
          account,
          area,
          tel,
          email,
          picture,
          relatedMenus,
          createPassword(8),
        ],
        function (err, data) {
          if (err) {
            next(err);
            return;
          }
          if (data.affectedRows) {
            res.send({ code: "00000", success: true });
          }
        }
      );
    }
  });
});
router.get("/list", function (req, res, next) {
  const { query } = req;
  const { current = 1, pageSize = 5 } = query;
  const sql = `select COUNT(*) as num from user where account!='admin' ${
    req.query.name ? "and locate(?,name)>0" : ""
  }`;
  sqlFn(sql, [query.name], function (err, data) {
    if (err) {
      next(err);
      return;
    }
    const total = data[0].num;
    const sql = `select * from user where account!='admin' ${
      req.query.name ? "and locate(?,name)>0" : ""
    } limit ${pageSize * (current - 1)},${pageSize}`;
    sqlFn(sql, [req.query.name], function (err, data) {
      if (err) {
        next(err);
        return;
      }
      res.send({
        code: "00000",
        records: data,
        pagination: { total, pageSize },
      });
    });
  });
});
router.post("/update", function (req, res, next) {
  const sql =
    "update user set `name`=?,`account`=?,`area`=?,`tel`=?,`email`=? ,`picture`=? where `id`=?";
  const { name, account, area, tel, email, picture, id } = req.body;
  sqlFn(
    sql,
    [name, account, area, tel, email, picture, id],
    function (err, data) {
      if (err) {
        next(err);
        return;
      }
      if (data.affectedRows) {
        res.send({ code: "00000", success: true });
      }
    }
  );
});

router.post("/delete", function (req, res, next) {
  const sql = "delete from user where `id`=?";
  sqlFn(sql, [req.body.id], function (err, data) {
    if (err) {
      next(err);
      return;
    }
    if (data.affectedRows) {
      res.send({ code: "00000", success: true });
    }
  });
});

router.get("/relateMenus", function (req, res, next) {
  const sql = "select * from menu where `isOfAdmin`=2";
  sqlFn(sql, [], function (err, data) {
    if (err) {
      next(err);
      return;
    }
    const getMenuTree = (menus = []) => {
      menus.map((item) => {
        menus.map((menu) => {
          if (item.pid == menu.id) {
            menu.children = menu.children || [];
            menu.children.push(item);
          }
        });
      });
      remove(menus, (menu) => menu.pid != -1);
      return menus;
    };
    res.send({ code: "00000", records: getMenuTree(data) });
  });
});

router.post("/updateRelatedMenus", function (req, res, next) {
  const sql = "update user set `relatedMenus`=? where `id`=?";
  const { relatedMenus, id } = req.body;
  sqlFn(sql, [relatedMenus, id], function (err, data) {
    if (err) {
      next(err);
      return;
    }
    if (data.affectedRows) {
      res.send({ code: "00000", success: true });
    }
  });
});

module.exports = router;
