{*
* 2007-2013 PrestaShop
*
* NOTICE OF LICENSE
*
* This source file is subject to the Academic Free License (AFL 3.0)
* that is bundled with this package in the file LICENSE.txt.
* It is also available through the world-wide-web at this URL:
* http://opensource.org/licenses/afl-3.0.php
* If you did not receive a copy of the license and are unable to
* obtain it through the world-wide-web, please send an email
* to license@prestashop.com so we can send you a copy immediately.
*
* DISCLAIMER
*
* Do not edit or add to this file if you wish to upgrade PrestaShop to newer
* versions in the future. If you wish to customize PrestaShop for your
* needs please refer to http://www.prestashop.com for more information.
*
*  @author PrestaShop SA <contact@prestashop.com>
*  @copyright  2007-2013 PrestaShop SA
*  @license    http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)
*  International Registered Trademark & Property of PrestaShop SA
*}

{capture name=path}{l s='Contact'}{/capture}
{include file="$tpl_dir./breadcrumb.tpl"}

<h1>{l s='Customer service'} - {if isset($customerThread) && $customerThread}{l s='Your reply'}{else}{l s='Contact us'}{/if}</h1>

{if isset($confirmation)}
	<p>{l s='Your message has been successfully sent to our team.'}</p>
	<ul class="footer_links">
		<li><a href="{$base_dir}"><img class="icon" alt="" src="{$img_dir}icon/home.gif"/></a><a href="{$base_dir}">{l s='Home'}</a></li>
	</ul>
{elseif isset($alreadySent)}
	<p>{l s='Your message has already been sent.'}</p>
	<ul class="footer_links">
		<li><a href="{$base_dir}"><img class="icon" alt="" src="{$img_dir}icon/home.gif"/></a><a href="{$base_dir}">{l s='Home'}</a></li>
	</ul>
{else}

	<div itemscope itemtype="http://schema.org/FurnitureStore">

		<br /><span style="font-weight: bold" itemprop="name">Мир Дома - интернет-магазин мебели</span>
		<div itemprop="address" itemscope itemtype="http://schema.org/PostalAddress">
			<span itemprop="streetAddress">улица Краснопольская, д.9, офис 429</span><br>
			<span itemprop="addressLocality">Днепропетровск</span>, <span itemprop="postalCode">49000</span><br>
			<span itemprop="addressCountry">Украина</span><br><br>
		</div>

		<strong>Телефоны</strong><br>
		<span style="font-size:18px; line-height: 20px; ">
			<img src="http://www.mirdoma.com.ua/img/telephone.png" style="margin: 0 0 3px 2px;"> <span itemprop="telephone">056 734-07-13</span><br>
			<img src="http://www.mirdoma.com.ua/img/kyivstar_logo.png" style="margin: 0 0 7px 0;"> 068 917-39-40<br>
			<img src="http://www.mirdoma.com.ua/img/mts_logo.png" style="margin: 0 0 5px 0;"> 095 487-00-35
		</span><br><br>

		<strong>Электронная почта:</strong> <a itemprop="email" href="mailto:sales@mirdoma.com.ua">sales@mirdoma.com.ua</a><br>
		<strong>Адрес сайта:</strong> <a itemprop="url" href="http://www.MirDoma.com.ua">www.MirDoma.com.ua</a><br><br>

		<strong>Режим работы офиса</strong><br>
		<time itemprop="openingHours" datetime="Mo-Fr 10:00−18:00"> • Пн-Пт с 10:00 до 18:00;</time><br>
		<strong>Прием заказов и консультации по телефону</strong><br>
			• Пн-Пт с 10:00 до 18:00.<br>
			• Сб-Вс с 10:00 до 16:00.
	</div>

	<p><script type="text/javascript" charset="utf-8" src="//api-maps.yandex.ru/services/constructor/1.0/js/?sid=aKXJZPFZ-M05X30Zg6kmufERKRQ8aez1&width=700&height=450"></script><br></p>

	<p class="bold">{l s='For questions about an order or for more information about our products'}.</p>
	{include file="$tpl_dir./errors.tpl"}
	<form action="{$request_uri|escape:'htmlall':'UTF-8'}" method="post" class="std" enctype="multipart/form-data">
		<fieldset>
			<h3>{l s='send a message'}</h3>
			<p class="select">
				<label for="id_contact">{l s='Subject Heading'}</label>
			{if isset($customerThread.id_contact)}
				{foreach from=$contacts item=contact}
					{if $contact.id_contact == $customerThread.id_contact}
						<input type="text" id="contact_name" name="contact_name" value="{$contact.name|escape:'htmlall':'UTF-8'}" readonly="readonly" />
						<input type="hidden" name="id_contact" value="{$contact.id_contact}" />
					{/if}
				{/foreach}
			</p>
			{else}
				<select id="id_contact" name="id_contact" onchange="showElemFromSelect('id_contact', 'desc_contact')">
					<option value="0">{l s='-- Choose --'}</option>
				{foreach from=$contacts item=contact}
					<option value="{$contact.id_contact|intval}" {if isset($smarty.request.id_contact) && $smarty.request.id_contact == $contact.id_contact}selected="selected"{/if}>{$contact.name|escape:'htmlall':'UTF-8'}</option>
				{/foreach}
				</select>
			</p>
			<p id="desc_contact0" class="desc_contact">&nbsp;</p>
				{foreach from=$contacts item=contact}
					<p id="desc_contact{$contact.id_contact|intval}" class="desc_contact" style="display:none;">
						{$contact.description|escape:'htmlall':'UTF-8'}
					</p>
				{/foreach}
			{/if}
			<p class="text">
				<label for="email">{l s='Email address'}</label>
				{if isset($customerThread.email)}
					<input type="text" id="email" name="from" value="{$customerThread.email|escape:'htmlall':'UTF-8'}" readonly="readonly" />
				{else}
					<input type="text" id="email" name="from" value="{$email|escape:'htmlall':'UTF-8'}" />
				{/if}
			</p>
		{if !$PS_CATALOG_MODE}
			{if (!isset($customerThread.id_order) || $customerThread.id_order > 0)}
			<p class="text select">
				<label for="id_order">{l s='Order reference'}</label>
				{if !isset($customerThread.id_order) && isset($isLogged) && $isLogged == 1}
					<select name="id_order" >
						<option value="0">{l s='-- Choose --'}</option>
						{foreach from=$orderList item=order}
							<option value="{$order.value|intval}" {if $order.selected|intval}selected="selected"{/if}>{$order.label|escape:'htmlall':'UTF-8'}</option>
						{/foreach}
					</select>
				{elseif !isset($customerThread.id_order) && empty($isLogged)}
					<input type="text" name="id_order" id="id_order" value="{if isset($customerThread.id_order) && $customerThread.id_order|intval > 0}{$customerThread.id_order|intval}{else}{if isset($smarty.post.id_order) && !empty($smarty.post.id_order)}{$smarty.post.id_order|intval}{/if}{/if}" />
				{elseif $customerThread.id_order|intval > 0}
					<input type="text" name="id_order" id="id_order" value="{$customerThread.id_order|intval}" readonly="readonly" />
				{/if}
			</p>
			{/if}
			{if isset($isLogged) && $isLogged}
			<p class="text select">
			<label for="id_product">{l s='Product'}</label>
				{if !isset($customerThread.id_product)}
				{foreach from=$orderedProductList key=id_order item=products name=products}
					<select name="id_product" id="{$id_order}_order_products" class="product_select" style="width:300px;{if !$smarty.foreach.products.first} display:none; {/if}" {if !$smarty.foreach.products.first}disabled="disabled" {/if}>
						<option value="0">{l s='-- Choose --'}</option>
						{foreach from=$products item=product}
							<option value="{$product.value|intval}">{$product.label|escape:'htmlall':'UTF-8'}</option>
						{/foreach}
					</select>
				{/foreach}
				{elseif $customerThread.id_product > 0}
					<input type="text" name="id_product" id="id_product" value="{$customerThread.id_product|intval}" readonly="readonly" />
				{/if}
			</p>
			{/if}
		{/if}
<!-- 		{if $fileupload == 1}
			<p class="text">
			<label for="fileUpload">{l s='Attach File'}</label>
				<input type="hidden" name="MAX_FILE_SIZE" value="2000000" />
				<input type="file" name="fileUpload" id="fileUpload" />
			</p>
		{/if} -->
		<p class="textarea">
			<label for="message">{l s='Message'}</label>
			 <textarea id="message" name="message" rows="15" cols="10">{if isset($message)}{$message|escape:'htmlall':'UTF-8'|stripslashes}{/if}</textarea>
		</p>
		<p class="submit">
			<input type="submit" name="submitMessage" id="submitMessage" value="{l s='Send'}" class="button_large" />
		</p>
	</fieldset>
</form>
{/if}
