<div id="submitproofdiv">
    <br />
    <h3>Submit Proof</h3>
    <form action="<?=$action?>" method="POST" enctype="multipart/form-data">
        <div class="form-group">

            <label for="proof_text">Proof Document:</label>
            <!--textarea class="textarea proof_texti" name="proof_text" id="proof_text" onfocus="hidebackground();" style="padding:15px; width:800px; height:200px;" ></textarea-->
            <textarea maxlength="5000" rows="10" class="form-control proof_text" name="proof_text" id="proof_text" onfocus="hidebackground();" style="height: 138px;"></textarea>
        </div>

        <label>Please also upload a ScreenShot of proof Files allowed: *.jpg, *.png, *.gif <span class="toolTip" title="It will help decide in case of dispute.">(?)</span></label>
        <br>
        <input type="hidden" name="enc" value="<?=$enc?>" />
        <input type="hidden" name="token" value="<?=$token?>" />
        <input name="proof_file" type="file">
        <br />
        <button type="submit" name="submit" class="btn btn-primary">
            Submit Proof
        </button>
    </form>
    <br />
</div>