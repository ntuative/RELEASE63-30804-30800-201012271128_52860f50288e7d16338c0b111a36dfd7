package com.sulake.habbo.communication.messages.incoming.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class CatalogPageMessageProductData
   {
      
      public static const const_77:String = "i";
      
      public static const const_87:String = "s";
      
      public static const const_246:String = "e";
       
      
      private var var_1765:String;
      
      private var var_2006:int;
      
      private var var_1385:String;
      
      private var var_1386:int;
      
      private var var_1764:int;
      
      public function CatalogPageMessageProductData(param1:IMessageDataWrapper)
      {
         super();
         this.var_1765 = param1.readString();
         this.var_2006 = param1.readInteger();
         this.var_1385 = param1.readString();
         this.var_1386 = param1.readInteger();
         this.var_1764 = param1.readInteger();
      }
      
      public function get productType() : String
      {
         return this.var_1765;
      }
      
      public function get furniClassId() : int
      {
         return this.var_2006;
      }
      
      public function get extraParam() : String
      {
         return this.var_1385;
      }
      
      public function get productCount() : int
      {
         return this.var_1386;
      }
      
      public function get expiration() : int
      {
         return this.var_1764;
      }
   }
}
