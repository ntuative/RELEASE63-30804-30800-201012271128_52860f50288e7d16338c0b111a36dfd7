package com.sulake.core.localization
{
   public class LocalizationDefinition implements ILocalizationDefinition
   {
       
      
      private var var_1563:String;
      
      private var var_1565:String;
      
      private var var_1564:String;
      
      private var _name:String;
      
      private var var_942:String;
      
      public function LocalizationDefinition(param1:String, param2:String, param3:String)
      {
         super();
         var _loc4_:Array = param1.split("_");
         this.var_1563 = _loc4_[0];
         var _loc5_:Array = String(_loc4_[1]).split(".");
         this.var_1565 = _loc5_[0];
         this.var_1564 = _loc5_[1];
         this._name = param2;
         this.var_942 = param3;
      }
      
      public function get id() : String
      {
         return this.var_1563 + "_" + this.var_1565 + "." + this.var_1564;
      }
      
      public function get languageCode() : String
      {
         return this.var_1563;
      }
      
      public function get countryCode() : String
      {
         return this.var_1565;
      }
      
      public function get encoding() : String
      {
         return this.var_1564;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get url() : String
      {
         return this.var_942;
      }
   }
}
