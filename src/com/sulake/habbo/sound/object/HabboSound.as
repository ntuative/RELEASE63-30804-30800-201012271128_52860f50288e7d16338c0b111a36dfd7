package com.sulake.habbo.sound.object
{
   import com.sulake.habbo.sound.IHabboSound;
   import flash.events.Event;
   import flash.media.Sound;
   import flash.media.SoundChannel;
   import flash.media.SoundTransform;
   
   public class HabboSound implements IHabboSound
   {
       
      
      private var var_971:Sound = null;
      
      private var _soundChannel:SoundChannel = null;
      
      private var var_482:Number;
      
      private var var_1215:Boolean;
      
      public function HabboSound(param1:Sound)
      {
         super();
         this.var_971 = param1;
         this.var_971.addEventListener(Event.COMPLETE,this.onComplete);
         this.var_482 = 1;
         this.var_1215 = false;
      }
      
      public function play() : Boolean
      {
         this.var_1215 = false;
         this._soundChannel = this.var_971.play(0);
         this.volume = this.var_482;
         return true;
      }
      
      public function stop() : Boolean
      {
         this._soundChannel.stop();
         return true;
      }
      
      public function get volume() : Number
      {
         return this.var_482;
      }
      
      public function set volume(param1:Number) : void
      {
         this.var_482 = param1;
         if(this._soundChannel != null)
         {
            this._soundChannel.soundTransform = new SoundTransform(this.var_482);
         }
      }
      
      public function get position() : Number
      {
         return this._soundChannel.position;
      }
      
      public function set position(param1:Number) : void
      {
      }
      
      public function get length() : Number
      {
         return this.var_971.length;
      }
      
      public function get ready() : Boolean
      {
         return !this.var_971.isBuffering;
      }
      
      public function get finished() : Boolean
      {
         return !this.var_1215;
      }
      
      private function onComplete(param1:Event) : void
      {
         this.var_1215 = true;
      }
   }
}
