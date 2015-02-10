<?php 
class Ecommerce extends CI_Model {


    function __construct()
    {
        // Call the Model constructor
        parent::__construct();
    }
    
    public function get_images()
    {
        $query = "SELECT url FROM images";
        return $this->db->query($query)->result_array();
    }

    public function get_all_category_with_counts(){
        return $this->db->query("SELECT categories.id, categories.name, SUM(products.inventory_count) AS count FROM categories
                                JOIN products ON categories.id= products.category_id GROUP BY products.category_id")->result_array();
    }

    public function get_product_by_category($category_id){
        return $this->db->query("SELECT images.url FROM images JOIN products ON images.product_id = products.id
                                    JOIN categories ON products.category_id = categories.id 
                                    WHERE categories.id = ?", array('id' => $category_id))->result_array();
    }


}

//end of code