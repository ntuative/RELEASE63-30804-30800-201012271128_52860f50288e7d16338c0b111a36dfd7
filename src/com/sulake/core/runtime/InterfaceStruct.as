package com.sulake.core.runtime
{
   import flash.utils.getQualifiedClassName;
   
   final class InterfaceStruct implements IDisposable
   {
       
      
      private var var_1273:IID;
      
      private var var_1560:String;
      
      private var var_112:IUnknown;
      
      private var var_674:uint;
      
      function InterfaceStruct(param1:IID, param2:IUnknown)
      {
         super();
         this.var_1273 = param1;
         this.var_1560 = getQualifiedClassName(this.var_1273);
         this.var_112 = param2;
         this.var_674 = 0;
      }
      
      public function get iid() : IID
      {
         return this.var_1273;
      }
      
      public function get iis() : String
      {
         return this.var_1560;
      }
      
      public function get unknown() : IUnknown
      {
         return this.var_112;
      }
      
      public function get references() : uint
      {
         return this.var_674;
      }
      
      public function get disposed() : Boolean
      {
         return this.var_112 == null;
      }
      
      public function dispose() : void
      {
         this.var_1273 = null;
         this.var_1560 = null;
         this.var_112 = null;
         this.var_674 = 0;
      }
      
      public function reserve() : uint
      {
         return ++this.var_674;
      }
      
      public function release() : uint
      {
         return this.references > 0 ? uint(--this.var_674) : uint(0);
      }
   }
}
