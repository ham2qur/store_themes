{*
 * Systempay V2-Payment Module version 1.3.2 (revision 66320) for Prestashop 1.5-1.6.
 *
 * Copyright (C) 2014-2015 Lyra Network and contributors
 * Support contact : supportvad@lyra-network.com
 * Author link : http://www.lyra-network.com/
 *
 * NOTICE OF LICENSE
 *
 * This source file is licensed under the Open Software License version 3.0
 * that is bundled with this package in the file LICENSE.txt.
 * It is also available through the world-wide-web at this URL:
 * http://opensource.org/licenses/osl-3.0.php
 *
 * @category  payment
 * @package   systempay
 * @author    Lyra Network <supportvad@lyra-network.com>
 * @copyright 2014-2015 Lyra Network and contributors
 * @license   http://opensource.org/licenses/osl-3.0.php  Open Software License (OSL 3.0)
 * @version   1.3.2 (revision 66320)
*}

{capture name=path}Systempay{/capture}
{if version_compare($smarty.const._PS_VERSION_, '1.6', '<')}
	{include file="$tpl_dir./breadcrumb.tpl"}
{/if}

{assign var='current_step' value='payment'}
{include file="$tpl_dir./order-steps.tpl"}

{if isset($systempay_empty_cart) && $systempay_empty_cart}
	<p class="warning">{l s='Your shopping cart is empty.' mod='systempay'}</p>
{else}

	<form action="{$systempay_url|strval}" method="post" id="systempay_form" name="systempay_form">
		{foreach from=$systempay_params key='key' item='value'}
			<input type="hidden" name="{$key|strval}" value="{$value|strval}" />
		{/foreach}
        
        {if isset($systempay_params) && $systempay_params.vads_action_mode == 'SILENT'}
            <h3>{l s='Payment processing' mod='systempay'}</h3>
        {else}
            <h3>{l s='Redirection to payment gateway' mod='systempay'}</h3>
        {/if}

		<p>
			{if $systempay_params.vads_action_mode == 'SILENT'}
				{l s='Please wait a moment. Your order payment is now processing.' mod='systempay'}
			{else}
				{l s='Please wait, you will be redirected to the payment platform.' mod='systempay'}
			{/if}
        </p>
        
        <p>
			{l s='If nothing happens in 10 seconds, please click the button below.' mod='systempay'} 
		</p>

    {if version_compare($smarty.const._PS_VERSION_, '1.6', '<')}
		<p class="cart_navigation">
			<input type="submit" name="submitPayment" value="{l s='Pay' mod='systempay'}" class="exclusive" />
		</p>
	{else}
		<p class="cart_navigation clearfix">
			<button type="submit" name="submitPayment" class="button btn btn-default standard-checkout button-medium" >
				<span>{l s='Pay' mod='systempay'}</span>
			</button>
		</p>
	{/if}
	</form>
	
	<script type="text/javascript">
		{literal}
			$(function() {
				setTimeout(function() {
					$('#systempay_form').submit();
				}, 1000);
			});
		{/literal}
	</script>
{/if}