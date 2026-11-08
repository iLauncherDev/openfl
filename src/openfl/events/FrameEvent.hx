package openfl.events;

import haxe.Int64;
import openfl.events.Event;
#if openfl_pool_events
import openfl.utils.ObjectPool;
#end

class FrameEvent extends Event
{
	public var deltaTime:Float;
	public var oldFrameTimestamp:Int64;
	public var currentFrameTimestamp:Int64;

	#if openfl_pool_events
	@:noCompletion private static var __pool:ObjectPool<FrameEvent> = new ObjectPool<FrameEvent>(function() return new FrameEvent(0, Int64.ofInt(0),
		Int64.ofInt(0)), function(event) event.__init());
	#end

	public function new(deltaTime:Float, oldFrameTimestamp:Int64, currentFrameTimestamp:Int64)
	{
		super(Event.ENTER_FRAME);

		this.deltaTime = deltaTime;
		this.oldFrameTimestamp = oldFrameTimestamp;
		this.currentFrameTimestamp = currentFrameTimestamp;
	}

	override public function clone():Event
	{
		return new FrameEvent(deltaTime, oldFrameTimestamp, currentFrameTimestamp);
	}
}
