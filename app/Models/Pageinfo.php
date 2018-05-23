<?php
namespace Models;

use \Illuminate\Database\Eloquent\Model;

class Pageinfo extends Model
{
    protected $table = 'pageinfo';
    protected $fillable = [
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
}
?>