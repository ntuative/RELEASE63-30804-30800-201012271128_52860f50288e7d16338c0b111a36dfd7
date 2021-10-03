package com.sulake.habbo.navigator
{
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.ITextFieldWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowKeyboardEvent;
   import flash.events.Event;
   import flash.geom.Point;
   import flash.ui.Keyboard;
   
   public class TextFieldManager
   {
       
      
      private var _navigator:HabboNavigator;
      
      private var var_70:ITextFieldWindow;
      
      private var var_586:Boolean;
      
      private var var_1308:String = "";
      
      private var var_1673:int;
      
      private var var_1672:Function;
      
      private var var_2347:String = "";
      
      private var var_123:IWindowContainer;
      
      private var var_2349:Boolean;
      
      private var _orgTextBackgroundColor:uint;
      
      private var var_2348:uint;
      
      public function TextFieldManager(param1:HabboNavigator, param2:ITextFieldWindow, param3:int = 1000, param4:Function = null, param5:String = null)
      {
         super();
         this._navigator = param1;
         this.var_70 = param2;
         this.var_1673 = param3;
         this.var_1672 = param4;
         if(param5 != null)
         {
            this.var_586 = true;
            this.var_1308 = param5;
            this.var_70.text = param5;
         }
         Util.setProcDirectly(this.var_70,this.onInputClick);
         this.var_70.addEventListener(WindowKeyboardEvent.const_157,this.checkEnterPress);
         this.var_70.addEventListener(WindowEvent.const_102,this.checkMaxLen);
         this.var_2349 = this.var_70.textBackground;
         this._orgTextBackgroundColor = this.var_70.textBackgroundColor;
         this.var_2348 = this.var_70.textColor;
      }
      
      public function checkMandatory(param1:String) : Boolean
      {
         if(!this.isInputValid())
         {
            this.displayError(param1);
            return false;
         }
         this.restoreBackground();
         return true;
      }
      
      public function restoreBackground() : void
      {
         this.var_70.textBackground = this.var_2349;
         this.var_70.textBackgroundColor = this._orgTextBackgroundColor;
         this.var_70.textColor = this.var_2348;
      }
      
      public function displayError(param1:String) : void
      {
         this.var_70.textBackground = true;
         this.var_70.textBackgroundColor = 4294021019;
         this.var_70.textColor = 4278190080;
         if(this.var_123 == null)
         {
            this.var_123 = IWindowContainer(this._navigator.getXmlWindow("nav_error_popup"));
            this._navigator.refreshButton(this.var_123,"popup_arrow_down",true,null,0);
            IWindowContainer(this.var_70.parent).addChild(this.var_123);
         }
         var _loc2_:ITextWindow = ITextWindow(this.var_123.findChildByName("error_text"));
         _loc2_.text = param1;
         _loc2_.width = _loc2_.textWidth + 5;
         this.var_123.findChildByName("border").width = _loc2_.width + 15;
         this.var_123.width = _loc2_.width + 15;
         var _loc3_:Point = new Point();
         this.var_70.getLocalPosition(_loc3_);
         this.var_123.x = _loc3_.x;
         this.var_123.y = _loc3_.y - this.var_123.height + 3;
         var _loc4_:IWindow = this.var_123.findChildByName("popup_arrow_down");
         _loc4_.x = this.var_123.width / 2 - _loc4_.width / 2;
         this.var_123.x += (this.var_70.width - this.var_123.width) / 2;
         this.var_123.visible = true;
      }
      
      public function goBackToInitialState() : void
      {
         this.clearErrors();
         if(this.var_1308 != null)
         {
            this.var_70.text = this.var_1308;
            this.var_586 = true;
         }
         else
         {
            this.var_70.text = "";
            this.var_586 = false;
         }
      }
      
      public function getText() : String
      {
         if(this.var_586)
         {
            return this.var_2347;
         }
         return this.var_70.text;
      }
      
      public function setText(param1:String) : void
      {
         this.var_586 = false;
         this.var_70.text = param1;
      }
      
      public function clearErrors() : void
      {
         this.restoreBackground();
         if(this.var_123 != null)
         {
            this.var_123.visible = false;
         }
      }
      
      public function get input() : ITextFieldWindow
      {
         return this.var_70;
      }
      
      private function isInputValid() : Boolean
      {
         return !this.var_586 && Util.trim(this.getText()).length > 2;
      }
      
      private function onInputClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowEvent.const_175)
         {
            return;
         }
         if(!this.var_586)
         {
            return;
         }
         this.var_70.text = this.var_2347;
         this.var_586 = false;
         this.restoreBackground();
      }
      
      private function checkEnterPress(param1:Event) : void
      {
         var _loc2_:IWindow = IWindow(param1.target);
         if(!(param1 is WindowKeyboardEvent))
         {
            return;
         }
         var _loc3_:WindowKeyboardEvent = WindowKeyboardEvent(param1);
         if(_loc3_.charCode == Keyboard.ENTER)
         {
            if(this.var_1672 != null)
            {
               this.var_1672();
            }
         }
      }
      
      private function checkMaxLen(param1:Event) : void
      {
         var _loc2_:String = this.var_70.text;
         if(_loc2_.length > this.var_1673)
         {
            this.var_70.text = _loc2_.substring(0,this.var_1673);
         }
      }
   }
}
