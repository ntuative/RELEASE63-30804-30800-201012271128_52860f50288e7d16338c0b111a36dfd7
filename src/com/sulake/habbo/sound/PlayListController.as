package com.sulake.habbo.sound
{
   import com.sulake.core.communication.connection.IConnection;
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.utils.Map;
   import com.sulake.habbo.communication.messages.incoming.sound.PlayListEntry;
   import com.sulake.habbo.communication.messages.incoming.sound.PlayListMessageEvent;
   import com.sulake.habbo.communication.messages.incoming.sound.PlayListSongAddedMessageEvent;
   import com.sulake.habbo.communication.messages.incoming.sound.TraxSongInfoMessageEvent;
   import com.sulake.habbo.communication.messages.outgoing.sound.GetPlayListMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.sound.GetSongInfoMessageComposer;
   import com.sulake.habbo.communication.messages.parser.sound.PlayListMessageParser;
   import com.sulake.habbo.communication.messages.parser.sound.PlayListSongAddedMessageParser;
   import com.sulake.habbo.communication.messages.parser.sound.TraxSongInfoMessageParser;
   import com.sulake.habbo.room.events.RoomObjectSoundMachineStateUpdateEvent;
   import com.sulake.habbo.sound.events.SoundCompleteEvent;
   import flash.events.Event;
   import flash.events.IEventDispatcher;
   
   public class PlayListController implements IDisposable
   {
       
      
      private const const_1871:String = "type_sound_machine";
      
      private const const_1587:String = "type_jukebox";
      
      private var var_533:HabboSoundManagerFlash10;
      
      private var _connection:IConnection;
      
      private var _events:IEventDispatcher;
      
      private var var_89:IEventDispatcher;
      
      private var var_286:int = -1;
      
      private var var_76:Array;
      
      private var var_404:Map;
      
      private var var_603:Array;
      
      private var var_906:Boolean;
      
      private var var_1788:String = "";
      
      private var _disposed:Boolean = false;
      
      public function PlayListController(param1:HabboSoundManagerFlash10, param2:IEventDispatcher, param3:IEventDispatcher, param4:IConnection)
      {
         this.var_76 = new Array();
         this.var_404 = new Map();
         this.var_603 = new Array();
         super();
         this.var_533 = param1;
         this._events = param2;
         this.var_89 = param3;
         this._connection = param4;
         this._connection.addMessageEvent(new PlayListMessageEvent(this.onPlayListMessage));
         this._connection.addMessageEvent(new TraxSongInfoMessageEvent(this.onSongInfoMessage));
         this._connection.addMessageEvent(new PlayListSongAddedMessageEvent(this.onPlayListSongAddedMessage));
         this._events.addEventListener(SoundCompleteEvent.const_801,this.onSongFinishedPlayingEvent);
         this.var_89.addEventListener(RoomObjectSoundMachineStateUpdateEvent.const_766,this.onSoundMachinePlayEvent);
         this.var_89.addEventListener(RoomObjectSoundMachineStateUpdateEvent.const_599,this.onSoundMachineStopEvent);
         this.var_89.addEventListener(RoomObjectSoundMachineStateUpdateEvent.const_598,this.onJukeboxInitEvent);
         this.var_89.addEventListener(RoomObjectSoundMachineStateUpdateEvent.const_533,this.onDisposeEvent);
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function dispose() : void
      {
         if(!this._disposed)
         {
            if(this.var_906)
            {
               this.stopPlaying();
            }
            this.var_533 = null;
            this._connection = null;
            this.var_76 = null;
            this.var_603 = null;
            if(this._events)
            {
               this._events.removeEventListener(SoundCompleteEvent.const_801,this.onSongFinishedPlayingEvent);
               this._events = null;
            }
            if(this.var_89)
            {
               this.var_89.removeEventListener(RoomObjectSoundMachineStateUpdateEvent.const_766,this.onSoundMachinePlayEvent);
               this.var_89.removeEventListener(RoomObjectSoundMachineStateUpdateEvent.const_599,this.onSoundMachineStopEvent);
               this.var_89.removeEventListener(RoomObjectSoundMachineStateUpdateEvent.const_598,this.onJukeboxInitEvent);
               this.var_89.removeEventListener(RoomObjectSoundMachineStateUpdateEvent.const_533,this.onDisposeEvent);
               this.var_89 = null;
            }
            if(this.var_404)
            {
               this.var_404.dispose();
               this.var_404 = null;
            }
            this._disposed = true;
         }
      }
      
      private function onSoundMachinePlayEvent(param1:Event) : void
      {
         this.startPlaying(this.const_1871);
      }
      
      private function onSoundMachineStopEvent(param1:Event) : void
      {
         this.stopPlaying();
      }
      
      private function onJukeboxInitEvent(param1:Event) : void
      {
         this.startPlaying(this.const_1587);
      }
      
      private function onDisposeEvent(param1:Event) : void
      {
         this.stopPlaying();
         this.var_76 = new Array();
         this.var_603 = new Array();
      }
      
      public function startPlaying(param1:String) : void
      {
         if(this.var_906)
         {
            return;
         }
         this.var_1788 = param1;
         if(this.var_76 == null || this.var_76.length == 0)
         {
            this.requestPlayList();
            this.var_906 = true;
            return;
         }
         this.stopPlaying();
         this.var_286 = -1;
         this.var_906 = true;
         var _loc2_:PlayListEntry = this.getNextEntry();
         if(_loc2_ != null)
         {
            this.var_286 = _loc2_.id;
            this.playSong(this.var_286);
         }
      }
      
      public function checkSongPlayState(param1:int) : void
      {
         if(this.var_286 == param1)
         {
            this.playSong(this.var_286);
         }
      }
      
      public function stopPlaying() : void
      {
         var _loc1_:IHabboSound = this.var_404[this.var_286] as IHabboSound;
         if(_loc1_ != null)
         {
            _loc1_.stop();
         }
         this.var_286 = -1;
         this.var_906 = false;
         this.var_1788 = "";
      }
      
      public function updateVolume(param1:Number) : void
      {
         var _loc2_:IHabboSound = this.var_404.getValue(this.var_286) as IHabboSound;
         if(_loc2_ == null)
         {
            return;
         }
         _loc2_.volume = param1;
      }
      
      private function playSong(param1:int) : void
      {
         var _loc6_:* = null;
         this.var_286 = param1;
         var _loc2_:IHabboSound = this.var_404.getValue(param1) as IHabboSound;
         if(_loc2_ == null)
         {
            this.requestSongInfo(param1);
            return;
         }
         if(!_loc2_.ready)
         {
            return;
         }
         var _loc3_:PlayListEntry = this.getEntry(param1);
         if(_loc3_ == null)
         {
            return;
         }
         _loc2_.position = _loc3_.startPlayHeadPos;
         _loc3_.startPlayHeadPos = 0;
         _loc2_.volume = this.var_533.volume;
         _loc2_.play();
         if(_loc3_.length >= 4)
         {
            this.var_533.notifyPlayedSong(_loc3_.name,_loc3_.creator);
         }
         var _loc5_:PlayListEntry = this.getNextEntry();
         if(_loc5_ != null && _loc5_.id != this.var_286)
         {
            _loc6_ = this.var_404[_loc5_.id] as IHabboSound;
            if(_loc6_ == null)
            {
               this.requestSongInfo(_loc5_.id);
            }
         }
         Logger.log("Playing trax song: " + _loc3_.name + " by " + _loc3_.creator);
      }
      
      private function onSongFinishedPlayingEvent(param1:Event) : void
      {
         if(this.var_1788 == this.const_1587)
         {
            this.var_76.shift();
         }
         var _loc2_:PlayListEntry = this.getNextEntry();
         if(_loc2_ != null)
         {
            this.playSong(_loc2_.id);
         }
      }
      
      private function getNextEntry() : PlayListEntry
      {
         var _loc2_:* = null;
         if(this.var_76 == null || this.var_76.length == 0)
         {
            return null;
         }
         var _loc1_:int = 0;
         var _loc3_:int = 0;
         while(_loc3_ < this.var_76.length)
         {
            _loc2_ = this.var_76[_loc3_];
            if(_loc2_.id == this.var_286)
            {
               _loc1_ = _loc3_ + 1;
            }
            _loc3_++;
         }
         if(_loc1_ >= this.var_76.length)
         {
            _loc1_ = 0;
         }
         return this.var_76[_loc1_];
      }
      
      private function getEntry(param1:int) : PlayListEntry
      {
         var _loc2_:* = null;
         if(this.var_76 == null || this.var_76.length == 0)
         {
            return null;
         }
         var _loc3_:int = 0;
         while(_loc3_ < this.var_76.length)
         {
            _loc2_ = this.var_76[_loc3_];
            if(_loc2_.id == param1)
            {
               return _loc2_;
            }
            _loc3_++;
         }
         return null;
      }
      
      private function requestPlayList() : void
      {
         if(this._connection == null)
         {
            return;
         }
         this._connection.send(new GetPlayListMessageComposer());
      }
      
      private function onPlayListMessage(param1:IMessageEvent) : void
      {
         var _loc6_:* = null;
         var _loc8_:int = 0;
         var _loc2_:PlayListMessageEvent = param1 as PlayListMessageEvent;
         var _loc3_:PlayListMessageParser = _loc2_.getParser() as PlayListMessageParser;
         var _loc4_:int = _loc3_.synchronizationCount;
         var _loc5_:Array = _loc3_.playList;
         if(_loc5_ == null || _loc5_.length == 0)
         {
            return;
         }
         this.var_76 = _loc5_;
         var _loc7_:int = 0;
         _loc8_ = 0;
         while(_loc8_ < _loc5_.length)
         {
            _loc6_ = this.var_76[_loc8_];
            _loc7_ += _loc6_.length;
            _loc8_++;
         }
         _loc4_ %= _loc7_;
         _loc8_ = 0;
         while(_loc8_ < _loc5_.length)
         {
            _loc6_ = this.var_76[_loc8_];
            if(_loc4_ <= _loc6_.length)
            {
               this.var_286 = _loc6_.id;
               _loc6_.startPlayHeadPos = _loc4_;
            }
            _loc4_ -= _loc6_.length;
            _loc8_++;
         }
         if(_loc6_ != null && this.var_906)
         {
            this.playSong(_loc6_.id);
         }
      }
      
      private function requestSongInfo(param1:int) : void
      {
         if(this._connection == null)
         {
            return;
         }
         this._connection.send(new GetSongInfoMessageComposer(param1));
         if(this.var_603.indexOf(param1) == -1)
         {
            this.var_603.push(param1);
         }
      }
      
      private function onSongInfoMessage(param1:IMessageEvent) : void
      {
         var _loc5_:int = 0;
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc2_:TraxSongInfoMessageEvent = param1 as TraxSongInfoMessageEvent;
         var _loc3_:TraxSongInfoMessageParser = _loc2_.getParser() as TraxSongInfoMessageParser;
         var _loc4_:Boolean = true;
         if(_loc3_.data == "")
         {
            _loc5_ = 0;
            while(_loc5_ < this.var_76.length)
            {
               _loc6_ = this.var_76[_loc5_] as PlayListEntry;
               if(_loc6_.id == _loc3_.id)
               {
                  this.var_76.splice(_loc5_,1);
                  _loc4_ = false;
                  break;
               }
               _loc5_++;
            }
         }
         this.var_603 = this.var_603.splice(this.var_603.indexOf(_loc3_.id),1);
         if(_loc4_)
         {
            _loc7_ = this.var_404[_loc3_.id] as IHabboSound;
            if(_loc7_ == null)
            {
               _loc7_ = this.var_533.loadTraxSong(_loc3_.id,_loc3_.data);
               this.var_404.add(_loc3_.id,_loc7_);
            }
            this.checkSongPlayState(_loc3_.id);
         }
      }
      
      private function onPlayListSongAddedMessage(param1:IMessageEvent) : void
      {
         var _loc2_:PlayListSongAddedMessageEvent = param1 as PlayListSongAddedMessageEvent;
         var _loc3_:PlayListSongAddedMessageParser = _loc2_.getParser() as PlayListSongAddedMessageParser;
         var _loc4_:PlayListEntry = _loc3_.entry;
         if(_loc4_ == null)
         {
            return;
         }
         this.var_76.push(_loc4_);
         if(this.var_76.length == 1)
         {
            this.playSong(_loc4_.id);
         }
         else
         {
            this.checkSongPlayState(_loc4_.id);
         }
      }
   }
}
