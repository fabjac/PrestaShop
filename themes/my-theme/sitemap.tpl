{*
* 2007-2015 PrestaShop
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
*  @copyright  2007-2015 PrestaShop SA
*  @license    http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)
*  International Registered Trademark & Property of PrestaShop SA
*}

{capture name=path}{l s='Sitemap'}{/capture}

<h1 class="page-heading">
    {l s='Sitemap'}
</h1>
<div id="sitemap_content" class="row">
	<div class="col-xs-12 col-sm-6">
		<div class="sitemap_block box">
    		<h3 class="page-subheading">{l s='Our offers'}</h3>
    		<ul>
    			<li>
                    <a 
                    href="{$link->getPageLink('new-products')|escape:'html':'UTF-8'}" 
                    title="{l s='View a new product'}">
                        {l s='New products'}
                    </a>
                </li>
    			{if !$PS_CATALOG_MODE}
    			{if $PS_DISPLAY_BEST_SELLERS}
        			<li>
                        <a 
                        href="{$link->getPageLink('best-sales')|escape:'html':'UTF-8'}" 
                        title="{l s='View top-selling products'}">
                            {l s='Best sellers'}
                        </a>
                    </li>
                {/if}
        			<li>
                        <a 
                        href="{$link->getPageLink('prices-drop')|escape:'html':'UTF-8'}" 
                        title="{l s='View products with a price drop'}">
                            {l s='Price drop'}
                        </a>
                    </li>
    			{/if}
    			{if $display_manufacturer_link OR $PS_DISPLAY_SUPPLIERS}
                    <li>
                        <a 
                        href="{$link->getPageLink('manufacturer')|escape:'html':'UTF-8'}" 
                        title="{l s='View a list of manufacturers'}">
                            {l s='Manufacturers'}
                        </a>
                    </li>
                {/if}
    			{if $display_supplier_link OR $PS_DISPLAY_SUPPLIERS}
                    <li>
                        <a 
                        href="{$link->getPageLink('supplier')|escape:'html':'UTF-8'}" 
                        title="{l s='View a list of suppliers'}">
                            {l s='Suppliers'}
                        </a>
                    </li>
                {/if}
    		</ul>
	   </div>
    </div>
</div>
<div id="listpage_content" class="row">
	<div class="col-xs-12 col-sm-6">
		<div class="categTree box">
            <h3 class="page-subheading">{l s='Categories'}</h3>
            <div class="tree_top">
                <a href="{$base_dir_ssl}" title="{$categoriesTree.name|escape:'html':'UTF-8'}"></a>
            </div>
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
    </div>
</div>
