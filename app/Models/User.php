<?php
namespace Models;

use \Illuminate\Database\Eloquent\Model;

class User extends Model
{
    protected $table = 'auth_users';
    protected $fillable = [
          'userid'
        , 'username'
        , 'password'
        , 'salt'
        , 'name'
        , 'email'
        , 'address'
        , 'phone'
        , 'country_id'
        , 'imagelocation'
        , 'bgimage'
        , 'tokencode'
        , 'payment_deposit'
        , 'payment_withdraw'
        , 'joined'
        , 'active'
        , 'delete_remove'
        , 'user_type'
        , 'membershipid'
        , 'membership_bids'
        , 'membership_date'
        , 'schedule_payments'
    ];
    public function country()
    {
        return $this->belongsTo('Models\Regions', 'country_id','id');
    }

    public function countryName()
    {
        return $this->belongsTo('Models\Regions', 'country_id','id')->select('id','name','zone_name','code');
    }

    public function transactions()
    {
        return $this->hasMany('Models\Transactions', 'userid','id');
    }

    public function lastTransaction()
    {
        return $this->hasOne('Models\Transactions', 'userid','id')->orderBy('id','desc')->limit(1);
    }

    public function balance()
    {
        $trans = new Transactions;
        $account =  $trans->balanceCheck($this->id);
        return $account['balance'];
    }

    public function account()
    {
        $trans = new Transactions;
        return $trans->balanceCheck($this->id);
    }

    public function proofpending()
    {
        return $this->hasMany('Models\ProofSubmit', 'freelancerid','id')->where('client_approve','=',0)->where('status','=',1)->orderBy('id','desc');
    }

    public function proofsaccepted()
    {
        return $this->hasMany('Models\ProofSubmit', 'freelancerid','id')->where('client_approve','=',1)->where('status','=',1)->orderBy('id','desc');
    }

}
?>