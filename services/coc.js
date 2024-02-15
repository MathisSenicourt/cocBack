const db = require('./db');
const helper = require('../helper');
const jwt = require('jsonwebtoken');

function generateToken(accounts, expireIn) {
    const secretKey = 'COCGameZone';
    const payload = {accounts};
    const options = {expiresIn: expireIn};
    return jwt.sign(payload, secretKey, options);
}

async function getLogin(login, password) {
    console.log("ahahaaaaaaaaaaaaaaaaaaaa "+login+password)
    const accountResult = await db.query('SELECT a.account_id FROM accounts a INNER JOIN logins l ON a.user_login = l.user_login WHERE l.user_login = ? && l.password = ?', [login, password]);
    const accounts = accountResult.reduce((acc, row) => {
        acc[row.account_id] = row.account_id;
        return acc;
    }, {});
    const accountIds = Object.keys(accounts);
    console.log(accountIds)
    if (accountIds && accountIds.length > 0) {
        return {
            success: true,
            message: 'User found',
            accessToken: generateToken(accounts, '2h'),
            refreshToken: generateToken(accounts, '72h'),
        };
    } else {
        return {
            success: false,
            message: 'User not found'
        };
    }
}


async function getAllWorkers() {
    const rows = await db.query(
        `SELECT *
         FROM worker_list
         ORDER BY work_end`
    );
    const data = helper.emptyOrRows(rows);

    return {
        data
    };
}

async function updateWorkerDetails(workerId, newWorkContext, newWorkEnd) {
    const updateResult = await db.query(
        `UPDATE worker_list
         SET work_context = ?,
             work_end = ?
         WHERE worker_id = ?`,
        [newWorkContext, newWorkEnd, workerId]
    );

    return {
        success: updateResult.affectedRows > 0,
    };
}

module.exports = {
    getLogin,
    getAllWorkers,
    updateWorkerDetails,
};
