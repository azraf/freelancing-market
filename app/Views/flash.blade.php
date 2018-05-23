<?php
use Libs\Session;
if (Session::exists('flash_notify.name')){
?>
    <div class="alert alert-{{ Session::get('flash_notify.level') }}">
        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
    {{ Session::flash('flash_notify.message') }}
    </div>
<?php
}

if (!empty($_SESSION['notifications'])){
    foreach($_SESSION['notifications'] as $notify){
?>
<div class="alert alert-{{ $notify['level'] }}">
<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
{{ Session::flash('flash_notify.message') }}
    <b>{{ $notify['name'] }}</b>  {{ $notify['message'] }}
</div>
<?php
        }
    Session::cleanFlash();
}
?>