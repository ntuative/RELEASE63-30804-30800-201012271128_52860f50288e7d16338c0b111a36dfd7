package com.sulake.habbo.inventory.effects
{
   import com.sulake.habbo.inventory.common.IThumbListDrawableItem;
   import com.sulake.habbo.widget.memenu.IWidgetAvatarEffect;
   import flash.display.BitmapData;
   
   public class Effect implements IWidgetAvatarEffect, IThumbListDrawableItem
   {
       
      
      private var _type:int;
      
      private var var_1524:int;
      
      private var var_811:int = 1;
      
      private var var_1246:int;
      
      private var var_394:Boolean = false;
      
      private var _isSelected:Boolean = false;
      
      private var var_1523:Boolean = false;
      
      private var var_629:BitmapData;
      
      private var var_2084:Date;
      
      public function Effect()
      {
         super();
      }
      
      public function get type() : int
      {
         return this._type;
      }
      
      public function get duration() : int
      {
         return this.var_1524;
      }
      
      public function get effectsInInventory() : int
      {
         return this.var_811;
      }
      
      public function get isActive() : Boolean
      {
         return this.var_394;
      }
      
      public function get isInUse() : Boolean
      {
         return this.var_1523;
      }
      
      public function get isSelected() : Boolean
      {
         return this._isSelected;
      }
      
      public function get icon() : BitmapData
      {
         return this.var_629;
      }
      
      public function get iconImage() : BitmapData
      {
         return this.var_629;
      }
      
      public function get secondsLeft() : int
      {
         var _loc1_:int = 0;
         if(this.var_394)
         {
            _loc1_ = this.var_1246 - (new Date().valueOf() - this.var_2084.valueOf()) / 1000;
            _loc1_ = Math.floor(_loc1_);
            if(_loc1_ < 0)
            {
               _loc1_ = 0;
            }
            return _loc1_;
         }
         return this.var_1246;
      }
      
      public function set type(param1:int) : void
      {
         this._type = param1;
      }
      
      public function set duration(param1:int) : void
      {
         this.var_1524 = param1;
      }
      
      public function set secondsLeft(param1:int) : void
      {
         this.var_1246 = param1;
      }
      
      public function set isSelected(param1:Boolean) : void
      {
         this._isSelected = param1;
      }
      
      public function set isInUse(param1:Boolean) : void
      {
         this.var_1523 = param1;
      }
      
      public function set iconImage(param1:BitmapData) : void
      {
         this.var_629 = param1;
      }
      
      public function set effectsInInventory(param1:int) : void
      {
         this.var_811 = param1;
      }
      
      public function set isActive(param1:Boolean) : void
      {
         if(param1 && !this.var_394)
         {
            this.var_2084 = new Date();
         }
         this.var_394 = param1;
      }
      
      public function setOneEffectExpired() : void
      {
         --this.var_811;
         if(this.var_811 < 0)
         {
            this.var_811 = 0;
         }
         this.var_1246 = this.var_1524;
         this.var_394 = false;
         this.var_1523 = false;
      }
   }
}
