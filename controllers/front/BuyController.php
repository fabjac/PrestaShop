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
	}

	public function postProcess()
	{
	  if ($this->id_product)
	  {
	    $product = new Product((int) $this->id_product);

	    if (Validate::isLoadedObject($product)) {
	      $supplier = new Supplier((int) $product->id_supplier);

	      if (Validate::isLoadedObject($supplier)) {
		$this->saveClick();
		header('Location: http://www.shareasale.com/m-pr.cfm?merchantID=' . $supplier->name . '&userID=1050945&atc=1&productID=' . $product->reference);
	      }
	      else
		header('Location: /404-not-found');
	    }
	    else
	      header('Location: /404-not-found');
	  }
	}

	private function saveClick()
	{
	  global $_SERVER;
	  $db = Db::getInstance();
	  $sql = 'insert into ' . _DB_PREFIX_ . 'stats_visitors (';
	  $sql .= "date_day,";
	  $sql .= "date_time,";
	  $sql .= "addr,";
	  $sql .= "host,";
	  $sql .= "uri,";
	  $sql .= "query_string,";
	  $sql .= "user_agent,";
	  $sql .= "lang,";
	  $sql .= "referer,";
	  $sql .= "id_product)";
	  $sql .= " values ";
	  $sql .= "('";
	  $sql .= date("Ymd");
	  $sql .= "','";
	  $sql .= date("His");
	  $sql .= "','";
	  $sql .= $_SERVER["REMOTE_ADDR"];
	  $sql .= "','";
	  $sql .= $_SERVER["REMOTE_HOST"];
	  $sql .= "','";
	  $sql .= $_SERVER["SCRIPT_NAME"];
	  $sql .= "','";
	  $sql .= $_SERVER["QUERY_STRING"];
	  $sql .= "','";
	  $sql .= $_SERVER["HTTP_USER_AGENT"];
	  $sql .= "','";
	  $sql .= $_SERVER["HTTP_ACCEPT_LANGUAGE"];
	  $sql .= "','";
	  $sql .= $_SERVER["HTTP_REFERER"];
	  $sql .= "',";
	  $sql .= $this->id_product;
	  $sql .= ")";
	  $db->execute($sql);
	}

}
