package com.sulake.habbo.session.product
{
   public class ProductData implements IProductData
   {
       
      
      private var _type:String;
      
      private var _name:String;
      
      private var var_1469:String;
      
      private var var_2100:String;
      
      public function ProductData(param1:String, param2:String, param3:String, param4:String = "")
      {
         super();
         this._type = param1;
         this._name = param2;
         this.var_1469 = param3;
         this.var_2100 = param4;
      }
      
      public function get type() : String
      {
         return this._type;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get description() : String
      {
         return this.var_1469;
      }
      
      public function get specialData() : String
      {
         return this.var_2100;
      }
   }
}
