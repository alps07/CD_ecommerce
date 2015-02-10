<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Customers extends CI_Controller {

	public function __construct()
	{
		parent::__construct();
		$this->load->model('Ecommerce');
		//$this->output->enable_profiler();
	}

	public function index()
	{
		$this->load->view('home');
	}

	public function catalog()
	{
		$result1= $this->Ecommerce->get_images();
		$result2 = $this->Ecommerce->get_all_category_with_counts();
		// $datas['types'] = $result2;
		// // var_dump($result);
		// $images ['imgs'] = $result1;
		//var_dump($result2); die();
		$array = array(
					'types' => $result2,
					'imgs' => $result1
					);
		$this->load->view('catalog', $array);
	}

	public function product(){
		$this->load->view('product');
	}

	public function buy(){
		echo "Thank you for buying!";
	}

	public function cups(){
		$this->load->view('cups');
	}

	public function get_product($category_id){
	
		$result = $this->Ecommerce->get_product_by_category($category_id);
		var_dump($result); die();
		$product['images'] = $result;
		$this->load->view('catalog', $product);
	}

}

//end of main controller