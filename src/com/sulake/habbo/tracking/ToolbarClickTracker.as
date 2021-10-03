package com.sulake.habbo.tracking
{
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   
   public class ToolbarClickTracker
   {
       
      
      private var var_1192:IHabboTracking;
      
      private var var_1443:Boolean = false;
      
      private var var_2176:int = 0;
      
      private var var_1567:int = 0;
      
      public function ToolbarClickTracker(param1:IHabboTracking)
      {
         super();
         this.var_1192 = param1;
      }
      
      public function dispose() : void
      {
         this.var_1192 = null;
      }
      
      public function configure(param1:IHabboConfigurationManager) : void
      {
         this.var_1443 = Boolean(parseInt(param1.getKey("toolbar.tracking.enabled","1")));
         this.var_2176 = parseInt(param1.getKey("toolbar.tracking.max.events","100"));
      }
      
      public function track(param1:String) : void
      {
         if(!this.var_1443)
         {
            return;
         }
         ++this.var_1567;
         if(this.var_1567 <= this.var_2176)
         {
            this.var_1192.track("toolbar",param1);
         }
      }
   }
}
