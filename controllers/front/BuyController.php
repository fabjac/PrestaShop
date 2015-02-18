<?php

class BuyControllerCore extends FrontController
{
	public $php_self = 'buy';

	protected $id_product;
	protected $id_product_attribute;

	/**
	 * This is not a public page, so the canonical redirection is disabled
	 */
	public function canonicalRedirection($canonicalURL = '')
	{
	}

	/**
	 * Initialize cart controller
	 * @see FrontController::init()
	 */
	public function init()
	{
		parent::init();

		// Send noindex to avoid ghost carts by bots
		header("X-Robots-Tag: noindex, nofollow", true);

		// Get page main parameters
		$this->id_product = (int)Tools::getValue('id_product', null);
		$this->id_product_attribute = (int)Tools::getValue('id_product_attribute', Tools::getValue('ipa'));
	}

	public function postProcess()
	{
	  if ($this->id_product)
	  {
	    $product = new Product((int) $this->id_product);

	    if (Validate::isLoadedObject($product)) {
	      $supplier = new Supplier((int) $product->id_supplier);

	      if (Validate::isLoadedObject($supplier)) {
		header('Location: http://www.shareasale.com/m-pr.cfm?merchantID=' . $supplier->name . '&userID=1050945&atc=1&productID=' . $product->reference);
	      }
	      else
		header('Location: /404-not-found');
	    }
	    else
	      header('Location: /404-not-found');
	  }
	}
}
