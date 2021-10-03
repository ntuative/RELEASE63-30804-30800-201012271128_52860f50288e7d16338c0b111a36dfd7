package com.sulake.core.runtime
{
   class ComponentInterfaceQueue implements IDisposable
   {
       
      
      private var var_1792:IID;
      
      private var var_677:Boolean;
      
      private var var_1127:Array;
      
      function ComponentInterfaceQueue(param1:IID)
      {
         super();
         this.var_1792 = param1;
         this.var_1127 = new Array();
         this.var_677 = false;
      }
      
      public function get identifier() : IID
      {
         return this.var_1792;
      }
      
      public function get disposed() : Boolean
      {
         return this.var_677;
      }
      
      public function get receivers() : Array
      {
         return this.var_1127;
      }
      
      public function dispose() : void
      {
         if(!this.var_677)
         {
            this.var_677 = true;
            this.var_1792 = null;
            while(this.var_1127.length > 0)
            {
               this.var_1127.pop();
            }
            this.var_1127 = null;
         }
      }
   }
}
