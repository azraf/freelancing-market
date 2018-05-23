<?php
namespace Models;

use \Illuminate\Database\Eloquent\Model;

class PaymentSettings extends Model
{
    protected $table = 'payments_settings';
    protected $fillable = [
                              'currency'
                            , 'paypal_client_id'
                            , 'paypal_secret'
                            , 'stripe_secret_key'
                            , 'BT_ENVIRONMENT'
                            , 'BT_MERCHANT_ID'
                            , 'BT_PUBLIC_KEY'
                            , 'BT_PRIVATE_KEY'
                            , 'stripe_publishable_key'
                            , 'off_paypal'
                            , 'off_payoneer'
                            , 'off_payza'
                            , 'off_neteller'
                            , 'off_skrill'
                            , 'membershipid'
                            , 'jobs_cost'
                            , 'jobs_pay_limit'
                            , 'bids_cost'
                            , 'bids_limit'
                            , 'jobs_percentage'
                        ];

    public function currencyInfo()
    {
        return $this->belongsTo('Models\Currency', 'currency');
    }

    public function Symbol()
    {
        $curr = Currency::find($this->currency);
        return $curr->currency_symbol ;
    }
}
?>