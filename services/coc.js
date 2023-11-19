const db = require('./db');
const helper = require('../helper');

async function getAllWorkers() {
    const rows = await db.query(
        `SELECT * FROM worker_list ORDER BY work_end`
    );
    const data = helper.emptyOrRows(rows);

    return {
        data
    };
}

async function updateWorkerDetails(workerId, newWorkContext, newWorkEnd) {
    const updateResult = await db.query(
        `UPDATE worker_list SET work_context = ?, work_end = ? WHERE worker_id = ?`,
        [newWorkContext, newWorkEnd, workerId]
    );

    return {
        success: updateResult.affectedRows > 0,
    };
}

module.exports = {
    getAllWorkers,
    updateWorkerDetails,
};
