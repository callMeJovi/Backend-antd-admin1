const express = require('express')
const router = express.Router()
const sqlFn = require('../mysql')
const remove = require('lodash/remove')

router.get('/menuList', function (req, res, next) {
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
    
    if (req.authData.account == 'admin') {
        const sql = 'select * from menu'
        sqlFn(sql, [], function (err, data) {
            if (err) {
                next(err)
                return
            }

            res.send({ code: '00000', records: getMenuTree(data) })
        })
        return
    }
    const sql = 'select * from user where `account`=?'
    sqlFn(sql, [req.authData.account], function (err, data) {
        if (err) {
            next(err)
            return
        }
        if (data && data.length) {
            let sql = 'select * from menu where '
            const menuIds = (data[0].relatedMenus || '').split(',')
            menuIds.map((item, index) => {
                sql += `id=${item} ${index == menuIds.length - 1 ? '' : 'or '}`
            })
            sqlFn(sql, [], function (err, data) {
                if (err) {
                    next(err)
                    return
                }
                res.send({ code: '00000', records: getMenuTree(data) })
            })
        }
    })

})

module.exports = router