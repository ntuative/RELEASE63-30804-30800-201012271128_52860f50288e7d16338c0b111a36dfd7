package com.sulake.core.window.events
{
   import com.sulake.core.window.IWindow;
   import flash.events.Event;
   
   public class WindowEvent extends Event
   {
      
      public static const const_1354:String = "WE_CREATE";
      
      public static const const_1280:String = "WE_CREATED";
      
      public static const const_1379:String = "WE_DESTROY";
      
      public static const const_259:String = "WE_DESTROYED";
      
      public static const const_1376:String = "WE_OPEN";
      
      public static const const_1272:String = "WE_OPENED";
      
      public static const const_1531:String = "WE_CLOSE";
      
      public static const const_1414:String = "WE_CLOSED";
      
      public static const const_1312:String = "WE_FOCUS";
      
      public static const const_175:String = "WE_FOCUSED";
      
      public static const const_1437:String = "WE_UNFOCUS";
      
      public static const const_1421:String = "WE_UNFOCUSED";
      
      public static const const_1497:String = "WE_ACTIVATE";
      
      public static const const_1516:String = "WE_ACTIVATED";
      
      public static const const_1422:String = "WE_DEACTIVATE";
      
      public static const const_957:String = "WE_DEACTIVATED";
      
      public static const const_516:String = "WE_SELECT";
      
      public static const const_59:String = "WE_SELECTED";
      
      public static const const_586:String = "WE_UNSELECT";
      
      public static const const_733:String = "WE_UNSELECTED";
      
      public static const const_1656:String = "WE_ATTACH";
      
      public static const const_1722:String = "WE_ATTACHED";
      
      public static const const_1622:String = "WE_DETACH";
      
      public static const const_1684:String = "WE_DETACHED";
      
      public static const const_1275:String = "WE_LOCK";
      
      public static const const_1467:String = "WE_LOCKED";
      
      public static const const_1383:String = "WE_UNLOCK";
      
      public static const const_1343:String = "WE_UNLOCKED";
      
      public static const const_716:String = "WE_ENABLE";
      
      public static const const_291:String = "WE_ENABLED";
      
      public static const const_582:String = "WE_DISABLE";
      
      public static const const_224:String = "WE_DISABLED";
      
      public static const const_1410:String = "WE_RELOCATE";
      
      public static const const_319:String = "WE_RELOCATED";
      
      public static const const_1314:String = "WE_RESIZE";
      
      public static const const_44:String = "WE_RESIZED";
      
      public static const const_1433:String = "WE_MINIMIZE";
      
      public static const const_1333:String = "WE_MINIMIZED";
      
      public static const const_1332:String = "WE_MAXIMIZE";
      
      public static const const_1378:String = "WE_MAXIMIZED";
      
      public static const const_1327:String = "WE_RESTORE";
      
      public static const const_1503:String = "WE_RESTORED";
      
      public static const const_1639:String = "WE_ARRANGE";
      
      public static const const_1797:String = "WE_ARRANGED";
      
      public static const const_96:String = "WE_UPDATE";
      
      public static const const_1766:String = "WE_UPDATED";
      
      public static const const_1801:String = "WE_CHILD_RELOCATE";
      
      public static const const_513:String = "WE_CHILD_RELOCATED";
      
      public static const const_1744:String = "WE_CHILD_RESIZE";
      
      public static const const_263:String = "WE_CHILD_RESIZED";
      
      public static const const_1679:String = "WE_CHILD_REMOVE";
      
      public static const const_400:String = "WE_CHILD_REMOVED";
      
      public static const const_1645:String = "WE_PARENT_RELOCATE";
      
      public static const const_1646:String = "WE_PARENT_RELOCATED";
      
      public static const const_1613:String = "WE_PARENT_RESIZE";
      
      public static const const_1434:String = "WE_PARENT_RESIZED";
      
      public static const const_189:String = "WE_OK";
      
      public static const const_759:String = "WE_CANCEL";
      
      public static const const_102:String = "WE_CHANGE";
      
      public static const WINDOW_EVENT_MESSAGE:String = "WE_MESSAGE";
      
      public static const const_441:String = "WE_SCROLL";
      
      public static const const_155:String = "";
       
      
      protected var _type:String = "";
      
      protected var _window:IWindow;
      
      protected var var_1909:IWindow;
      
      protected var var_1910:Boolean;
      
      public function WindowEvent(param1:String, param2:IWindow, param3:IWindow, param4:Boolean = false, param5:Boolean = false)
      {
         this._type = param1;
         this._window = param2;
         this.var_1909 = param3;
         this.var_1910 = false;
         super(param1,param4,param5);
      }
      
      public function set type(param1:String) : void
      {
         this._type = param1;
      }
      
      override public function get type() : String
      {
         return this._type;
      }
      
      public function get window() : IWindow
      {
         return this._window;
      }
      
      public function get related() : IWindow
      {
         return this.var_1909;
      }
      
      override public function clone() : Event
      {
         return new WindowEvent(this._type,this.window,this.related,bubbles,cancelable);
      }
      
      public function preventWindowOperation() : void
      {
         if(cancelable)
         {
            this.var_1910 = true;
            stopImmediatePropagation();
            return;
         }
         throw new Error("Attempted to prevent window operation that is not canceable!");
      }
      
      public function isWindowOperationPrevented() : Boolean
      {
         return this.var_1910;
      }
      
      override public function toString() : String
      {
         return formatToString("WindowEvent","type","bubbles","cancelable","window");
      }
   }
}
