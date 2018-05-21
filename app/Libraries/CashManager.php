<?php
namespace Libs;

use Models\Transactions;
use Models\User;

class CashManager
{
    /**
     * @param $uid
     * @param $data = []
     *  accept only one Param:
     */
    public static function addFund($id,$amount,$retId=false)
    {
        if(is_numeric($id)){
            $uid = $id;
        } else {
            $uid =  User::where('userid','=', $id)->first()->id;
        }
        $currentTrans = new Transactions;
        $balance = $currentTrans->balanceCheck($uid);

        $newTrans = new Transactions;
        $newTrans->userid = $uid;
        $newTrans->deposit = $amount;
        $newTrans->locked =  $balance['locked'];
        $newTrans->pending = $balance['pending'];
        $newTrans->balance = $balance['balance'] + $amount;
        $newTrans->comment = 'Fund Added by Admin';
        $newTrans->complete = 1;

        if($newTrans->save()){
            if($retId){
                return $newTrans->id;
            }
            return true;
        }
        return false;
    }

    public static function postTrans($id,$jobid,$budget)
    {
        if(is_numeric($id)){
            $uid = $id;
        } else {
            $uid =  User::where('userid','=', $id)->first()->id;
        }
        $currentTrans = new Transactions;
        $balance = $currentTrans->balanceCheck($uid);

        $newTrans = new Transactions;
        $newTrans->userid = $uid;
        $newTrans->jobid = $jobid;
        $newTrans->payment = $budget;
        $newTrans->locked =  $balance['locked'];
        $newTrans->pending = $balance['pending'];
        $newTrans->balance = $balance['balance'] - $budget;
        $newTrans->comment = 'Balance Adjusted as Posting Cancelled for job #'. $id ;
        $newTrans->complete = 1;

        if($newTrans->save()){
            return true;
        }
        return false;
    }


    public static function delJobTrans($id,$jobid,$budget)
    {
        if(is_numeric($id)){
            $uid = $id;
        } else {
            $uid =  User::where('userid','=', $id)->first()->id;
        }
        $currentTrans = new Transactions;
        $balance = $currentTrans->balanceCheck($uid);

        $newTrans = new Transactions;
        $newTrans->userid = $uid;
        $newTrans->jobid = $jobid;
        $newTrans->deposit = $budget;
        $newTrans->locked =  $balance['locked'];
        $newTrans->pending = $balance['pending'];
        $newTrans->balance = $balance['balance'] + $budget;
        $newTrans->comment = 'Posting cost for Job#' . $jobid;
        $newTrans->complete = 0;

        if($newTrans->save()){
            return true;
        }
        return false;
    }

    public static function submitProof($id,$jobid,$budget)
    {
        if(is_numeric($id)){
            $uid = $id;
        } else {
            $uid =  User::where('userid','=', $id)->first()->id;
        }
        $currentTrans = new Transactions;
        $balance = $currentTrans->balanceCheck($uid);

        $newTrans = new Transactions;
        $newTrans->userid = $uid;
        $newTrans->jobid = $jobid;
        $newTrans->deposit = $budget;
        $newTrans->locked =  $balance['locked'];
        $newTrans->pending = $balance['pending'] + $budget;
        $newTrans->balance = $balance['balance'];
        $newTrans->comment = 'Balance Added to Pending as Submitted job #' . $jobid;
        $newTrans->complete = 0;

        if($newTrans->save()){
            return true;
        }
        return false;
    }

    public static function confirmProof($id,$jobid,$budget)
    {
        if(is_numeric($id)){
            $uid = $id;
        } else {
            $uid =  User::where('userid','=', $id)->first()->id;
        }
        $currentTrans = new Transactions;
        $balance = $currentTrans->balanceCheck($uid);

        $newTrans = new Transactions;
        $newTrans->userid = $uid;
        $newTrans->jobid = $jobid;
        $newTrans->deposit = $budget;
        $newTrans->locked =  $balance['locked'];
        $newTrans->pending = $balance['pending'] - $budget;
        $newTrans->balance = $balance['balance'] + $budget;
        $newTrans->comment = 'Balance Adjusted as Client Approved job#' . $jobid;
        $newTrans->complete = 1;

        if($newTrans->save()){
            return true;
        }
        return false;
    }

