/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$(document).ready(function() {

    /***********************************************
     * NEWSLETTER LINK
     */
    //Link newsletter in header scroll to newsletter block in footer
    function clignoter() {
        if(iteration%2 == 0) {
            $(".newsletter").css('background-color', "#1a1a18");
        }
        else {
            $(".newsletter").css('background-color', "#6a6763");
        }
        if(iteration == 6) {
            clearInterval(clignoterInterval);
        }
        iteration ++;
    }

    $('#link-newsletter').click(function() {
        $("html, body").animate({ scrollTop: $(document).height() }, 1000);
        iteration = 0;
        clignoterInterval = setInterval(clignoter, 300);
        return false;
    });


    /***********************************************
     * BLF MENU CATEGORY
     */
    $('#menu-category li .selected').parents('li').find('> a').addClass('selected');
    
    //Disable level 1 if category under.
    $('#menu-category > li > a').click(function() {
        if($(this).parent().find('ul').length != 0) {
            return false;
        }
    });


    /***********************************************
     * LINK ON AN ENTIRE BLOCK - product (category page)
     */
    function goLocation(theObject) {
        window.location = $(theObject).find(".big-link").attr("href");
    }
    
    $('.product_list > li, #homepush-left > li, #news-home').live('click', function() {
        goLocation(this);
    });
    
    
    /***********************************************
     * CATEGORY FILTER
     */
    $('#category #left-column #category-filter p').click(function() {
        if($(this).hasClass('minus')) {
            $(this).removeClass('minus').addClass('plus').parent().find('ul').slideUp();
        }
        else {
            $(this).removeClass('plus').addClass('minus').parent().find('ul').slideDown();
        }
    });
    
    
    //hide option with no value*********************
    $(".PM_ASBlockOutput .PM_ASCriterionNoChoice:visible").parents('.PM_ASCriterionsGroup').css('display', 'none');
    $(".PM_ASCriterionStepEnable > ul").each(function() {
        if($(this).find("li").length == 1) {
            $(this).parents('.PM_ASCriterionsGroup').css('display', 'none');
        }
    });
    
    //hide all block if no option
    if($(".PM_ASBlockOutput .PM_ASCriterionsGroup:visible").length == 0) {
        $('.PM_ASBlockOutput').css('display', 'none');
    }
    
    
    /***********************************************
     * PRODUCT PAGE - BUTTON + AND -
     */
    $('.cart_quantity_up').click(function() {
        $('#quantity_wanted').attr('value', (parseInt($('#quantity_wanted').val())+1));
    });
    $('.cart_quantity_down').click(function() {
        if(parseInt($('#quantity_wanted').val()) > 1) {
            $('#quantity_wanted').attr('value', (parseInt($('#quantity_wanted').val())-1));
        }
    });
    $('#quantity_wanted').change(function() {
        if(isNaN($(this).val()) == true || parseInt($(this).val()) <= 1) {
            $('#quantity_wanted').attr('value', "1");
        }
    });
    
    
    /***********************************************
     * PRODUCT PAGE - MOBVE LOYALTY TEXT
     */
    $("#loyalty").appendTo("#prez_product");
});
