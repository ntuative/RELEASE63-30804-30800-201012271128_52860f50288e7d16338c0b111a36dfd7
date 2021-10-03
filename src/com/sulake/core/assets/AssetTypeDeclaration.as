package com.sulake.core.assets
{
   public class AssetTypeDeclaration
   {
       
      
      private var var_2015:String;
      
      private var var_2017:Class;
      
      private var var_2016:Class;
      
      private var var_1496:Array;
      
      public function AssetTypeDeclaration(param1:String, param2:Class, param3:Class, ... rest)
      {
         super();
         this.var_2015 = param1;
         this.var_2017 = param2;
         this.var_2016 = param3;
         if(rest == null)
         {
            this.var_1496 = new Array();
         }
         else
         {
            this.var_1496 = rest;
         }
      }
      
      public function get mimeType() : String
      {
         return this.var_2015;
      }
      
      public function get assetClass() : Class
      {
         return this.var_2017;
      }
      
      public function get loaderClass() : Class
      {
         return this.var_2016;
      }
      
      public function get fileTypes() : Array
      {
         return this.var_1496;
      }
   }
}
