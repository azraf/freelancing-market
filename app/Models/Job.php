<?php
namespace Models;

use \Illuminate\Database\Eloquent\Model;
use Models\Country;

class Job extends Model
{
    protected $table = 'job';
    protected $fillable = [
                              'jobid'
                            , 'clientid'
                            , 'catid'
                            , 'sub'
                            , 'title'
                            , 'slug'
                            , 'id_zone'
                            , 'description'
                            , 'job_type'
                            , 'budget'
                            , 'start_date'
                            , 'end_date'
                            , 'completition_proof'
                            , 'job_seats_min'
                            , 'job_seats_max'
                            , 'job_seated'
                            , 'perjob_charge'
                            , 'engine_charge'
                            , 'total_charge'
                            , 'has_countries'
                            , 'skills'
                            , 'message'
                            , 'active'
                            , 'delete_remove'
                            , 'charged'
                            , 'opened'
                            , 'invite'
                            , 'archived'  // Previous 'accepted'
                            , 'completed'
                            , 'featured'
                            , 'featured_date'
                            , 'created_at'
                            , 'updated_at'
                        ];

    public function regions()
    {
        return $this->belongsToMany('Models\Regions', 'job_region', 'job_id','regions_id');
    }
//    public function countries()
//    {
//        return $this->belongsToMany('Models\Country', 'country_job', 'job_id','country_id');
//    }
//    public function notCountries()
//    {
//        return $this->belongsToMany('Models\Country', 'job_notcountry', 'job_id','country_id');
//    }

    public function client()
    {
        return $this->belongsTo('Models\User', 'clientid');
    }

    public function clientId()
    {
        return $this->belongsTo('Models\User', 'clientid')->select('id');
    }

    public function submittedProof()
    {
        return $this->hasMany('Models\ProofSubmit', 'jobid', 'id');
    }

    public function submitted($id)
    {
        return $this->hasOne('Models\ProofSubmit', 'jobid', 'id') ->where('freelancerid','=',$id)
            ->where('client_approve','=',0)
            ->where('status','=',1);
    }
    public function cat()
    {
        return $this->belongsTo('Models\Category', 'catid');
    }
    public function subcat()
    {
        return $this->belongsTo('Models\SubCategory', 'sub');
    }
}
?>