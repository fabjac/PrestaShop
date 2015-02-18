<span class="a-size-large">
    {assign var="affiliate_link" value="{$link->getPageLink('buy.php',false, NULL, "id_product={$id}&amp;token={$static_token}", false)|escape:'html':'UTF-8'}"}
    <a class="button ajax_add_to_cart_button btn btn-default" target="_blank" href="{$affiliate_link}" rel="nofollow">
      <span>BUY NOW</span>
    </a>
</span>