    public static function cancelProof($id,$jobid,$budget)
    {
        if(is_numeric($id)){
            $uid = $id;
        } else {
            $uid =  User::where('userid','=', $id)->first()->id;
        }
        $currentTrans = new Transactions;
        $balance = $currentTrans->balanceCheck($uid);

        $newTrans = new Transactions;
        $newTrans->userid = $uid;
        $newTrans->jobid = $jobid;
        $newTrans->deposit = $budget;
        $newTrans->locked =  $balance['locked'];
        $newTrans->pending = $balance['pending'] - $budget;
        $newTrans->balance = $balance['balance'];
        $newTrans->comment = 'Balance Adjusted as Client Approved job#' . $jobid;
        $newTrans->complete = 1;

        if($newTrans->save()){
            return true;
        }
        return false;
    }

    public static function reqWithdraw($id,$withdrawid,$budget)
    {
        if(is_numeric($id)){
            $uid = $id;
        } else {
            $uid =  User::where('userid','=', $id)->first()->id;
        }
        $currentTrans = new Transactions;
        $balance = $currentTrans->balanceCheck($uid);

        $newTrans = new Transactions;
        $newTrans->userid = $uid;
        $newTrans->withdrawalid = $withdrawid;
        $newTrans->payment = $budget;
        $newTrans->locked =  $balance['locked'];
        $newTrans->pending = $balance['pending'];
        $newTrans->balance = $balance['balance'] - $budget;
        $newTrans->comment = 'Balance Adjusted for withdrawal Request Payment#' . $withdrawid;
        $newTrans->complete = 0;

        if($newTrans->save()){
            return true;
        }
        return false;
    }

    public static function reqWithdrawDecline($id,$budget,$wid,$time)
    {
        if(is_numeric($id)){
            $uid = $id;
        } else {
            $uid =  User::where('userid','=', $id)->first()->id;
        }
        $currentTrans = new Transactions;
        $balance = $currentTrans->balanceCheck($uid);

        $newTrans = new Transactions;
        $newTrans->userid = $uid;
        $newTrans->withdrawalid = $wid;
        $newTrans->deposit = $budget;
        $newTrans->locked =  $balance['locked'];
        $newTrans->pending = $balance['pending'];
        $newTrans->balance = $balance['balance'] + $budget;
        $newTrans->comment = 'Balance Adjusted for Request Declined of withdrawal#' . $wid;
        $newTrans->complete = 0;

        if($newTrans->save()){
            return true;
        }
        return false;
    }

    public static function balance($uid,$data=false)
    {
        $currentTrans = new Transactions;
        $balance = $currentTrans->balanceCheck($uid);
        if(!$data){
            return $balance;
        }

        $newTrans = new Transactions;
        if(isset($data['jobid'])){
            $newTrans->jobid = $data['jobid'];
        }
        if(isset($data['payment'])){
            $newTrans->payment = $data['payment'];
        }
        if(isset($data['deposit'])){
            $newTrans->deposit = $data['deposit'];
        }


//        if(isset($data['jobid'])){
//            $newTrans->jobid = $data['jobid'];
//        }
//        if(isset($data['jobid'])){
//            $newTrans->jobid = $data['jobid'];
//        }if(isset($data['jobid'])){
//            $newTrans->jobid = $data['jobid'];
//        }
//        if(isset($data['jobid'])){
//            $newTrans->jobid = $data['jobid'];
//        }

        $locked = isset($data['locked']) ? $data['locked'] : 0;
        $pending = isset($data['pending']) ? $data['pending'] : 0;
        $balance = isset($data['balance']) ? $data['balance'] : 0;


        $newTrans->payment = $balance['payment'];
        $newTrans->deposit = $balance['deposit'];
        $newTrans->locked = $balance['locked'];
        $newTrans->pending = $balance['pending'] - $data['payment'];
        $newTrans->balance = $balance['balance'];
        $newTrans->comment = 'Balance Adjusted as Client Approved job#'. $data['jobid'] ;
        $newTrans->save();
    }
}
?>