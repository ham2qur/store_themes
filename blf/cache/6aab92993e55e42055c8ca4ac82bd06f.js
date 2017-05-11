if(typeof baseUri==="undefined"&&typeof baseDir!=="undefined")
baseUri=baseDir;var ajaxCart={nb_total_products:0,overrideButtonsInThePage:function(){$('.ajax_add_to_cart_button').unbind('click').click(function(){var idProduct=$(this).attr('rel').replace('nofollow','').replace('ajax_id_product_','');if($(this).attr('disabled')!='disabled')
ajaxCart.add(idProduct,null,false,this);return false;});$('#add_to_cart input').unbind('click').click(function(){ajaxCart.add($('#product_page_product_id').val(),$('#idCombination').val(),true,null,$('#quantity_wanted').val(),null);return false;});$('#cart_block_list .ajax_cart_block_remove_link').unbind('click').click(function(){var customizationId=0;var productId=0;var productAttributeId=0;var customizableProductDiv=$($(this).parent().parent()).find("div[id^=deleteCustomizableProduct_]");if(customizableProductDiv&&$(customizableProductDiv).length)
{$(customizableProductDiv).each(function(){var ids=$(this).attr('id').split('_');if(typeof(ids[1])!='undefined')
{customizationId=parseInt(ids[1]);productId=parseInt(ids[2]);if(typeof(ids[3])!='undefined')
productAttributeId=parseInt(ids[3]);return false;}});}
if(!customizationId)
{var firstCut=$(this).parent().parent().attr('id').replace('cart_block_product_','');firstCut=firstCut.replace('deleteCustomizableProduct_','');ids=firstCut.split('_');productId=parseInt(ids[0]);if(typeof(ids[1])!='undefined')
productAttributeId=parseInt(ids[1]);}
var idAddressDelivery=$(this).parent().parent().attr('id').match(/.*_\d+_\d+_(\d+)/)[1];ajaxCart.remove(productId,productAttributeId,customizationId,idAddressDelivery);return false;});},expand:function(){if($('#cart_block_list').hasClass('collapsed'))
{$('#cart_block_summary').slideUp(200,function(){$(this).addClass('collapsed').removeClass('expanded');$('#cart_block_list').slideDown({duration:450,complete:function(){$(this).addClass('expanded').removeClass('collapsed');}});});$('#block_cart_expand').fadeOut('slow',function(){$('#block_cart_collapse').fadeIn('fast');});$.ajax({type:'POST',headers:{"cache-control":"no-cache"},url:baseDir+'modules/blockcart/blockcart-set-collapse.php'+'?rand='+new Date().getTime(),async:true,cache:false,data:'ajax_blockcart_display=expand'});}},refresh:function(){$.ajax({type:'POST',headers:{"cache-control":"no-cache"},url:baseUri+'?rand='+new Date().getTime(),async:true,cache:false,dataType:"json",data:'controller=cart&ajax=true&token='+static_token,success:function(jsonData)
{ajaxCart.updateCart(jsonData);},error:function(XMLHttpRequest,textStatus,errorThrown){alert("TECHNICAL ERROR: \n\nDetails:\nError thrown: "+XMLHttpRequest+"\n"+'Text status: '+textStatus);}});},collapse:function(){if($('#cart_block_list').hasClass('expanded'))
{$('#cart_block_list').slideUp('slow',function(){$(this).addClass('collapsed').removeClass('expanded');$('#cart_block_summary').slideDown(450,function(){$(this).addClass('expanded').removeClass('collapsed');});});$('#block_cart_collapse').fadeOut('slow',function(){$('#block_cart_expand').fadeIn('fast');});$.ajax({type:'POST',headers:{"cache-control":"no-cache"},url:baseDir+'modules/blockcart/blockcart-set-collapse.php'+'?rand='+new Date().getTime(),async:true,cache:false,data:'ajax_blockcart_display=collapse'+'&rand='+new Date().getTime()});}},updateCartInformation:function(jsonData,addedFromProductPage)
{ajaxCart.updateCart(jsonData);if(addedFromProductPage)
$('#add_to_cart input').removeAttr('disabled').addClass('exclusive').removeClass('exclusive_disabled');else
$('.ajax_add_to_cart_button').removeAttr('disabled');},add:function(idProduct,idCombination,addedFromProductPage,callerElement,quantity,wishlist){if(addedFromProductPage&&!checkCustomizations())
{alert(fieldRequired);return;}
emptyCustomizations();if(addedFromProductPage)
{$('#add_to_cart input').attr('disabled',true).removeClass('exclusive').addClass('exclusive_disabled');$('.filled').removeClass('filled');}
else
$(callerElement).attr('disabled',true);if($('#cart_block_list').hasClass('collapsed'))
this.expand();$.ajax({type:'POST',headers:{"cache-control":"no-cache"},url:baseUri+'?rand='+new Date().getTime(),async:true,cache:false,dataType:"json",data:'controller=cart&add=1&ajax=true&qty='+((quantity&&quantity!=null)?quantity:'1')+'&id_product='+idProduct+'&token='+static_token+((parseInt(idCombination)&&idCombination!=null)?'&ipa='+parseInt(idCombination):''),success:function(jsonData,textStatus,jqXHR)
{if(wishlist&&!jsonData.errors)
WishlistAddProductCart(wishlist[0],idProduct,idCombination,wishlist[1]);var $element=$(callerElement).parent().parent().find('a.product_image img,a.product_img_link img');if(!$element.length)
$element=$('#bigpic');var $picture=$element.clone();var pictureOffsetOriginal=$element.offset();pictureOffsetOriginal.right=$(window).innerWidth()-pictureOffsetOriginal.left-$element.width();if($picture.length)
{$picture.css({position:'absolute',top:pictureOffsetOriginal.top,right:pictureOffsetOriginal.right});}
var pictureOffset=$picture.offset();var cartBlock=$('#cart_block');if(!$('#cart_block')[0]||!$('#cart_block').offset().top||!$('#cart_block').offset().left)
cartBlock=$('#shopping_cart');var cartBlockOffset=cartBlock.offset();cartBlockOffset.right=$(window).innerWidth()-cartBlockOffset.left-cartBlock.width();if(cartBlockOffset!=undefined&&$picture.length)
{$picture.appendTo('body');$picture.css({position:'absolute',top:pictureOffsetOriginal.top,right:pictureOffsetOriginal.right,zIndex:4242}).animate({width:$element.attr('width')*0.66,height:$element.attr('height')*0.66,opacity:0.2,top:cartBlockOffset.top+30,right:cartBlockOffset.right+15},1000).fadeOut(100,function(){ajaxCart.updateCartInformation(jsonData,addedFromProductPage);$(this).remove();});}
else
ajaxCart.updateCartInformation(jsonData,addedFromProductPage);},error:function(XMLHttpRequest,textStatus,errorThrown)
{alert("Impossible to add the product to the cart.\n\ntextStatus: '"+textStatus+"'\nerrorThrown: '"+errorThrown+"'\nresponseText:\n"+XMLHttpRequest.responseText);if(addedFromProductPage)
$('#add_to_cart input').removeAttr('disabled').addClass('exclusive').removeClass('exclusive_disabled');else
$(callerElement).removeAttr('disabled');}});},remove:function(idProduct,idCombination,customizationId,idAddressDelivery){$.ajax({type:'POST',headers:{"cache-control":"no-cache"},url:baseUri+'?rand='+new Date().getTime(),async:true,cache:false,dataType:"json",data:'controller=cart&delete=1&id_product='+idProduct+'&ipa='+((idCombination!=null&&parseInt(idCombination))?idCombination:'')+((customizationId&&customizationId!=null)?'&id_customization='+customizationId:'')+'&id_address_delivery='+idAddressDelivery+'&token='+static_token+'&ajax=true',success:function(jsonData){ajaxCart.updateCart(jsonData);if($('body').attr('id')=='order'||$('body').attr('id')=='order-opc')
deleteProductFromSummary(idProduct+'_'+idCombination+'_'+customizationId+'_'+idAddressDelivery);},error:function(){alert('ERROR: unable to delete the product');}});},hideOldProducts:function(jsonData){if($('#cart_block_list dl.products').length>0)
{var removedProductId=null;var removedProductData=null;var removedProductDomId=null;$('#cart_block_list dl.products dt').each(function(){var domIdProduct=$(this).attr('id');var firstCut=domIdProduct.replace('cart_block_product_','');var ids=firstCut.split('_');var stayInTheCart=false;for(aProduct in jsonData.products)
{if(jsonData.products[aProduct]['id']==ids[0]&&(!ids[1]||jsonData.products[aProduct]['idCombination']==ids[1]))
{stayInTheCart=true;ajaxCart.hideOldProductCustomizations(jsonData.products[aProduct],domIdProduct);}}
if(!stayInTheCart)
{removedProductId=$(this).attr('id');if(removedProductId!=null)
{var firstCut=removedProductId.replace('cart_block_product_','');var ids=firstCut.split('_');$('#'+removedProductId).addClass('strike').fadeTo('slow',0,function(){$(this).slideUp('slow',function(){$(this).remove();if($('#cart_block dl.products dt').length==0)
{$("#header #cart_block").stop(true,true).slideUp(200);$('#cart_block_no_products:hidden').slideDown(450);$('#cart_block dl.products').remove();}});});$('#cart_block_combination_of_'+ids[0]+(ids[1]?'_'+ids[1]:'')+(ids[2]?'_'+ids[2]:'')).fadeTo('fast',0,function(){$(this).slideUp('fast',function(){$(this).remove();});});}}});}},hideOldProductCustomizations:function(product,domIdProduct)
{var customizationList=$('#customization_'+product['id']+'_'+product['idCombination']);if(customizationList.length>0)
{$(customizationList).find("li").each(function(){$(this).find("div").each(function(){var customizationDiv=$(this).attr('id');var tmp=customizationDiv.replace('deleteCustomizableProduct_','');var ids=tmp.split('_');if((parseInt(product.idCombination)==parseInt(ids[2]))&&!ajaxCart.doesCustomizationStillExist(product,ids[0]))
$('#'+customizationDiv).parent().addClass('strike').fadeTo('slow',0,function(){$(this).slideUp('slow');$(this).remove();});});});}
var removeLinks=$('#'+domIdProduct).find('.ajax_cart_block_remove_link');if(!product.hasCustomizedDatas&&!removeLinks.length)
$('#'+domIdProduct+' span.remove_link').html('<a class="ajax_cart_block_remove_link" rel="nofollow" href="'+baseUri+'?controller=cart&amp;delete=1&amp;id_product='+product['id']+'&amp;ipa='+product['idCombination']+'&amp;token='+static_token+'"> </a>');if(product.is_gift)
$('#'+domIdProduct+' span.remove_link').html('');},doesCustomizationStillExist:function(product,customizationId)
{var exists=false;$(product.customizedDatas).each(function(){if(this.customizationId==customizationId)
{exists=true;return false;}});return(exists);},refreshVouchers:function(jsonData){if(typeof(jsonData.discounts)=='undefined'||jsonData.discounts.length==0)
$('#vouchers').hide();else
{$('#vouchers tbody').html('');for(i=0;i<jsonData.discounts.length;i++)
{if(parseFloat(jsonData.discounts[i].price_float)>0)
{var delete_link='';if(jsonData.discounts[i].code.length)
delete_link='<a class="delete_voucher" href="'+jsonData.discounts[i].link+'" title="'+delete_txt+'"><img src="'+img_dir+'icon/delete.gif" alt="'+delete_txt+'" class="icon" /></a>';$('#vouchers tbody').append($('<tr class="bloc_cart_voucher" id="bloc_cart_voucher_'+jsonData.discounts[i].id+'">'
+'<td class="quantity">1x</td>'
+'<td class="name" title="'+jsonData.discounts[i].description+'">'+jsonData.discounts[i].name+'</td>'
+'<td class="price">-'+jsonData.discounts[i].price+'</td>'
+'<td class="delete">'+delete_link+'</td>'
+'</tr>'));}}
$('#vouchers').show();}},updateProductQuantity:function(product,quantity){$('#cart_block_product_'+product.id+'_'+(product.idCombination?product.idCombination:'0')+'_'+(product.idAddressDelivery?product.idAddressDelivery:'0')+' .quantity').fadeTo('fast',0,function(){$(this).text(quantity);$(this).fadeTo('fast',1,function(){$(this).fadeTo('fast',0,function(){$(this).fadeTo('fast',1,function(){$(this).fadeTo('fast',0,function(){$(this).fadeTo('fast',1);});});});});});},displayNewProducts:function(jsonData){$(jsonData.products).each(function(){if(this.id!=undefined)
{if($('#cart_block dl.products').length==0)
{$('#cart_block_no_products').before('<dl class="products"></dl>');$('#cart_block_no_products').hide();}
var domIdProduct=this.id+'_'+(this.idCombination?this.idCombination:'0')+'_'+(this.idAddressDelivery?this.idAddressDelivery:'0');var domIdProductAttribute=this.id+'_'+(this.idCombination?this.idCombination:'0');if($('#cart_block_product_'+domIdProduct).length==0)
{var productId=parseInt(this.id);var productAttributeId=(this.hasAttributes?parseInt(this.attributes):0);var content='<dt class="hidden" id="cart_block_product_'+domIdProduct+'">';content+='<span class="quantity-formated"><span class="quantity">'+this.quantity+'</span>x</span>';var name=$('<span />').html(this.name).text();name=(name.length>12?name.substring(0,10)+'...':name);content+='<a href="'+this.link+'" title="'+this.name+'" class="cart_block_product_name">'+name+'</a>';if(typeof(this.is_gift)=='undefined'||this.is_gift==0)
content+='<span class="remove_link"><a rel="nofollow" class="ajax_cart_block_remove_link" href="'+baseUri+'?controller=cart&amp;delete=1&amp;id_product='+productId+'&amp;token='+static_token+(this.hasAttributes?'&amp;ipa='+parseInt(this.idCombination):'')+'"> </a></span>';else
content+='<span class="remove_link"></span>';if(typeof(freeProductTranslation)!='undefined')
content+='<span class="price">'+(parseFloat(this.price_float)>0?this.priceByLine:freeProductTranslation)+'</span>';content+='</dt>';if(this.hasAttributes)
content+='<dd id="cart_block_combination_of_'+domIdProduct+'" class="hidden"><a href="'+this.link+'" title="'+this.name+'">'+this.attributes+'</a>';if(this.hasCustomizedDatas)
content+=ajaxCart.displayNewCustomizedDatas(this);if(this.hasAttributes)content+='</dd>';$('#cart_block dl.products').append(content);}
else
{var jsonProduct=this;if($.trim($('#cart_block_product_'+domIdProduct+' .quantity').html())!=jsonProduct.quantity||$.trim($('#cart_block_product_'+domIdProduct+' .price').html())!=jsonProduct.priceByLine)
{if(!this.is_gift)
$('#cart_block_product_'+domIdProduct+' .price').text(jsonProduct.priceByLine);else
$('#cart_block_product_'+domIdProduct+' .price').html(freeProductTranslation);ajaxCart.updateProductQuantity(jsonProduct,jsonProduct.quantity);if(jsonProduct.hasCustomizedDatas)
{customizationFormatedDatas=ajaxCart.displayNewCustomizedDatas(jsonProduct);if(!$('#customization_'+domIdProductAttribute).length)
{if(jsonProduct.hasAttributes)
$('#cart_block_combination_of_'+domIdProduct).append(customizationFormatedDatas);else
$('#cart_block dl.products').append(customizationFormatedDatas);}
else
{$('#customization_'+domIdProductAttribute).html('');$('#customization_'+domIdProductAttribute).append(customizationFormatedDatas);}}}}
$('#cart_block dl.products .hidden').slideDown(450).removeClass('hidden');var removeLinks=$('#cart_block_product_'+domIdProduct).find('a.ajax_cart_block_remove_link');if(this.hasCustomizedDatas&&removeLinks.length)
$(removeLinks).each(function(){$(this).remove();});}});},displayNewCustomizedDatas:function(product)
{var content='';var productId=parseInt(product.id);var productAttributeId=typeof(product.idCombination)=='undefined'?0:parseInt(product.idCombination);var hasAlreadyCustomizations=$('#customization_'+productId+'_'+productAttributeId).length;if(!hasAlreadyCustomizations)
{if(!product.hasAttributes)
content+='<dd id="cart_block_combination_of_'+productId+'" class="hidden">';if($('#customization_'+productId+'_'+productAttributeId).val()==undefined)
content+='<ul class="cart_block_customizations" id="customization_'+productId+'_'+productAttributeId+'">';}
$(product.customizedDatas).each(function()
{var done=0;customizationId=parseInt(this.customizationId);productAttributeId=typeof(product.idCombination)=='undefined'?0:parseInt(product.idCombination);content+='<li name="customization"><div class="deleteCustomizableProduct" id="deleteCustomizableProduct_'+customizationId+'_'+productId+'_'+(productAttributeId?productAttributeId:'0')+'"><a rel="nofollow" class="ajax_cart_block_remove_link" href="'+baseUri+'?controller=cart&amp;delete=1&amp;id_product='+productId+'&amp;ipa='+productAttributeId+'&amp;id_customization='+customizationId+'&amp;token='+static_token+'"></a></div><span class="quantity-formated"><span class="quantity">'+parseInt(this.quantity)+'</span>x</span>';$(this.datas).each(function(){if(this['type']==CUSTOMIZE_TEXTFIELD)
{$(this.datas).each(function(){if(this['index']==0)
{content+=' '+this.truncatedValue.replace(/<br \/>/g,' ');done=1;return false;}})}});if(!done)
content+=customizationIdMessage+customizationId;if(!hasAlreadyCustomizations)content+='</li>';if(customizationId)
{$('#uploadable_files li div.customizationUploadBrowse img').remove();$('#text_fields input').attr('value','');}});if(!hasAlreadyCustomizations)
{content+='</ul>';if(!product.hasAttributes)content+='</dd>';}
return(content);},updateCart:function(jsonData){if(jsonData.hasError)
{var errors='';for(error in jsonData.errors)
if(error!='indexOf')
errors+=$('<div />').html(jsonData.errors[error]).text()+"\n";alert(errors);}
else
{ajaxCart.updateCartEverywhere(jsonData);ajaxCart.hideOldProducts(jsonData);ajaxCart.displayNewProducts(jsonData);ajaxCart.refreshVouchers(jsonData);$('#cart_block .products dt').removeClass('first_item').removeClass('last_item').removeClass('item');$('#cart_block .products dt:first').addClass('first_item');$('#cart_block .products dt:not(:first,:last)').addClass('item');$('#cart_block .products dt:last').addClass('last_item');ajaxCart.overrideButtonsInThePage();}},updateCartEverywhere:function(jsonData){$('.ajax_cart_total').text($.trim(jsonData.productTotal));if(parseFloat(jsonData.shippingCostFloat)>0||jsonData.nbTotalProducts<1)
$('.ajax_cart_shipping_cost').text(jsonData.shippingCost);else if(typeof(freeShippingTranslation)!='undefined')
$('.ajax_cart_shipping_cost').html(freeShippingTranslation);$('.ajax_cart_tax_cost').text(jsonData.taxCost);$('.cart_block_wrapping_cost').text(jsonData.wrappingCost);$('.ajax_block_cart_total').text(jsonData.total);this.nb_total_products=jsonData.nbTotalProducts;if(parseInt(jsonData.nbTotalProducts)>0)
{$('.ajax_cart_no_product').hide();$('.ajax_cart_quantity').text(jsonData.nbTotalProducts);$('.ajax_cart_quantity').fadeIn('slow');$('.ajax_cart_total').fadeIn('slow');if(parseInt(jsonData.nbTotalProducts)>1)
{$('.ajax_cart_product_txt').each(function(){$(this).hide();});$('.ajax_cart_product_txt_s').each(function(){$(this).show();});}
else
{$('.ajax_cart_product_txt').each(function(){$(this).show();});$('.ajax_cart_product_txt_s').each(function(){$(this).hide();});}}
else
{$('.ajax_cart_quantity, .ajax_cart_product_txt_s, .ajax_cart_product_txt, .ajax_cart_total').each(function(){$(this).hide();});$('.ajax_cart_no_product').show('slow');}}};function HoverWatcher(selector){this.hovering=false;var self=this;this.isHoveringOver=function(){return self.hovering;}
$(selector).hover(function(){self.hovering=true;},function(){self.hovering=false;})}
$(document).ready(function(){$('#block_cart_collapse').click(function(){ajaxCart.collapse();});$('#block_cart_expand').click(function(){ajaxCart.expand();});ajaxCart.overrideButtonsInThePage();var cart_qty=0;var current_timestamp=parseInt(new Date().getTime()/1000);if(typeof $('.ajax_cart_quantity').html()=='undefined'||(typeof generated_date!='undefined'&&generated_date!=null&&(parseInt(generated_date)+30)<current_timestamp))
ajaxCart.refresh();else
cart_qty=parseInt($('.ajax_cart_quantity').html());var cart_block=new HoverWatcher('#header #cart_block');var shopping_cart=new HoverWatcher('#shopping_cart');$("#shopping_cart a:first").hover(function(){$(this).css('border-radius','3px 3px 0px 0px');if(ajaxCart.nb_total_products>0||cart_qty>0)
$("#header #cart_block").stop(true,true).slideDown(450);},function(){$('#shopping_cart a').css('border-radius','3px');setTimeout(function(){if(!shopping_cart.isHoveringOver()&&!cart_block.isHoveringOver())
$("#header #cart_block").stop(true,true).slideUp(450);},200);});$("#header #cart_block").hover(function(){$('#shopping_cart a').css('border-radius','3px 3px 0px 0px');},function(){$('#shopping_cart a').css('border-radius','3px');setTimeout(function(){if(!shopping_cart.isHoveringOver())
$("#header #cart_block").stop(true,true).slideUp(450);},200);});$('.delete_voucher').live('click',function(){$.ajax({type:'POST',headers:{"cache-control":"no-cache"},async:true,cache:false,url:$(this).attr('href')+'?rand='+new Date().getTime(),error:function(XMLHttpRequest,textStatus,errorThrown){alert("TECHNICAL ERROR: \n\nDetails:\nError thrown: "+XMLHttpRequest+"\n"+'Text status: '+textStatus);}});$(this).parent().parent().remove();if($('body').attr('id')=='order'||$('body').attr('id')=='order-opc')
{if(typeof(updateAddressSelection)!='undefined')
updateAddressSelection();else
location.reload();}
return false;});$('#cart_navigation input').click(function(){$(this).attr('disabled',true).removeClass('exclusive').addClass('exclusive_disabled');$(this).closest("form").get(0).submit();});});;;(function($){$.fn.extend({autocomplete:function(urlOrData,options){var isUrl=typeof urlOrData=="string";options=$.extend({},$.Autocompleter.defaults,{url:isUrl?urlOrData:null,data:isUrl?null:urlOrData,delay:isUrl?$.Autocompleter.defaults.delay:10,max:options&&!options.scroll?10:150},options);options.highlight=options.highlight||function(value){return value;};options.formatMatch=options.formatMatch||options.formatItem;return this.each(function(){new $.Autocompleter(this,options);});},result:function(handler){return this.bind("result",handler);},search:function(handler){return this.trigger("search",[handler]);},flushCache:function(){return this.trigger("flushCache");},setOptions:function(options){return this.trigger("setOptions",[options]);},unautocomplete:function(){return this.trigger("unautocomplete");}});$.Autocompleter=function(input,options){var KEY={UP:38,DOWN:40,DEL:46,TAB:9,RETURN:13,ESC:27,COMMA:188,PAGEUP:33,PAGEDOWN:34,BACKSPACE:8};var $input=$(input).attr("autocomplete","off").addClass(options.inputClass);var timeout;var previousValue="";var cache=$.Autocompleter.Cache(options);var hasFocus=0;var lastKeyPressCode;var config={mouseDownOnSelect:false};var select=$.Autocompleter.Select(options,input,selectCurrent,config);var blockSubmit;$.browser.opera&&$(input.form).bind("submit.autocomplete",function(){if(blockSubmit){blockSubmit=false;return false;}});$input.bind(($.browser.opera?"keypress":"keydown")+".autocomplete",function(event){lastKeyPressCode=event.keyCode;switch(event.keyCode){case KEY.UP:event.preventDefault();if(select.visible()){select.prev();}else{onChange(0,true);}
break;case KEY.DOWN:event.preventDefault();if(select.visible()){select.next();}else{onChange(0,true);}
break;case KEY.PAGEUP:event.preventDefault();if(select.visible()){select.pageUp();}else{onChange(0,true);}
break;case KEY.PAGEDOWN:event.preventDefault();if(select.visible()){select.pageDown();}else{onChange(0,true);}
break;case options.multiple&&$.trim(options.multipleSeparator)==","&&KEY.COMMA:case KEY.TAB:case KEY.RETURN:if(selectCurrent()){event.preventDefault();blockSubmit=true;return false;}
break;case KEY.ESC:select.hide();break;default:clearTimeout(timeout);timeout=setTimeout(onChange,options.delay);break;}}).focus(function(){hasFocus++;}).blur(function(){hasFocus=0;if(!config.mouseDownOnSelect){hideResults();}}).click(function(){if(hasFocus++>1&&!select.visible()){onChange(0,true);}}).bind("search",function(){var fn=(arguments.length>1)?arguments[1]:null;function findValueCallback(q,data){var result;if(data&&data.length){for(var i=0;i<data.length;i++){if(data[i].result.toLowerCase()==q.toLowerCase()){result=data[i];break;}}}
if(typeof fn=="function")fn(result);else $input.trigger("result",result&&[result.data,result.value]);}
$.each(trimWords($input.val()),function(i,value){request(value,findValueCallback,findValueCallback);});}).bind("flushCache",function(){cache.flush();}).bind("setOptions",function(){$.extend(options,arguments[1]);if("data"in arguments[1])
cache.populate();}).bind("unautocomplete",function(){select.unbind();$input.unbind();$(input.form).unbind(".autocomplete");});function selectCurrent(){var selected=select.selected();if(!selected)
return false;var v=selected.result;previousValue=v;if(options.multiple){var words=trimWords($input.val());if(words.length>1){v=words.slice(0,words.length-1).join(options.multipleSeparator)+options.multipleSeparator+v;}
v+=options.multipleSeparator;}
$input.val(v);hideResultsNow();$input.trigger("result",[selected.data,selected.value]);return true;}
function onChange(crap,skipPrevCheck){if(lastKeyPressCode==KEY.DEL){select.hide();return;}
var currentValue=$input.val();if(!skipPrevCheck&&currentValue==previousValue)
return;previousValue=currentValue;currentValue=lastWord(currentValue);if(currentValue.length>=options.minChars){$input.addClass(options.loadingClass);if(!options.matchCase)
currentValue=currentValue.toLowerCase();request(currentValue,receiveData,hideResultsNow);}else{stopLoading();select.hide();}};function trimWords(value){if(!value){return[""];}
var words=value.split(options.multipleSeparator);var result=[];$.each(words,function(i,value){if($.trim(value))
result[i]=$.trim(value);});return result;}
function lastWord(value){if(!options.multiple)
return value;var words=trimWords(value);return words[words.length-1];}
function autoFill(q,sValue){if(options.autoFill&&(lastWord($input.val()).toLowerCase()==q.toLowerCase())&&lastKeyPressCode!=KEY.BACKSPACE){$input.val($input.val()+sValue.substring(lastWord(previousValue).length));$.Autocompleter.Selection(input,previousValue.length,previousValue.length+sValue.length);}};function hideResults(){clearTimeout(timeout);timeout=setTimeout(hideResultsNow,200);};function hideResultsNow(){var wasVisible=select.visible();select.hide();clearTimeout(timeout);stopLoading();if(options.mustMatch){$input.search(function(result){if(!result){if(options.multiple){var words=trimWords($input.val()).slice(0,-1);$input.val(words.join(options.multipleSeparator)+(words.length?options.multipleSeparator:""));}
else
$input.val("");}});}
if(wasVisible)
$.Autocompleter.Selection(input,input.value.length,input.value.length);};function receiveData(q,data){if(data&&data.length&&hasFocus){stopLoading();select.display(data,q);autoFill(q,data[0].value);select.show();}else{hideResultsNow();}};function request(term,success,failure){if(!options.matchCase)
term=term.toLowerCase();var data=cache.load(term);if(data&&data.length){success(term,data);}else if((typeof options.url=="string")&&(options.url.length>0)){var extraParams={timestamp:+new Date()};$.each(options.extraParams,function(key,param){extraParams[key]=typeof param=="function"?param():param;});$.ajax({mode:"abort",port:"autocomplete"+input.name,dataType:options.dataType,url:options.url,data:$.extend({q:lastWord(term),limit:options.max},extraParams),success:function(data){var parsed=options.parse&&options.parse(data)||parse(data);cache.add(term,parsed);success(term,parsed);}});}else{select.emptyList();failure(term);}};function parse(data){var parsed=[];var rows=data.split("\n");for(var i=0;i<rows.length;i++){var row=$.trim(rows[i]);if(row){row=row.split("|");parsed[parsed.length]={data:row,value:row[0],result:options.formatResult&&options.formatResult(row,row[0])||row[0]};}}
return parsed;};function stopLoading(){$input.removeClass(options.loadingClass);};};$.Autocompleter.defaults={inputClass:"ac_input",resultsClass:"ac_results",loadingClass:"ac_loading",minChars:1,delay:400,matchCase:false,matchSubset:true,matchContains:false,cacheLength:10,max:100,mustMatch:false,extraParams:{},selectFirst:true,formatItem:function(row){return row[0];},formatMatch:null,autoFill:false,width:0,multiple:false,multipleSeparator:", ",highlight:function(value,term){return value.replace(new RegExp("(?![^&;]+;)(?!<[^<>]*)("+term.replace(/([\^\$\(\)\[\]\{\}\*\.\+\?\|\\])/gi,"\\$1")+")(?![^<>]*>)(?![^&;]+;)","gi"),"<strong>$1</strong>");},scroll:true,scrollHeight:180};$.Autocompleter.Cache=function(options){var data={};var length=0;function matchSubset(s,sub){if(!options.matchCase)
s=s.toLowerCase();var i=s.indexOf(sub);if(i==-1)return false;return i==0||options.matchContains;};function add(q,value){if(length>options.cacheLength){flush();}
if(!data[q]){length++;}
data[q]=value;}
function populate(){if(!options.data)return false;var stMatchSets={},nullData=0;if(!options.url)options.cacheLength=1;stMatchSets[""]=[];for(var i=0,ol=options.data.length;i<ol;i++){var rawValue=options.data[i];rawValue=(typeof rawValue=="string")?[rawValue]:rawValue;var value=options.formatMatch(rawValue,i+1,options.data.length);if(value===false)
continue;var firstChar=value.charAt(0).toLowerCase();if(!stMatchSets[firstChar])
stMatchSets[firstChar]=[];var row={value:value,data:rawValue,result:options.formatResult&&options.formatResult(rawValue)||value};stMatchSets[firstChar].push(row);if(nullData++<options.max){stMatchSets[""].push(row);}};$.each(stMatchSets,function(i,value){options.cacheLength++;add(i,value);});}
setTimeout(populate,25);function flush(){data={};length=0;}
return{flush:flush,add:add,populate:populate,load:function(q){if(!options.cacheLength||!length)
return null;if(!options.url&&options.matchContains){var csub=[];for(var k in data){if(k.length>0){var c=data[k];$.each(c,function(i,x){if(matchSubset(x.value,q)){csub.push(x);}});}}
return csub;}else
if(data[q]){return data[q];}else
if(options.matchSubset){for(var i=q.length-1;i>=options.minChars;i--){var c=data[q.substr(0,i)];if(c){var csub=[];$.each(c,function(i,x){if(matchSubset(x.value,q)){csub[csub.length]=x;}});return csub;}}}
return null;}};};$.Autocompleter.Select=function(options,input,select,config){var CLASSES={ACTIVE:"ac_over"};var listItems,active=-1,data,term="",needsInit=true,element,list;function init(){if(!needsInit)
return;element=$("<div/>").hide().addClass(options.resultsClass).css("position","absolute").appendTo(document.body);list=$("<ul/>").appendTo(element).mouseover(function(event){if(target(event).nodeName&&target(event).nodeName.toUpperCase()=='LI'){active=$("li",list).removeClass(CLASSES.ACTIVE).index(target(event));$(target(event)).addClass(CLASSES.ACTIVE);}}).click(function(event){$(target(event)).addClass(CLASSES.ACTIVE);select();input.focus();return false;}).mousedown(function(){config.mouseDownOnSelect=true;}).mouseup(function(){config.mouseDownOnSelect=false;});if(options.width>0)
element.css("width",options.width);needsInit=false;}
function target(event){var element=event.target;while(element&&element.tagName!="LI")
element=element.parentNode;if(!element)
return[];return element;}
function moveSelect(step){listItems.slice(active,active+1).removeClass(CLASSES.ACTIVE);movePosition(step);var activeItem=listItems.slice(active,active+1).addClass(CLASSES.ACTIVE);if(options.scroll){var offset=0;listItems.slice(0,active).each(function(){offset+=this.offsetHeight;});if((offset+activeItem[0].offsetHeight-list.scrollTop())>list[0].clientHeight){list.scrollTop(offset+activeItem[0].offsetHeight-list.innerHeight());}else if(offset<list.scrollTop()){list.scrollTop(offset);}}};function movePosition(step){active+=step;if(active<0){active=listItems.size()-1;}else if(active>=listItems.size()){active=0;}}
function limitNumberOfItems(available){return options.max&&options.max<available?options.max:available;}
function fillList(){list.empty();var max=limitNumberOfItems(data.length);for(var i=0;i<max;i++){if(!data[i])
continue;var formatted=options.formatItem(data[i].data,i+1,max,data[i].value,term);if(formatted===false)
continue;var li=$("<li/>").html(options.highlight(formatted,term)).addClass(i%2==0?"ac_even":"ac_odd").appendTo(list)[0];$.data(li,"ac_data",data[i]);}
listItems=list.find("li");if(options.selectFirst){listItems.slice(0,1).addClass(CLASSES.ACTIVE);active=0;}
if($.fn.bgiframe)
list.bgiframe();}
return{display:function(d,q){init();data=d;term=q;fillList();},next:function(){moveSelect(1);},prev:function(){moveSelect(-1);},pageUp:function(){if(active!=0&&active-8<0){moveSelect(-active);}else{moveSelect(-8);}},pageDown:function(){if(active!=listItems.size()-1&&active+8>listItems.size()){moveSelect(listItems.size()-1-active);}else{moveSelect(8);}},hide:function(){element&&element.hide();listItems&&listItems.removeClass(CLASSES.ACTIVE);active=-1;},visible:function(){return element&&element.is(":visible");},current:function(){return this.visible()&&(listItems.filter("."+CLASSES.ACTIVE)[0]||options.selectFirst&&listItems[0]);},show:function(){var offset=$(input).offset();element.css({width:typeof options.width=="string"||options.width>0?options.width:$(input).width(),top:offset.top+input.offsetHeight,left:offset.left}).show();if(options.scroll){list.css({maxHeight:options.scrollHeight,overflow:'auto'});if($.browser.msie&&typeof document.body.style.maxHeight==="undefined"){var listHeight=0;listItems.each(function(){listHeight+=this.offsetHeight;});var scrollbarsVisible=listHeight>options.scrollHeight;list.css('height',scrollbarsVisible?options.scrollHeight:listHeight);if(!scrollbarsVisible){listItems.width(list.width()-parseInt(listItems.css("padding-left"))-parseInt(listItems.css("padding-right")));}}}},selected:function(){var selected=listItems&&listItems.filter("."+CLASSES.ACTIVE).removeClass(CLASSES.ACTIVE);return selected&&selected.length&&$.data(selected[0],"ac_data");},emptyList:function(){list&&list.empty();},unbind:function(){element&&element.remove();}};};$.Autocompleter.Selection=function(field,start,end){if(field.createTextRange){var selRange=field.createTextRange();selRange.collapse(true);selRange.moveStart("character",start);selRange.moveEnd("character",end);selRange.select();}else if(field.setSelectionRange){field.setSelectionRange(start,end);}else{if(field.selectionStart){field.selectionStart=start;field.selectionEnd=end;}}
field.focus();};})(jQuery);;function displayPopupAddToCart(){$popupCart=$("#popup-cart").clone();$("#popup-cart").remove();$popupCart.appendTo('body');$("#popup-cart").fadeIn(200);middlePopup();$(window).on('resize',middlePopup);$("#close, #continu").click(function(){$(window).unbind('resize');$("#popup-cart").fadeOut(200);return false;});}
function middlePopup(){$windowHeight=$(window).height();$popupHeight=$("#popup-cart-inner").height();positionPopup=(($windowHeight-$popupHeight)/2);$("#popup-cart-inner").css('margin-top',positionPopup+'px');}
ajaxCart.add=function(idProduct,idCombination,addedFromProductPage,callerElement,quantity,wishlist){if(addedFromProductPage&&!checkCustomizations())
{alert(fieldRequired);return;}
emptyCustomizations();if(addedFromProductPage)
{$('#add_to_cart input').attr('disabled',true).removeClass('exclusive').addClass('exclusive_disabled');$('.filled').removeClass('filled');}
else
$(callerElement).attr('disabled',true);if($('#cart_block_list').hasClass('collapsed'))
this.expand();$.ajax({type:'POST',headers:{"cache-control":"no-cache"},url:baseUri+'?rand='+new Date().getTime(),async:true,cache:false,dataType:"json",data:'controller=cart&add=1&ajax=true&qty='+((quantity&&quantity!=null)?quantity:'1')+'&id_product='+idProduct+'&token='+static_token+((parseInt(idCombination)&&idCombination!=null)?'&ipa='+parseInt(idCombination):''),success:function(jsonData,textStatus,jqXHR)
{if(wishlist&&!jsonData.errors)
WishlistAddProductCart(wishlist[0],idProduct,idCombination,wishlist[1]);var $element=$(callerElement).parent().parent().find('a.product_image img,a.product_img_link img');if(!$element.length)
$element=$('#bigpic');var $picture=$element.clone();var pictureOffsetOriginal=$element.offset();pictureOffsetOriginal.right=$(window).innerWidth()-pictureOffsetOriginal.left-$element.width();if($picture.length)
{$picture.css({position:'absolute',top:pictureOffsetOriginal.top,right:pictureOffsetOriginal.right});}
var pictureOffset=$picture.offset();var cartBlock=$('#cart_block');if(!$('#cart_block')[0]||!$('#cart_block').offset().top||!$('#cart_block').offset().left)
cartBlock=$('#shopping_cart');var cartBlockOffset=cartBlock.offset();cartBlockOffset.right=$(window).innerWidth()-cartBlockOffset.left-cartBlock.width();if(cartBlockOffset!=undefined&&$picture.length&&animate==0)
{$picture.appendTo('body');$picture.css({position:'absolute',top:pictureOffsetOriginal.top,right:pictureOffsetOriginal.right,zIndex:4242}).animate({width:$element.attr('width')*0.66,height:$element.attr('height')*0.66,opacity:0.2,top:cartBlockOffset.top+30,right:cartBlockOffset.right+15},1000).fadeOut(100,function(){ajaxCart.updateCartInformation(jsonData,addedFromProductPage);$(this).remove();});}
else
ajaxCart.updateCartInformation(jsonData,addedFromProductPage);if(quantity>0){displayPopupAddToCart();}},error:function(XMLHttpRequest,textStatus,errorThrown)
{alert("Impossible to add the product to the cart.\n\ntextStatus: '"+textStatus+"'\nerrorThrown: '"+errorThrown+"'\nresponseText:\n"+XMLHttpRequest.responseText);if(addedFromProductPage)
$('#add_to_cart input').removeAttr('disabled').addClass('exclusive').removeClass('exclusive_disabled');else
$(callerElement).removeAttr('disabled');}});};$(document).ready(function(){function displayGallery(){$("body > *:not('#productzoomimage')").fadeOut(function(){var indexShown=$("#thumbs_list li").index($("#thumbs_list li a.shown").parent());if(indexShown==-1){indexShown=0;}
$("#gallery-full img").animate({'opacity':0},0);$("#gallery-full img:eq("+indexShown+")").animate({'opacity':1},0).addClass('active');$("#gallery-small img").removeClass('active');$("#gallery-small img:eq("+indexShown+")").addClass('active');$("#gallery-full, #gallery-small, #gallery-detail").fadeIn();window.location.hash="popup";});}
$("#image-block").live("click",function(e){if($.fancybox!=undefined){$.fancybox.close();}
if($('body > #productzoomimage').length==1){displayGallery();}
else{$newGallery=$('#productzoomimage').clone();$('#productzoomimage').remove();$('body').append($newGallery);$("#gallery-loader").fadeIn(400,function(){var nbrTotal=$('#gallery-full img').length;$('#gallery-full img').each(function(){$(this).attr('src',$(this).attr('data-src'));});$nbr=0;$('#gallery-full img').load(function(){$nbr++;if($nbr==nbrTotal){$('#gallery-loader').fadeOut(400,function(){displayGallery();});}});});return false;}});$("#gallery-small li").live("click",function(){$("#gallery-small li img").removeClass("active");$(this).find("img").addClass("active");var index=$("#gallery-small li").index($(this));$("#gallery-full img").removeClass('active-image');$("#gallery-full img:eq("+index+")").addClass('active-image');$("#gallery-full img:not(.active-image)").animate({'opacity':0},1200);$("#gallery-full img:eq("+index+")").animate({'opacity':1},1200);});$("#gallery-close").live("click",function(){$("body > *:not('#productzoomimage, #popup-cart')").fadeIn();$("#gallery-loader, #gallery-detail, #gallery-full, #gallery-small").fadeOut();return false;});window.onhashchange=function(){if(window.location.hash==""){$("body > *:not('#productzoomimage, #popup-cart')").fadeIn();$("#gallery-loader, #gallery-detail, #gallery-full, #gallery-small").fadeOut();}}});$(document).ready(function(){$("#search-link").click(function(){if($("#search-area").css("display")=="block"){$("#search-area").animate({"opacity":0},500,function(){$("#search-area").css("display","none");});}
else{$("#search-area").css("display","block").animate({"opacity":1},500);}
return false;});$("#search-area form").submit(function(){if($("#search-area input[name=search_query]:eq(0)").val()!=""){$("#search-area input[name=search_query]:eq(1)").val($("#search-area input[name=search_query]:eq(0)").val());}});});;