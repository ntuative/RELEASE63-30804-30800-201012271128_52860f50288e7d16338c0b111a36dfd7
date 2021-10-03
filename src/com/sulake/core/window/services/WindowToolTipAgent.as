package com.sulake.core.window.services
{
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.components.IInteractiveWindow;
   import com.sulake.core.window.components.IToolTipWindow;
   import com.sulake.core.window.enum.WindowParam;
   import com.sulake.core.window.enum.WindowType;
   import flash.display.DisplayObject;
   import flash.events.TimerEvent;
   import flash.geom.Point;
   import flash.utils.Timer;
   
   public class WindowToolTipAgent extends WindowMouseOperator implements IToolTipAgentService
   {
       
      
      protected var var_1189:String;
      
      protected var var_259:IToolTipWindow;
      
      protected var var_355:Timer;
      
      protected var var_1191:Point;
      
      protected var var_1190:Point;
      
      protected var var_1437:uint;
      
      public function WindowToolTipAgent(param1:DisplayObject)
      {
         this.var_1190 = new Point();
         this.var_1191 = new Point(20,20);
         this.var_1437 = 500;
         super(param1);
      }
      
      override public function begin(param1:IWindow, param2:uint = 0) : IWindow
      {
         if(param1 && !param1.disposed)
         {
            if(param1 is IInteractiveWindow)
            {
               this.var_1189 = IInteractiveWindow(param1).toolTipCaption;
               this.var_1437 = IInteractiveWindow(param1).toolTipDelay;
            }
            else
            {
               this.var_1189 = param1.caption;
               this.var_1437 = 500;
            }
            _mouse.x = var_133.mouseX;
            _mouse.y = var_133.mouseY;
            getMousePositionRelativeTo(param1,_mouse,this.var_1190);
            if(this.var_1189 != null && this.var_1189 != "")
            {
               if(this.var_355 == null)
               {
                  this.var_355 = new Timer(this.var_1437,1);
                  this.var_355.addEventListener(TimerEvent.TIMER,this.showToolTip);
               }
               this.var_355.reset();
               this.var_355.start();
            }
         }
         return super.begin(param1,param2);
      }
      
      override public function end(param1:IWindow) : IWindow
      {
         if(this.var_355 != null)
         {
            this.var_355.stop();
            this.var_355.removeEventListener(TimerEvent.TIMER,this.showToolTip);
            this.var_355 = null;
         }
         this.hideToolTip();
         return super.end(param1);
      }
      
      override public function operate(param1:int, param2:int) : void
      {
         if(_window && true)
         {
            _mouse.x = param1;
            _mouse.y = param2;
            getMousePositionRelativeTo(_window,_mouse,this.var_1190);
            if(this.var_259 != null && !this.var_259.disposed)
            {
               this.var_259.x = param1 + this.var_1191.x;
               this.var_259.y = param2 + this.var_1191.y;
            }
         }
      }
      
      protected function showToolTip(param1:TimerEvent) : void
      {
         var _loc2_:* = null;
         if(this.var_355 != null)
         {
            this.var_355.reset();
         }
         if(_window && true)
         {
            if(this.var_259 == null || this.var_259.disposed)
            {
               this.var_259 = _window.context.create("undefined::ToolTip",this.var_1189,WindowType.const_330,_window.style,0 | 0,null,null,null,0,null,null) as IToolTipWindow;
            }
            _loc2_ = new Point();
            _window.getGlobalPosition(_loc2_);
            this.var_259.x = _loc2_.x + this.var_1190.x + this.var_1191.x;
            this.var_259.y = _loc2_.y + this.var_1190.y + this.var_1191.y;
         }
      }
      
      protected function hideToolTip() : void
      {
         if(this.var_259 != null && !this.var_259.disposed)
         {
            this.var_259.destroy();
            this.var_259 = null;
         }
      }
   }
}
