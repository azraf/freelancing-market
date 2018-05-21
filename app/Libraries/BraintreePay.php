<?php

namespace Libs;
include_once ROOTPATH . '/vendor/braintree/braintree_php/lib/Braintree.php';

//require_once 'PATH_TO_BRAINTREE/lib/Braintree.php';

use \Braintree;

class BraintreePay
{
    public $tree;

//    public function __construct()
//    {
//        $this->tree = new Braintree;
//        Braintree\Configuration::environment(BT_ENVIRONMENT);
//        Braintree\Configuration::merchantId(BT_MERCHANT_ID);
//        Braintree\Configuration::publicKey(BT_PUBLIC_KEY);
//        Braintree\Configuration::privateKey(BT_PRIVATE_KEY);
//    }

    public static function addFund($amount)
    {
//        $this->tree = new Braintree;
        Braintree\Configuration::environment(BT_ENVIRONMENT);
        Braintree\Configuration::merchantId(BT_MERCHANT_ID);
        Braintree\Configuration::publicKey(BT_PUBLIC_KEY);
        Braintree\Configuration::privateKey(BT_PRIVATE_KEY);

        /**
         * Braintree_Transaction::sale([
        'amount' => '1000.00',
        'paymentMethodNonce' => 'nonceFromTheClient',
        'options' => [ 'submitForSettlement' => true ]
        ]);
         */
//        $result = Braintree\Transaction::sale([
////            'amount' => '1000.00',
//            'amount' => $amount,
//            'paymentMethodNonce' => 'nonceFromTheClient',
//            'options' => [ 'submitForSettlement' => true ]
//        ]);
//        $result = Braintree_Transaction::sale([
        $result = Braintree\Transaction::sale([
//            'amount' => '10.00',
            'amount' => $amount,
            'paymentMethodNonce' => 'fake-valid-nonce',
            'options' => [
                'submitForSettlement' => True
            ]
        ]);

        return $result;
//
//        if ($result->success) {
//            print_r("success!: " . $result->transaction->id);
//        } else if ($result->transaction) {
//            print_r("Error processing transaction:");
//            print_r("\n  code: " . $result->transaction->processorResponseCode);
//            print_r("\n  text: " . $result->transaction->processorResponseText);
//        } else {
//            print_r("Validation errors: \n");
//            print_r($result->errors->deepAll());
//        }
    }
}

?>