const express = require('express');
const router = express.Router();
const coc = require('../services/coc');


router.post('/login', async function (req, res, next) {
    const { login, password } = req.body;
    try {
        const loginResult = await coc.getLogin(login, password);
        res.json(loginResult);
    } catch (err) {
        console.error(`Error while logging in`, err.message);
        next(err);
    }
});

router.get('/getAllWorkers', async function (req, res, next) {
    try {
        res.json(await coc.getAllWorkers(req.auth.accounts));
    } catch (err) {
        console.error(`Error while getting users `, err.message);
        next(err);
    }
});

router.put('/updateWorkerDetails/:workerId', async function (req, res, next) {
    const workerId = req.params.workerId;
    const { accountId, newWorkContext, newWorkEnd } = req.body;

    try {
        const result = await coc.updateWorkerDetails(req.auth.accounts, workerId, newWorkContext, newWorkEnd);
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
