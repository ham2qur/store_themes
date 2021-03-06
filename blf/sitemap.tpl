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

{capture name=path}{l s='Sitemap'}{/capture}
{include file="$tpl_dir./breadcrumb.tpl"}

<h1>{l s='Sitemap'}</h1>
<div id="sitemap_content" class="clearfix">
	<div class="sitemap_block">
		<h3>{l s='Our offers'}</h3>
		<ul>
			<li><a href="{$link->getPageLink('new-products')|escape:'html'}">{l s='New products'}</a></li>
			{if !$PS_CATALOG_MODE}
			<li><a href="{$link->getPageLink('best-sales')|escape:'html'}">{l s='Best sellers'}</a></li>
			<li><a href="{$link->getPageLink('prices-drop')|escape:'html'}">{l s='Price drop'}</a></li>
			{/if}
			{if $display_manufacturer_link OR $PS_DISPLAY_SUPPLIERS}<li><a href="{$link->getPageLink('manufacturer')|escape:'html'}">{l s='Manufacturers:'}</a></li>{/if}
			{if $display_supplier_link OR $PS_DISPLAY_SUPPLIERS}<li><a href="{$link->getPageLink('supplier')|escape:'html'}">{l s='Suppliers:'}</a></li>{/if}
		</ul>
	</div>
	<div class="sitemap_block">
		<h3>{l s='Your Account'}</h3>
		<ul>
		{if $logged}
			<li><a href="{$link->getPageLink('my-account', true)|escape:'html'}" rel="nofollow">{l s='Your Account'}</a></li>
			<li><a href="{$link->getPageLink('identity', true)|escape:'html'}" rel="nofollow">{l s='Personal information'}</a></li>
			<li><a href="{$link->getPageLink('addresses', true)|escape:'html'}" rel="nofollow">{l s='Addresses'}</a></li>
			{if $voucherAllowed}<li><a href="{$link->getPageLink('discount', true)|escape:'html'}" rel="nofollow">{l s='Discounts'}</a></li>{/if}
			<li><a href="{$link->getPageLink('history', true)|escape:'html'}" rel="nofollow">{l s='Order history'}</a></li>
		{else}
			<li><a href="{$link->getPageLink('authentication', true)|escape:'html'}" rel="nofollow">{l s='Authentication'}</a></li>
			<li><a href="{$link->getPageLink('authentication', true)|escape:'html'}" rel="nofollow">{l s='Create new account'}</a></li>
		{/if}
		{if $logged}
			<li><a href="{$link->getPageLink('index')}?mylogout" rel="nofollow">{l s='Log out'}</a></li>
		{/if}
		</ul>
	</div>
	<br class="clear" />
</div>
<div id="listpage_content">
	<div class="categTree">
		<h3>{l s='Categories'}</h3>
		<div class="tree_top"><a href="{$base_dir_ssl}">{$categoriesTree.name|escape:'htmlall':'UTF-8'}</a></div>
		<ul class="tree">
		{if isset($categoriesTree.children)}
			{foreach $categoriesTree.children as $child}
				{if $child@last}
					{include file="$tpl_dir./category-tree-branch.tpl" node=$child last='true'}
				{else}
					{include file="$tpl_dir./category-tree-branch.tpl" node=$child}
				{/if}
			{/foreach}
		{/if}
		</ul>
	</div>
	<div class="categTree">
		<h3>{l s='Pages'}</h3>
		<div class="tree_top"><a href="{$categoriescmsTree.link}">{$categoriescmsTree.name|escape:'htmlall':'UTF-8'}</a></div>
		<ul class="tree">
			{if isset($categoriescmsTree.children)}
				{foreach $categoriescmsTree.children as $child}
					{if (isset($child.children) && $child.children|@count > 0) || $child.cms|@count > 0}
						{include file="$tpl_dir./category-cms-tree-branch.tpl" node=$child}
					{/if}
				{/foreach}
			{/if}
			{foreach from=$categoriescmsTree.cms item=cms name=cmsTree}
				<li><a href="{$cms.link|escape:'htmlall':'UTF-8'}">{$cms.meta_title|escape:'htmlall':'UTF-8'}</a></li>
			{/foreach}
			<li><a href="{$link->getPageLink('contact', true)|escape:'html'}">{l s='Contact'}</a></li>
			{if $display_store}<li class="last"><a href="{$link->getPageLink('stores')|escape:'html'}">{l s='Our stores'}</a></li>{/if}
		</ul>
	</div>
</div>
