<?php

 // connect to the database
 require_once '../../../core/backinit.php';
 
 // check if the 'serial' variable is set in URL, and check that it is valid
 if (Input::get('id') && is_numeric(Input::get('id')))
 {
	 // get id value
	 $id = Input::get('id');

     $job = Job::find($id);
     $job->public = 0;
     $job->active = 0;
     $job->save();
	 // update the entry

	 // redirect back to the view page
	 header("Location: ../jobinvite.php");
 }else
 // if id isn't set, or isn't valid, redirect back to view page
 {
 header("Location: ../jobinvite.php");
 }
 
?>