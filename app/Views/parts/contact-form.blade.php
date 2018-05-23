<?php

?>
<form id="contact-form" method="post" role="form" action="<?=$action?>">
    <div class="messages"></div>
    <div class="controls">

        <div class="row">
            <div class="col-md-6">
                <div class="form-group">
                    <label for="ticket">Select :</label>
                    <select class="form-control" id="ticket" name="ticket">
                        <option value="help">Help</option>
                        <option value="deposit">Deposit</option>
                        <option value="refund">Refund</option>
                        <option value="corporate">Company Query</option>
                        <option value="report">Report a worker</option>
                        <option value="account">Account Problem</option>
                        <option value="job">Complete Job Problem</option>
                        <option value="withdraw">Withdraw Problem</option>
                        <option value="other">Other</option>
                    </select>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <div class="form-group">
                    <label for="form_message">Message *</label>
                    <textarea id="form_message" name="message" class="form-control" placeholder="Message for me *" rows="4" required="required" data-error="Please,leave us a message."></textarea>
                    <div class="help-block with-errors"></div>
                </div>
            </div>
            <div class="col-md-12">
                <input type="hidden" name="token" value="<?php echo $token; ?>"/>
                <input type="submit" class="btn btn-success btn-send" value="Send message">
            </div>
        </div>

    </div>

</form>