const express = require('express')
const router = express.Router()
const sqlFn = require('../mysql')
const remove = require('lodash/remove')

router.post('/add', function (req, res, next) {
    const sql = 'insert into product values (null,?,?,?,?,?,?,?,?)'
    const { name, type, attrs, mainPic, morePic, isOnShelf, price,descs } = req.body
    sqlFn(sql, [name, type, attrs, mainPic, morePic, isOnShelf, price,descs], function (err, data) {
        if (err) {
            next(err)
            return
        }
        if (data.affectedRows) {
            res.send({ code: '00000', success: true })
        }
    })



})
router.get('/list', function (req, res, next) {
    const { query } = req;
    const { current = 1, pageSize = 3 } = query;
    const sql = `select COUNT(*) as num from product 
    where  ${req.query.name ? 'locate(?,name)>0' : 'name is not null'}
    and ${req.query.type ? 'locate(?,type)>0' : 'type is not null'}`
    const arr=[]
    query.name?arr.push(query.name):null
    query.type?arr.push(query.type):null
    sqlFn(sql, arr, function (err, data) {
        if (err) {
            next(err)
            return
        }
        const total = data[0].num
        const sql = `select * from product  where  ${req.query.name ? 'locate(?,name)>0' : 'name is not null'}
        and ${req.query.type ? 'locate(?,type)>0' : 'type is not null'} limit ${pageSize * (current - 1)},${pageSize}`
        sqlFn(sql, arr, function (err, data) {
            if (err) {
                next(err)
                return
            }
            res.send({ code: '00000', records: data, pagination: { total, pageSize } })
        })
    })
})
router.post('/update', function (req, res, next) {
    const sql = 'update product set `name`=?,`type`=?,`attrs`=?,`mainPic`=?,`morePic`=? ,`isOnShelf`=?,`price`=?,`descs`=? where `id`=?'
    const { name, type, attrs, mainPic, morePic, isOnShelf,price,descs, id } = req.body
    sqlFn(sql, [name,  type, attrs, mainPic, morePic, isOnShelf,price,descs,  id], function (err, data) {
        if (err) {
            next(err)
            return
        }
        if (data.affectedRows) {
            res.send({ code: '00000', success: true })
        }
    })
})

router.post('/delete', function (req, res, next) {
    const sql = 'delete from product where `id`=?'
    sqlFn(sql, [req.body.id], function (err, data) {
        if (err) {
            next(err)
            return
        }
        if (data.affectedRows) {
            res.send({ code: '00000', success: true })
        }
    })
})

router.get('/relateMenus', function (req, res, next) {
    const sql = 'select * from menu where `isOfAdmin`=2'
    sqlFn(sql, [], function (err, data) {
        if (err) {
            next(err)
            return
        }
        const getMenuTree = (menus = []) => {
            menus.map(item => {
                menus.map(menu => {
                    if (item.pid == menu.id) {
                        menu.children = menu.children || []
                        menu.children.push(item)
                    }
                })
            })
            remove(menus, (menu) => menu.pid != -1)
            return menus
        }
        res.send({ code: '00000', records: getMenuTree(data) })
    })
})

router.post('/updateRelatedMenus', function (req, res, next) {
    const sql = 'update user set `relatedMenus`=? where `id`=?'
    const { relatedMenus, id } = req.body
    sqlFn(sql, [relatedMenus, id], function (err, data) {
        if (err) {
            next(err)
            return
        }
        if (data.affectedRows) {
            res.send({ code: '00000', success: true })
        }
    })
})

module.exports = router