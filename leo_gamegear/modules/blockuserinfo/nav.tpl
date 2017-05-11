
<!-- Block user information module NAV  -->
<div class="header_user_info popup-over pull-left e-scale">
	<div class="popup-title"><i class="fa fa-sign-in"></i><span>{l s='Top links' mod='blockuserinfo'} </span></div>	
	<div class="popup-content">
		<ul class="links">
			{if $is_logged}
				<li>
					<a href="{$link->getPageLink('my-account', true)|escape:'html':'UTF-8'}" title="{l s='View my customer account' mod='blockuserinfo'}" class="account" rel="nofollow">
						<i class="fa fa-user"></i><span>{l s='Hello' mod='blockuserinfo'}, {$cookie->customer_firstname} {$cookie->customer_lastname}</span></a>
				</li>
			{/if}
			{if $is_logged}
				<li><a class="logout" href="{$link->getPageLink('index', true, NULL, "mylogout")|escape:'html':'UTF-8'}" rel="nofollow" title="{l s='Log me out' mod='blockuserinfo'}">
					<i class="fa fa-unlock-alt"></i>{l s='Sign out' mod='blockuserinfo'}
				</a></li>
			{else}
				<li><a class="login" href="{$link->getPageLink('my-account', true)|escape:'html':'UTF-8'}" rel="nofollow" title="{l s='Login to your customer account' mod='blockuserinfo'}">
					<i class="fa fa-unlock-alt"></i>{l s='Sign in' mod='blockuserinfo'}
				</a></li>
			{/if}

			<li>
				<a href="{$link->getPageLink('my-account', true)|escape:'html':'UTF-8'}" title="{l s='My account' mod='blockuserinfo'}"><i class="fa fa-user"></i>{l s='My Account' mod='blockuserinfo'}</a>
			</li>
			
			<li>
				<a href="{$link->getPageLink('order', true)|escape:'html':'UTF-8'}" title="{l s='Checkout' mod='blockuserinfo'}" class="last"><i class="fa fa-share"></i>{l s='Checkout' mod='blockuserinfo'}</a>
			</li>

			<li>
				<a id="wishlist-total" href="{$link->getModuleLink('blockwishlist', 'mywishlist', array(), true)|addslashes}" title="{l s='My wishlists' mod='blockuserinfo'}">
				<i class="fa fa-heart"></i>{l s='Wish List' mod='blockuserinfo'}</a>
			</li>
			<li>
				<a href="{$link->getPageLink('products-comparison')|escape:'html':'UTF-8'}" title="{l s='Compare' mod='blockuserinfo'}" rel="nofollow">
					<i class="fa fa-compress"></i>{l s='Compare' mod='blockuserinfo'}
				</a>
			</li>
			
		</ul>
	</div>
</div>	