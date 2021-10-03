package com.sulake.habbo.inventory.effects
{
   import com.sulake.habbo.inventory.common.IThumbListDataProvider;
   
   public class EffectListProxy implements IThumbListDataProvider
   {
       
      
      private var var_63:EffectsModel;
      
      private var var_318:int;
      
      public function EffectListProxy(param1:EffectsModel, param2:int)
      {
         super();
         this.var_63 = param1;
         this.var_318 = param2;
      }
      
      public function dispose() : void
      {
         this.var_63 = null;
      }
      
      public function getDrawableList() : Array
      {
         return this.var_63.getEffects(this.var_318);
      }
   }
}
