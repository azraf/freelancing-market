<?php
namespace Controllers;

use duncan3dc\Laravel\BladeInstance;
use Libs\Session;
use Libs\Redirect;
use Models\Pageinfo;
use Models\PaymentSettings;
use Models\User;
use Models\Transactions;
//use Illuminate\Support\Facades\DB;

class Controller {

    public $tmpl;
    public $data;
    public $userinfo;

    public function __construct($minInfo=false)
    {
//        $this->tmpl = new BladeInstance(VIEWROOTPATH, VIEWCACHEPATH);
        $this->tmpl = new BladeInstance(VIEWROOTPATH, VIEWCACHEPATH);
        $this->_boot();
        if($minInfo){
            $this->_setMinInfo();
        } else {
            $this->_setSiteInfo();
        }
        $this->_payments_settings();
        $this->_currency_symbol();
    }

    private function _setMinInfo()
    {
        $siteInfo = [
                  'title'
                , 'use_icon'
                , 'site_icon'
                , 'tagline'
                , 'description'
                , 'keywords'
                , 'author'
                , 'bgimage'
                , 'google_analytics'
            ];
        $info = Pageinfo::where('id', 1)->first();
        foreach($siteInfo as $v)
        {
            $this->data['pi_'.$v] = isset($info->{$v}) ? $info->{$v} : '';
        }
    }

    private function _setSiteInfo()
    {
        $siteInfo = [
                  'title'
                , 'use_icon'
                , 'site_icon'
                , 'tagline'
                , 'url'
                , 'description'
                , 'keywords'
                , 'author'
                , 'mail'
                , 'mailpass'
                , 'bgimage'
                , 'job_limit'
                , 'service_limit'
                , 'proposal_limit'
                , 'top_title'
                , 'show_downtitle'
                , 'down_title'
                , 'searchterm'
                , 'header_img'
                , 'cattagline'
                , 'testtagline'
                , 'statstagline'
                , 'about_top_title'
                , 'about_hello'
                , 'about_header_img'
                , 'about_whitebg'
                , 'teamtagline'
                , 'timelinetagline'
                , 'how_top_title'
                , 'how_header_img'
                , 'faq_top_title'
                , 'faq_header_img'
                , 'faq_hello'
                , 'contact_top_title'
                , 'contact_header_img'
                , 'contact_location'
                , 'contact_phone'
                , 'contact_email'
                , 'contact_map'
                , 'footer_about'
                , 'facebook'
                , 'twitter'
                , 'google'
                , 'instagram'
                , 'linkedin'
                , 'pricing_top_title'
                , 'pricing_header_img'
                , 'services_header_img'
                , 'jobs_header_img'
                , 'google_analytics'
            ];
        $info = Pageinfo::where('id', 1)->first();
        foreach($siteInfo as $v)
        {
            $this->data['pi_'.$v] = isset($info->{$v}) ? $info->{$v} : '';
        }
    }

    private function _payments_settings()
    {
        $info = PaymentSettings::find(1);
        $this->data['currency'] = isset($info->get()->currency_info) ? $info->get()->currency_info(): '';
        $this->data['currency_symbol'] = isset($info->get()->symbol) ? $info->get()->symbol(): '';
        $this->data['membershipid'] = isset($info->membershipid) ? $info->membershipid : '';
    }

    private function _currency_symbol()
    {
        $this->data['currency_symbol'] = '$';
    }

    private function _boot()
    {
        $this->data['masterParams'] = [];
        if(SITEMODE == 'prod'){
            $this->data['masterParams'] = ['min'=>true];
        }
        $role = Session::getRole();
        $userId = Session::getUserId();
        $noInfo = Session::noInfo();
        $trans  =  new Transactions();
        $account = $trans->balanceCheck($userId);
        $this->data['account'] = $account;
        if($role == 'user' && $noInfo==true){
            $user = User::with('country')->find($userId);
            $this->userInfo = [
                'id' => $user->id
                , 'userid' => $user->userid
                , 'username' => $user->username
                , 'name' => $user->name
                , 'email' => $user->email
                , 'country_id' => $user->country_id
                , 'country' => $user->country['name']
                , 'balance' => $account['balance']
            ];

            $this->data['account'] =$account;
            Session::setInfo($this->userInfo);
        } else if($role == 'admin'){
            Redirect::cp();
        }
    }

    public function setBackUrl()
    {
        Session::backUrl($_SERVER['REQUEST_URI']);
    }
    public function loadDtAssets()
    {
        $this->_setMasterParams([ 'loadDtCss' => true, 'loadDtJs' => true ]);
    }
    public function message($html)
    {
        $this->_setMasterParams([ 'message' => $html]);
    }
    public function noContent($html)
    {
        $this->_setMasterParams([ 'nocontent' => $html]);
    }
    private function _setMasterParams($params)
    {
        $this->data['masterParams'] = array_merge($this->data['masterParams'],$params);
    }
    public function run($view)
    {
        echo $this->tmpl->render($view, $this->data);
    }
}
?>