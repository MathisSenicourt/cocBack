const express = require('express');
const router = express.Router();
const coc = require('../services/coc');


router.get('/getAllWorkers', async function (req, res, next) {
    try {
        res.json(await coc.getAllWorkers());
    } catch (err) {
        console.error(`Error while getting users `, err.message);
        next(err);
    }
});

router.put('/updateWorkerDetails/:workerId', async function (req, res, next) {
    const workerId = req.params.workerId;
    const { newWorkContext, newWorkEnd } = req.body;

    try {
        const result = await coc.updateWorkerDetails(workerId, newWorkContext, newWorkEnd);
        if (result.success) {
            res.json({ success: true, message: `Worker details updated successfully for worker ID: ${workerId}` });
        } else {
            res.status(404).json({ success: false, message: `Worker not found with ID: ${workerId}` });
        }
    } catch (err) {
        console.error(`Error while updating worker details`, err.message);
        next(err);
    }
});

module.exports = router;
