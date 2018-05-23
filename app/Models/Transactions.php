<?php
namespace Models;

use \Illuminate\Database\Eloquent\Model;

class Transactions extends Model
{

    //    public $timestamps = false;
    protected $table = 'transactions';
    protected $fillable = [
        'userid'
        , 'membershipid'
        , 'withdrawalid'
        , 'freelancerid'
        , 'paymentid'
        , 'jobid'
        , 'hash'
        , 'payment'
        , 'deposit'
        , 'locked'
        , 'pending'
        , 'balance'
        , 'complete'
        , 'transaction_type'
        , 'paypal'
        , 'created_at'
        , 'updated_at'
    ];

    public function user()
    {
        return $this->belongsTo('Models\User', 'userid','id');
    }

    public function lastTranByUser($id)
    {
        return $this->hasOne('Models\User', 'userid', 'id') ->where('users.id','=',$id)
            ->orderBy('id','desc')
            ->limit(1)
            ->get()
            ->toArray();
    }

    /**
     * @param $userId
     * @return mixed
     *
     * $trans  =  new Transactions();
    $account = $trans->lastTransection($userid);
     * $account['balance']
     */
    public function lastTransection($userId)
    {
        return $this->where('userid','=', $userId)
            ->get()
            ->last()
            ->toArray()
            ;
    }

    public function balanceCheck($userId)
    {
        $data = $this->where('userid','=', $userId)
            ->get();
        if(count($data)){
            return $data->last()->toArray();
        }
        return ['locked'=>0,'pending'=>0,'balance'=>0];
    }


    public function matchPending($userid, $jobid)
    {
        return $this->where('userid','=', $userid)
                    ->where('jobid','=', $jobid)
                    ->where('complete','=', 0)
            ->get()
            ->last()
            ->toArray()
            ;
    }
    public function matchPending2($userid, $jobid)
    {
//        DB::table('users')->where('username', $username)->pluck('groupName');
        return $this->where('userid','=', $userid)
                    ->where('jobid','=', $jobid)
                    ->where('complete','=', 0)
            ->pluck('groupName','')
            ;
    }

//    public function scopeLastTrans($query, $userId)
//    {
//        return $query->where('userid','=', $userId)
//            ->orderBy('id','desc')
//            ->get()
//            ->toArray()
//            ;
//    }

    public function freelancer()
    {
        return $this->belongsTo('Models\User', 'freelancerid','id');
    }
    public function job()
    {
        return $this->belongsTo('Models\Job', 'jobid','id');
    }
}
?>