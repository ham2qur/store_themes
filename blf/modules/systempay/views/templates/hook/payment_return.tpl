{*
 * Systempay payment module 1.2f (revision 61545)
 *
 * Compatible with V2 payment platform. Developped for Prestashop 1.5.0.x.
 * Support contact: supportvad@lyra-network.com.
 * 
 * Copyright (C) 2014 Lyra Network (http://www.lyra-network.com/) and contributors
 * 
 * 
 * NOTICE OF LICENSE
 *
 * This source file is licensed under the Open Software License version 3.0
 * that is bundled with this package in the file LICENSE.txt.
 * It is also available through the world-wide-web at this URL:
 * http://opensource.org/licenses/osl-3.0.php
*}

{assign var='warnStyle' value='background: none repeat scroll 0 0 #FFFFE0; border: 1px solid #E6DB55; font-size: 13px; margin: 0 0 10px; padding: 10px;'}

{if $check_url_warn == true}
	<p style="{$warnStyle}">
		{if $maintenance_mode == true}
			{l s='The shop is in maintenance mode. The automatic notification (peer to peer connection between the payment platform and your shopping cart solution) cannot work.' mod='systempay'}
		{else}
			{l s='The automatic notification (peer to peer connection between the payment platform and your shopping cart solution) hasn\'t worked. Have you correctly set up the server URL in your store backoffice ?' mod='systempay'}
			<br />
			{l s='For understanding the problem, please read the documentation of the module : ' mod='systempay'}<br />
			&nbsp;&nbsp;&nbsp;- {l s='Chapter «To read carefully before going further»' mod='systempay'}<br />
			&nbsp;&nbsp;&nbsp;- {l s='Chapter «Server URL settings»' mod='systempay'}
		{/if}
		
		<br />
		{l s='If you think this is an error, you can contact our' mod='systempay'}
		<a href="{$link->getPageLink('contact', true)}">{l s='customer support' mod='systempay'}</a>.
	</p>

{/if}

{if $prod_info == true}
	<p style="{$warnStyle}">
		<u><b>{l s='GOING INTO PRODUCTION' mod='systempay'}</b></u><br />
		{l s='You want to know how to put your shop into production mode, please go to this URL : ' mod='systempay'}
		<a href="https://paiement.systempay.fr/html/faq/prod" target="_blank">https://paiement.systempay.fr/html/faq/prod</a>
	</p>
	
	<br/>
{/if}

<br/>

{if $error_msg == true}
	<p style="{$warnStyle}">
		{l s='Your order has been registered with a payment error.' mod='systempay'}
		
		{l s='Please contact our' mod='systempay'}&nbsp;<a href="{$link->getPageLink('contact', true)}">{l s='customer support' mod='systempay'}</a>.
	</p>
{else}
	<div id="payment-result">
        <img src="{$base_dir}themes/blf/img/thanks-payment.jpg" alt="" />
        <h2>{l s='Congratulation for your command' mod='systempay'}</h2>
        <h3>{l s='We registered your payment of ' mod='systempay'} <span class="price">{$total_to_pay}</span></h3>
		<p>{l s='For any questions or for further information, please contact our' mod='systempay'} <a href="{$link->getPageLink('contact', true)}">{l s='customer support' mod='systempay'}</a></p>.
    </div>
{/if}

