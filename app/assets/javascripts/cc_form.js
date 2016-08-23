/**
 * Created by leichen on 8/23/16.
 */
$(document).ready(function(){
    var show_error,stripeResonseHandler,submitHandler;

    submitHandler = function(event){

        var $form = $(event.target);
        $form.find("input[type=submit]").prop("disabled", true);

        if(Stripe){
            Stripe.card.createToken($form,stripeResonseHandler);
        }else{
            show_error("Failed to load credit card processing function");
        }

        return false;

    }

    $(".cc_form").on('submit',submitHandler);
})