const express = require('express');
const router = express.Router();
const parseUrl = express.urlencoded({extended: false});
const parseJson = express.json({extended: false});
const authControllers = require('../controllers/authcontrollers');


router.post('/signup', authControllers.signup_post);
router.post('/login', authControllers.login_post);
router.post('/forget', authControllers.forget);
router.post('/changePassword', authControllers.changePass);
router.post('/signup_otp_compare', authControllers.signup_otp_compare);
// router.post('/compare', authControllers.compare);
router.get('/product', authControllers.product_get);
router.post('/personal_info', authControllers.personal_info);
router.post('/update_profile', authControllers.update_profile);
router.post('/order', authControllers.order_post);
router.post('/order_get_bydate', authControllers.order_get_bydate);
router.get('/sendsms', authControllers.sendSms);

router.post('/paynow', [parseUrl, parseJson], authControllers.paynow_post);
router.post("/callback", authControllers.callback);


module.exports = router;
