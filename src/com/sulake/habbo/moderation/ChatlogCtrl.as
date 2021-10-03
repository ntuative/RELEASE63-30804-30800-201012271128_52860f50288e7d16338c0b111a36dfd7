package com.sulake.habbo.moderation
{
   import com.sulake.core.communication.messages.IMessageComposer;
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.utils.Map;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IFrameWindow;
   import com.sulake.core.window.components.IItemListWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.communication.messages.incoming.moderation.ChatlineData;
   import com.sulake.habbo.communication.messages.incoming.moderation.RoomChatlogData;
   import flash.events.TimerEvent;
   import flash.utils.Dictionary;
   import flash.utils.Timer;
   
   public class ChatlogCtrl implements IDisposable, TrackedWindow
   {
       
      
      private var _type:int;
      
      private var _id:int;
      
      private var var_1782:IMessageComposer;
      
      private var var_43:ModerationManager;
      
      private var _frame:IFrameWindow;
      
      private var var_52:IItemListWindow;
      
      private var var_104:Array;
      
      private var _disposed:Boolean;
      
      private var var_1121:IWindowContainer;
      
      private var var_1120:IWindowContainer;
      
      private var var_1781:Dictionary;
      
      private var var_403:Timer;
      
      private var var_1391:Map;
      
      public function ChatlogCtrl(param1:IMessageComposer, param2:ModerationManager, param3:int, param4:int)
      {
         super();
         this.var_43 = param2;
         this._type = param3;
         this._id = param4;
         this.var_1782 = param1;
         this.var_1391 = new Map();
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function show() : void
      {
         this.var_1121 = IWindowContainer(this.var_43.getXmlWindow("chatlog_roomheader"));
         this.var_1120 = IWindowContainer(this.var_43.getXmlWindow("chatlog_chatline"));
         this.var_403 = new Timer(1000,1);
         this.var_403.addEventListener(TimerEvent.TIMER,this.onResizeTimer);
         this._frame = IFrameWindow(this.var_43.getXmlWindow("chatlog_frame"));
         this.var_52 = IItemListWindow(this._frame.findChildByName("chatline_list"));
         this._frame.procedure = this.onWindow;
         var _loc1_:IWindow = this._frame.findChildByTag("close");
         _loc1_.procedure = this.onClose;
         this.var_43.connection.send(this.var_1782);
         this.var_43.messageHandler.addChatlogListener(this);
      }
      
      public function onChatlog(param1:String, param2:int, param3:int, param4:Array, param5:Dictionary) : void
      {
         if(param2 != this._type || param3 != this._id || this._disposed)
         {
            return;
         }
         this.var_43.messageHandler.removeChatlogListener(this);
         this._frame.caption = param1;
         this.var_104 = param4;
         this.var_1781 = param5;
         this.populate();
         this.onResizeTimer(null);
         this._frame.visible = true;
      }
      
      public function getType() : int
      {
         return this._type;
      }
      
      public function getId() : String
      {
         return "" + this._id;
      }
      
      public function getFrame() : IFrameWindow
      {
         return this._frame;
      }
      
      private function populate() : void
      {
         var _loc1_:* = null;
         this.var_52.autoArrangeItems = false;
         for each(_loc1_ in this.var_104)
         {
            this.populateRoomChat(_loc1_);
         }
         this.var_52.autoArrangeItems = true;
      }
      
      private function populateRoomChat(param1:RoomChatlogData) : void
      {
         var _loc5_:* = null;
         var _loc2_:IWindowContainer = IWindowContainer(this.var_1121.clone());
         var _loc3_:ITextWindow = ITextWindow(_loc2_.findChildByName("room_name_txt"));
         if(param1.roomId > 0)
         {
            _loc3_.caption = param1.roomName;
            new OpenRoomTool(this._frame,this.var_43,_loc3_,param1.isPublic,param1.roomId);
         }
         else
         {
            _loc3_.caption = "Not in room";
            _loc3_.underline = false;
         }
         this.var_52.addListItem(_loc2_);
         var _loc4_:* = true;
         for each(_loc5_ in param1.chatlog)
         {
            this.populateChatline(this.var_52,_loc5_,_loc4_);
            _loc4_ = !_loc4_;
         }
      }
      
      private function populateChatline(param1:IItemListWindow, param2:ChatlineData, param3:Boolean) : void
      {
         var _loc4_:IWindowContainer = IWindowContainer(this.var_1120.clone());
         _loc4_.color = this.var_1781[param2.chatterId] != null ? (!!param3 ? 4294623571 : uint(4294959680)) : (!!param3 ? 4288861930 : uint(4294967295));
         var _loc5_:ITextWindow = ITextWindow(_loc4_.findChildByName("time_txt"));
         _loc5_.text = RoomVisitsCtrl.getFormattedTime(param2.hour,param2.minute);
         var _loc6_:ITextWindow = ITextWindow(_loc4_.findChildByName("chatter_txt"));
         _loc6_.color = _loc4_.color;
         if(param2.chatterId > 0)
         {
            _loc6_.text = param2.chatterName;
            _loc6_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,this.onChatLogUserClick);
            if(!this.var_1391.getValue(param2.chatterName))
            {
               this.var_1391.add(param2.chatterName,param2.chatterId);
            }
         }
         else if(param2.chatterId == 0)
         {
            _loc6_.text = "Bot / pet";
            _loc6_.underline = false;
         }
         else
         {
            _loc6_.text = "-";
            _loc6_.underline = false;
         }
         var _loc7_:ITextWindow = ITextWindow(_loc4_.findChildByName("msg_txt"));
         _loc7_.text = param2.msg;
         _loc7_.height = _loc7_.textHeight + 5;
         _loc4_.height = _loc7_.height;
         param1.addListItem(_loc4_);
      }
      
      private function onChatLogUserClick(param1:WindowMouseEvent) : void
      {
         var _loc2_:String = param1.target.caption;
         var _loc3_:int = this.var_1391.getValue(_loc2_);
         this.var_43.windowTracker.show(new UserInfoFrameCtrl(this.var_43,_loc3_),this._frame,false,false,true);
      }
      
      private function onClose(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         this.dispose();
      }
      
      private function onWindow(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowEvent.const_44 || param2 != this._frame)
         {
            return;
         }
         this.var_403.reset();
         this.var_403.start();
      }
      
      private function onResizeTimer(param1:TimerEvent) : void
      {
         this.refreshListDims();
         var _loc2_:Boolean = this.refreshScrollBarVisibility();
      }
      
      private function refreshListDims() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         this.var_52.autoArrangeItems = false;
         var _loc3_:int = this.var_52.numListItems;
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            _loc1_ = IWindowContainer(this.var_52.getListItemAt(_loc4_));
            if(_loc1_.name == "chatline")
            {
               _loc2_ = ITextWindow(_loc1_.findChildByName("msg_txt"));
               _loc2_.width = _loc1_.width - _loc2_.x;
               _loc2_.height = _loc2_.textHeight + 5;
               _loc1_.height = _loc2_.height;
            }
            _loc4_++;
         }
         this.var_52.autoArrangeItems = true;
      }
      
      private function refreshScrollBarVisibility() : Boolean
      {
         var _loc1_:IWindowContainer = IWindowContainer(this.var_52.parent);
         var _loc2_:IWindow = _loc1_.getChildByName("scroller") as IWindow;
         var _loc3_:* = this.var_52.scrollableRegion.height > this.var_52.height;
         if(_loc2_.visible)
         {
            if(_loc3_)
            {
               return false;
            }
            _loc2_.visible = false;
            this.var_52.width += 22;
            return true;
         }
         if(_loc3_)
         {
            _loc2_.visible = true;
            this.var_52.width -= 22;
            return true;
         }
         return false;
      }
      
      public function dispose() : void
      {
         if(this._disposed)
         {
            return;
         }
         this._disposed = true;
         this.var_43 = null;
         this.var_1782 = null;
         if(this._frame != null)
         {
            this._frame.destroy();
            this._frame = null;
         }
         if(this.var_52 != null)
         {
            this.var_52.dispose();
            this.var_52 = null;
         }
         if(this.var_1121 != null)
         {
            this.var_1121.dispose();
            this.var_1121 = null;
         }
         if(this.var_1120 != null)
         {
            this.var_1120.dispose();
            this.var_1120 = null;
         }
         this.var_104 = null;
         this.var_1781 = null;
         if(this.var_403 != null)
         {
            this.var_403.stop();
            this.var_403 = null;
         }
         if(this.var_403)
         {
            this.var_403.stop();
            this.var_403 = null;
         }
      }
   }
}
