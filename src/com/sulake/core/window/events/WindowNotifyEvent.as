package com.sulake.core.window.events
{
   import com.sulake.core.window.IWindow;
   import flash.events.Event;
   
   public class WindowNotifyEvent extends WindowEvent
   {
      
      public static const const_1338:String = "WN_CRETAE";
      
      public static const const_1352:String = "WN_CREATED";
      
      public static const const_1010:String = "WN_DESTROY";
      
      public static const const_914:String = "WN_DESTROYED";
      
      public static const const_1092:String = "WN_OPEN";
      
      public static const const_929:String = "WN_OPENED";
      
      public static const const_1113:String = "WN_CLOSE";
      
      public static const const_1013:String = "WN_CLOSED";
      
      public static const const_1064:String = "WN_FOCUS";
      
      public static const const_979:String = "WN_FOCUSED";
      
      public static const const_997:String = "WN_UNFOCUS";
      
      public static const const_1099:String = "WN_UNFOCUSED";
      
      public static const const_932:String = "WN_ACTIVATE";
      
      public static const const_338:String = "WN_ACTVATED";
      
      public static const const_928:String = "WN_DEACTIVATE";
      
      public static const const_1040:String = "WN_DEACTIVATED";
      
      public static const const_437:String = "WN_SELECT";
      
      public static const const_360:String = "WN_SELECTED";
      
      public static const const_723:String = "WN_UNSELECT";
      
      public static const const_565:String = "WN_UNSELECTED";
      
      public static const const_958:String = "WN_LOCK";
      
      public static const const_901:String = "WN_LOCKED";
      
      public static const const_1019:String = "WN_UNLOCK";
      
      public static const const_909:String = "WN_UNLOCKED";
      
      public static const const_1081:String = "WN_ENABLE";
      
      public static const const_645:String = "WN_ENABLED";
      
      public static const const_1075:String = "WN_DISABLE";
      
      public static const const_574:String = "WN_DISABLED";
      
      public static const const_684:String = "WN_RESIZE";
      
      public static const const_178:String = "WN_RESIZED";
      
      public static const const_991:String = "WN_RELOCATE";
      
      public static const const_445:String = "WN_RELOCATED";
      
      public static const const_964:String = "WN_MINIMIZE";
      
      public static const const_1039:String = "WN_MINIMIZED";
      
      public static const const_992:String = "WN_MAXIMIZE";
      
      public static const const_918:String = "WN_MAXIMIZED";
      
      public static const const_949:String = "WN_RESTORE";
      
      public static const const_1062:String = "WN_RESTORED";
      
      public static const const_1644:String = "WN_ARRANGE";
      
      public static const const_1629:String = "WN_ARRANGED";
      
      public static const const_1712:String = "WN_UPDATE";
      
      public static const const_1640:String = "WN_UPDATED";
      
      public static const const_354:String = "WN_CHILD_ADDED";
      
      public static const const_757:String = "WN_CHILD_REMOVED";
      
      public static const WINDOW_NOTIFY_CHILD_RESIZED:String = "WN_CHILD_RESIZED";
      
      public static const const_272:String = "WN_CHILD_RELOCATED";
      
      public static const const_244:String = "WN_CHILD_ACTIVATED";
      
      public static const const_522:String = "WN_PARENT_ADDED";
      
      public static const const_976:String = "WN_PARENT_REMOVED";
      
      public static const const_520:String = "WN_PARENT_RESIZED";
      
      public static const const_1089:String = "WN_PARENT_RELOCATED";
      
      public static const const_729:String = "WN_PARENT_ACTIVATED";
      
      public static const const_424:String = "WN_STATE_UPDATED";
      
      public static const const_430:String = "WN_STYLE_UPDATED";
      
      public static const const_413:String = "WN_PARAM_UPDATED";
      
      public static const const_1637:String = "";
       
      
      public function WindowNotifyEvent(param1:String, param2:IWindow, param3:IWindow, param4:Boolean = false)
      {
         super(param1,param2,param3,false,param4);
      }
      
      override public function clone() : Event
      {
         return new WindowNotifyEvent(type,_window,var_1909,cancelable);
      }
      
      override public function toString() : String
      {
         return formatToString("WindowNotifyEvent","type","cancelable");
      }
   }
}
