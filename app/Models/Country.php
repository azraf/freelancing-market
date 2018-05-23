<?php
namespace Models;

use \Illuminate\Database\Eloquent\Model;

class Country extends Model
{
    protected $table = 'regions';
    protected $fillable = [
        'code'
        , 'name'
        , 'zone_name'
        , 'zone_code'
        , 'active'
        , 'deleted'
        , 'created_at'
        , 'updated_at'
    ];

    public function jobs()
    {
        return $this->belongsToMany('Models\Job', 'job_region', 'job_id','regions_id');
    }

    public function scopeActive($query)
    {
        return $query->where('active', 1)
            ->where('deleted','=',0);
    }

    public function scopeDeleted($query)
    {
        return $query->where('deleted','=',0);
//        return $query->where('deleted',0);
    }

    public function getCountries()
    {
        return $this->active()->get()->toArray();
    }

    public function getByCode($code)
    {
        return $this->active()->where('code','=',$code)->get()->toArray();
    }

    public function listByCode()
    {
        $all =  $this->active()->get()->toArray();
        $countries = [];
        foreach($all as $val)
        {
            $countries[$val['code']] = $val['name'];
        }
        return $countries;
    }

    public function codeByZoneCode()
    {
        $all =  $this->active()->get()->toArray();
        $countries = [];
        foreach($all as $val)
        {
            $countries[$val['zone_code']] = $val['code'];
        }
        return $countries;
    }

    public function codeByZoneName()
    {
        $all =  $this->active()->get()->toArray();
        $countries = [];
        foreach($all as $val)
        {
            $countries[$val['zone_name']] = $val['code'];
        }
        return $countries;
    }
    public function countryByZoneName()
    {
        $all =  $this->active()->get()->toArray();
        $countries = [];
        foreach($all as $val)
        {
            $countries[$val['zone_name']] = $val['name'];
        }
        return $countries;
    }
    public function countryByZoneCode()
    {
        $all =  $this->active()->get()->toArray();
        $countries = [];
        foreach($all as $val)
        {
            $countries[$val['zone_code']] = $val['name'];
        }
        return $countries;
    }
    public function zoneList()
    {
        $all =  $this->active()->get()->toArray();
//        $all =  $this->deleted()->get()->toArray();
        $countries = [];
        foreach($all as $val)
        {
            $countries[$val['zone_code']] = $val['zone_name'];
        }
        return $countries;
    }
}
?>