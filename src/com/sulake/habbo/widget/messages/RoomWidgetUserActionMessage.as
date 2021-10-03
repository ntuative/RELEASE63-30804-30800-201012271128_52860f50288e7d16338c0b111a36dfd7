package com.sulake.habbo.widget.messages
{
   public class RoomWidgetUserActionMessage extends RoomWidgetMessage
   {
      
      public static const const_667:String = "RWUAM_WHISPER_USER";
      
      public static const const_585:String = "RWUAM_IGNORE_USER";
      
      public static const const_769:String = "RWUAM_UNIGNORE_USER";
      
      public static const const_505:String = "RWUAM_KICK_USER";
      
      public static const const_632:String = "RWUAM_BAN_USER";
      
      public static const const_618:String = "RWUAM_SEND_FRIEND_REQUEST";
      
      public static const const_740:String = "RWUAM_RESPECT_USER";
      
      public static const const_670:String = "RWUAM_GIVE_RIGHTS";
      
      public static const const_592:String = "RWUAM_TAKE_RIGHTS";
      
      public static const const_815:String = "RWUAM_START_TRADING";
      
      public static const const_732:String = "RWUAM_OPEN_HOME_PAGE";
      
      public static const const_529:String = "RWUAM_KICK_BOT";
      
      public static const const_763:String = "RWUAM_REPORT";
      
      public static const const_535:String = "RWUAM_PICKUP_PET";
      
      public static const const_1287:String = "RWUAM_TRAIN_PET";
      
      public static const const_503:String = " RWUAM_RESPECT_PET";
      
      public static const const_347:String = "RWUAM_REQUEST_PET_UPDATE";
       
      
      private var _userId:int = 0;
      
      public function RoomWidgetUserActionMessage(param1:String, param2:int = 0)
      {
         super(param1);
         this._userId = param2;
      }
      
      public function get userId() : int
      {
         return this._userId;
      }
   }
}
