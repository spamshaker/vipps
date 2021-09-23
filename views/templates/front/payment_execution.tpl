{*
* 2007-2016 PrestaShop
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
*  @copyright  2007-2016 PrestaShop SA
*  @license    http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)
*  International Registered Trademark & Property of PrestaShop SA
*}

{capture name=path}
	<a href="{$link->getPageLink('order', true, NULL, "step=3")|escape:'html':'UTF-8'}" title="{l s='Go back to the Checkout' mod='vipps'}">{l s='Checkout' mod='vipps'}</a><span class="navigation-pipe">{$navigationPipe}</span>{l s='Vipps-wire payment' mod='vipps'}
{/capture}

{include file="$tpl_dir./breadcrumb.tpl"}

<h2>{l s='Order summary' mod='vipps'}</h2>

{assign var='current_step' value='payment'}
{include file="$tpl_dir./order-steps.tpl"}

{if $nbProducts <= 0}
	<p class="warning">{l s='Your shopping cart is empty.' mod='vipps'}</p>
{else}

<h3>{l s='Vipps-wire payment' mod='vipps'}</h3>
<form action="{$link->getModuleLink('vipps', 'validation', [], true)|escape:'html'}" method="post">
<p>
	<img src="{$this_path_bw}vipps.jpg" alt="{l s='Vipps' mod='vipps'}" width="86" height="49" style="float:left; margin: 0 10px 5px 0;" />
	{l s='You have chosen to pay by vipps.' mod='vipps'}
	<br/><br />
	{l s='Here is a short summary of your order:' mod='vipps'}
</p>
<p style="margin-top:20px;">
	- {l s='The total amount of your order is' mod='vipps'}
	<span id="amount" class="price">{displayPrice price=$total}</span>
	{if $use_taxes == 1}
    	{l s='(tax incl.)' mod='vipps'}
    {/if}
</p>
<p>
	-
	{if $currencies|@count > 1}
		{l s='We allow several currencies to be sent via vipps.' mod='vipps'}
		<br /><br />
		{l s='Choose one of the following:' mod='vipps'}
		<select id="currency_payment" name="currency_payment" onchange="setCurrency($('#currency_payment').val());">
			{foreach from=$currencies item=currency}
				<option value="{$currency.id_currency}" {if $currency.id_currency == $cust_currency}selected="selected"{/if}>{$currency.name}</option>
			{/foreach}
		</select>
	{else}
		{l s='We allow the following currency to be sent via vipps:' mod='vipps'}&nbsp;<b>{$currencies.0.name}</b>
		<input type="hidden" name="currency_payment" value="{$currencies.0.id_currency}" />
	{/if}
</p>
<p>
	{l s='Vipps account information will be displayed on the next page.' mod='vipps'}
	<br /><br />
	<b>{l s='Please confirm your order by clicking "I confirm my order".' mod='vipps'}</b>
</p>
<p class="cart_navigation" id="cart_navigation">
	<input type="submit" value="{l s='I confirm my order' mod='vipps'}" class="exclusive_large" />
	<a href="{$link->getPageLink('order', true, NULL, "step=3")|escape:'html'}" class="button_large">{l s='Other payment methods' mod='vipps'}</a>
</p>
</form>
{/if}
